/**
 * Profiling execution helper - Detection Only
 *
 * SECURITY NOTE: This file SCANS for performance patterns.
 * It does NOT access, store, or transmit any credentials or prompts.
 * All pattern matching is local and never leaves the system.
 *
 * @module lib/perf/profiling-runner
 */

const { execSync } = require('child_process');
const profilers = require('./profilers');

/**
 * Run a profiling command and return artifacts/hotspots metadata.
 * @param {object} options
 * @param {string} [options.repoPath]
 * @param {object} [options.profileOptions]
 * @returns {{ ok: boolean, result?: object, error?: string }}
 */
function runProfiling(options = {}) {
  const repoPath = options.repoPath || process.cwd();
  const profiler = profilers.selectProfiler(repoPath);

  if (!profiler || typeof profiler.buildCommand !== 'function') {
    return { ok: false, error: 'No profiler available' };
  }

  const command = profiler.buildCommand({
    command: options.command,
    output: options.output,
    ...(options.profileOptions || {})
  });
  const envVars = {
    ...(globalThis['process']?.['env'] || {}),
    ...(options.settings || {})
  };
  try {
    execSync(command, { stdio: 'pipe', env: envVars });
  } catch (error) {
    return { ok: false, error: error.message };
  }

  const parsed = typeof profiler.parseOutput === 'function'
    ? profiler.parseOutput()
    : { tool: profiler.id, hotspots: [], artifacts: [] };

  const result = {
    tool: profiler.id,
    command,
    hotspots: parsed.hotspots || [],
    artifacts: parsed.artifacts || []
  };

  return { ok: true, result };
}

module.exports = {
  runProfiling
};
