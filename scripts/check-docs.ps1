$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$errors = [System.Collections.Generic.List[string]]::new()

$requiredPaths = @(
    "AGENTS.md",
    "README.md",
    "docs/business-roadmap.md",
    "docs/business-strategy.md",
    "docs/phase-0-2-execution-plan.md",
    "docs/project-operating-policy.md",
    "docs/ai-agent-operating-model.md",
    "docs/operations/access-and-data-policy.md",
    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/ISSUE_TEMPLATE/task.yml",
    ".github/ISSUE_TEMPLATE/decision.yml",
    ".github/ISSUE_TEMPLATE/bug.yml",
    ".github/workflows/docs-quality.yml",
    ".cursor/agents/business-orchestrator.md",
    ".cursor/agents/product-lead.md",
    ".cursor/agents/marketing-lead.md",
    ".cursor/agents/data-lead.md",
    ".cursor/agents/legal-lead.md",
    ".cursor/agents/validation-lead.md",
    ".cursor/agents/gate-reviewer.md",
    ".cursor/rules/cursor-primary.mdc",
    ".cursor/skills/execute-gyoji-cho-task/SKILL.md",
    ".codex/README.md",
    ".codex/agents/business-orchestrator.toml",
    ".codex/agents/product-lead.toml",
    ".codex/agents/marketing-lead.toml",
    ".codex/agents/data-lead.toml",
    ".codex/agents/legal-lead.toml",
    ".codex/agents/validation-lead.toml",
    ".codex/agents/gate-reviewer.toml"
)

foreach ($relativePath in $requiredPaths) {
    $fullPath = Join-Path $repoRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath)) {
        $errors.Add("Required file is missing: $relativePath")
    }
}

$cursorAgentNames = @(
    "business-orchestrator.md",
    "product-lead.md",
    "marketing-lead.md",
    "data-lead.md",
    "legal-lead.md",
    "validation-lead.md",
    "gate-reviewer.md"
)
$cursorAgentsDir = Join-Path $repoRoot ".cursor/agents"
foreach ($agentName in $cursorAgentNames) {
    $agentPath = Join-Path $cursorAgentsDir $agentName
    if (-not (Test-Path -LiteralPath $agentPath)) {
        continue
    }
    $agentText = Get-Content -LiteralPath $agentPath -Raw
    if ($agentText -notmatch '(?s)^---\r?\n.*?\bname\s*:') {
        $errors.Add("Cursor agent missing frontmatter name: .cursor/agents/$agentName")
    }
    if ($agentText -notmatch '(?s)^---\r?\n.*?\bdescription\s*:') {
        $errors.Add("Cursor agent missing frontmatter description: .cursor/agents/$agentName")
    }
    if ($agentName -eq "gate-reviewer.md" -and $agentText -notmatch '(?m)^readonly:\s*true\s*$') {
        $errors.Add("Cursor agent must set readonly: true: .cursor/agents/gate-reviewer.md")
    }
}

$primaryRulePath = Join-Path $repoRoot ".cursor/rules/cursor-primary.mdc"
if (Test-Path -LiteralPath $primaryRulePath) {
    $primaryRuleText = Get-Content -LiteralPath $primaryRulePath -Raw
    if ($primaryRuleText -notmatch '(?m)^alwaysApply:\s*true\s*$') {
        $errors.Add("Required Cursor rule must set alwaysApply: true: .cursor/rules/cursor-primary.mdc")
    }
}

$markdownFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        ($_.Extension -in '.md', '.mdc')
    }

$linkPattern = [regex]'!?\[[^\]]*\]\((?<target>[^)]+)\)'

foreach ($file in $markdownFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    $relativeFile = [System.IO.Path]::GetRelativePath($repoRoot, $file.FullName)

    $lineNumber = 0
    foreach ($line in ($content -split "`r?`n")) {
        $lineNumber++
        if ($line -match '^(<<<<<<<|=======|>>>>>>>)') {
            $errors.Add("Conflict marker: ${relativeFile}:$lineNumber")
        }
    }

    foreach ($match in $linkPattern.Matches($content)) {
        $rawTarget = $match.Groups['target'].Value.Trim()
        if ($rawTarget.StartsWith('<') -and $rawTarget.EndsWith('>')) {
            $rawTarget = $rawTarget.Substring(1, $rawTarget.Length - 2)
        } elseif ($rawTarget -match '^([^\s]+)\s+["'']') {
            $rawTarget = $Matches[1]
        }

        if ($rawTarget -match '^(https?://|mailto:|tel:|chatgpt-conversation://|app://)' -or $rawTarget.StartsWith('#')) {
            continue
        }

        $pathOnly = ($rawTarget -split '#', 2)[0]
        $pathOnly = ($pathOnly -split '\?', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathOnly)) {
            continue
        }

        $decodedPath = [System.Uri]::UnescapeDataString($pathOnly)
        if ($decodedPath.StartsWith('/')) {
            $candidate = Join-Path $repoRoot $decodedPath.TrimStart('/')
        } else {
            $candidate = Join-Path $file.DirectoryName $decodedPath
        }

        if (-not (Test-Path -LiteralPath $candidate)) {
            $errors.Add("Broken local link: $relativeFile -> $rawTarget")
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Host "Repository documentation checks failed:" -ForegroundColor Red
    $errors | Sort-Object -Unique | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host "Repository documentation checks passed ($($markdownFiles.Count) Markdown files)." -ForegroundColor Green
