# scan-skills.ps1 — enumerate skill files, extract frontmatter and UTC mtime
# PowerShell equivalent of scan-skills.sh

param(
    [string]$CwdSkillsDir = "$PSScriptRoot\..\..\.."
)

$ErrorActionPreference = "Stop"

# Function to extract frontmatter field
function Extract-Field {
    param(
        [string]$File,
        [string]$Field
    )
    
    $content = Get-Content $File -Raw
    $lines = $content -split "`n"
    $inFrontmatter = $false
    $frontmatterCount = 0
    
    foreach ($line in $lines) {
        if ($line -match '^---$') {
            $frontmatterCount++
            if ($frontmatterCount -ge 2) { break }
            continue
        }
        
        if ($frontmatterCount -eq 1) {
            if ($line -match "^${Field}:\s*`"?(.+?)`"?\s*$") {
                return $Matches[1]
            }
        }
    }
    
    return ""
}

# Function to get file mtime in UTC ISO8601
function Get-MTime {
    param([string]$File)
    
    $mtime = (Get-Item $File).LastWriteTimeUtc
    return $mtime.ToString("yyyy-MM-ddTHH:mm:ssZ")
}

# Scan directory for SKILL.md files
function Scan-DirToJson {
    param([string]$Dir)
    
    $skills = @()
    $skillFiles = Get-ChildItem -Path $Dir -Filter "SKILL.md" -Recurse -File -ErrorAction SilentlyContinue | Sort-Object FullName
    
    foreach ($file in $skillFiles) {
        $name = Extract-Field -File $file.FullName -Field "name"
        $desc = Extract-Field -File $file.FullName -Field "description"
        $mtime = Get-MTime -File $file.FullName
        $path = $file.FullName.Replace($env:USERPROFILE, "~")
        
        $skills += @{
            path = $path
            name = $name
            description = $desc
            mtime = $mtime
        }
    }
    
    return $skills
}

# Main execution
$globalDir = "$env:USERPROFILE\.agents\skills"
$projectDir = $CwdSkillsDir

$globalFound = $false
$globalCount = 0
$globalSkills = @()

if (Test-Path $globalDir) {
    $globalFound = $true
    $globalSkills = Scan-DirToJson -Dir $globalDir
    $globalCount = $globalSkills.Count
}

$projectFound = $false
$projectPath = ""
$projectCount = 0
$projectSkills = @()

if ($projectDir -and (Test-Path $projectDir)) {
    $projectFound = $true
    $projectPath = $projectDir
    $projectSkills = Scan-DirToJson -Dir $projectDir
    $projectCount = $projectSkills.Count
}

# Merge skills
$allSkills = $globalSkills + $projectSkills

# Create output object
$output = @{
    scan_summary = @{
        global = @{
            found = $globalFound
            count = $globalCount
        }
        project = @{
            found = $projectFound
            path = $projectPath
            count = $projectCount
        }
    }
    skills = $allSkills
}

# Output as JSON
$output | ConvertTo-Json -Depth 10
