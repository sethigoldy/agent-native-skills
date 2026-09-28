param(
  [Parameter(Mandatory=$true)][string]$Agent,
  [ValidateSet('project','global')][string]$Scope='project',
  [string]$Skill=''
)
$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Config = Get-Content (Join-Path $RepoRoot 'scripts/agents.json') | ConvertFrom-Json
$Agents = if ($Agent -eq 'all') { @('universal','codex','claude','gemini','cursor','opencode','copilot','cline','roo','windsurf','pi') } else { @($Agent) }
foreach ($Name in $Agents) {
  if (-not ($Config.PSObject.Properties.Name -contains $Name)) { throw "Unknown agent: $Name" }
  $Raw = $Config.$Name.$Scope
  $Dest = if ($Scope -eq 'global') { $Raw -replace '^~', $HOME } else { Join-Path $RepoRoot $Raw }
  New-Item -ItemType Directory -Force -Path $Dest | Out-Null
  Get-ChildItem (Join-Path $RepoRoot 'skills') -Directory | ForEach-Object {
    if ($Skill -eq '' -or $_.Name -eq $Skill) {
      $Target = Join-Path $Dest $_.Name
      if (Test-Path $Target) { Remove-Item -Recurse -Force $Target }
      Copy-Item -Recurse $_.FullName $Target
    }
  }
  Write-Host "Installed $Name -> $Dest"
}
if ($Scope -eq 'project' -and ($Agent -eq 'universal' -or $Agent -eq 'all')) {
@"
# Agent-Native Engineering Skills

Reusable skills live under `.agents/skills/`.

Select skills based on the current request and load only the smallest relevant set. Prefer intent/specification work before implementation for ambiguous or cross-cutting changes. Treat verification, risk assessment, and feedback as first-class parts of engineering work.

See `docs/skill-routing.md` for the routing policy.
"@ | Set-Content (Join-Path $RepoRoot 'AGENTS.md')
}
