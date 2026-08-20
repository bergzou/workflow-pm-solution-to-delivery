# Workflow Install Script (OpenCode / Windows PowerShell)
# Usage: .\installWin.ps1

$ErrorActionPreference = "Stop"

$WORKFLOW_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_ROOT = Split-Path -Parent $WORKFLOW_DIR

Write-Host "Installing Workflow..."

New-Item -ItemType Directory -Force -Path "$PROJECT_ROOT\.opencode\agents" | Out-Null
Copy-Item "$WORKFLOW_DIR\agents\*.md" -Destination "$PROJECT_ROOT\.opencode\agents\" -Force
Write-Host "  agents/ -> .opencode/agents/"

if (Test-Path "$PROJECT_ROOT\.opencode\skills") {
    Remove-Item "$PROJECT_ROOT\.opencode\skills" -Recurse -Force
}
New-Item -ItemType Directory -Force -Path "$PROJECT_ROOT\.opencode\skills" | Out-Null
Copy-Item "$WORKFLOW_DIR\skills\*" -Destination "$PROJECT_ROOT\.opencode\skills\" -Recurse -Force
Write-Host "  skills/ -> .opencode/skills/"

if (Test-Path "$PROJECT_ROOT\.opencode\tools") {
    Remove-Item "$PROJECT_ROOT\.opencode\tools" -Recurse -Force
}
New-Item -ItemType Directory -Force -Path "$PROJECT_ROOT\.opencode\tools" | Out-Null
Copy-Item "$WORKFLOW_DIR\tools\*" -Destination "$PROJECT_ROOT\.opencode\tools\" -Recurse -Force
Write-Host "  tools/ -> .opencode/tools/"

$Adapters = @(
    @{ Src = "dingtalk-prd-publisher\runtime-adapter"; Name = "dingtalk-prd-publisher" },
    @{ Src = "yunxiao-work-item-publisher\runtime-adapter"; Name = "yunxiao-work-item-publisher" }
)
foreach ($a in $Adapters) {
    Copy-Item "$WORKFLOW_DIR\tools\$($a.Src)" -Destination "$PROJECT_ROOT\.opencode\skills\$($a.Name)" -Recurse -Force
}
Write-Host "  runtime-adapters -> .opencode/skills/ (opencode discoverable)"

Copy-Item "$WORKFLOW_DIR\opencode.json" -Destination "$PROJECT_ROOT\.opencode\" -Force
Write-Host "  opencode.json -> .opencode/"

Copy-Item "$WORKFLOW_DIR\AGENTS.md" -Destination "$PROJECT_ROOT\.opencode\" -Force
Write-Host "  AGENTS.md -> .opencode/"

Write-Host "Done. Reload OpenCode to activate."
