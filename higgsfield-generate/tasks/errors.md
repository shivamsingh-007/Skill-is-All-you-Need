<purpose>
Handle common errors during higgsfield generate operations.
</purpose>

<when-to-use>
- CLI returns an error
- Authentication failure
- Model or parameter issues
</when-to-use>

<steps>

<step name="handle_errors">
Read the error message and respond:

- `Missing required params: prompt` → User gave no prompt. Ask for it.
- `Missing required params: medias` on `brain_activity` → Pass exactly one video via `--video <path-or-id>`.
- `Invalid values: aspect_ratio=99:99 (allowed: ...)` → Bad enum. Pick from allowed values.
- `Unknown params: foo` → Schema doesn't accept that flag. Check `higgsfield model get <jst>`. If this happens for `hook_id` or `setting_id`, the selected model does not support Marketing Studio setup items.
- `Session expired` → Ask user to run `higgsfield auth login`.
</step>

</steps>

<acceptance-criteria>
- [ ] Error type identified
- [ ] Correct remediation communicated
</acceptance-criteria>
