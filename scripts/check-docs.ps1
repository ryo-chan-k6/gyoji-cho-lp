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

$markdownFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter "*.md" |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }

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
