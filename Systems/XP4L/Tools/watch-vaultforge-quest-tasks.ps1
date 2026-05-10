param(
    [string]$VaultForgeRoot = "F:\vaultforge",
    [string]$XP4LifeRoot = "F:\XP4Life",
    [int]$IntervalSeconds = 20,
    [switch]$Once
)

$ErrorActionPreference = "Stop"

$questDir = Join-Path $XP4LifeRoot "🖥 MENU\Quests\VaultForge XP4L"
$activeQuestDir = Join-Path $XP4LifeRoot "🖥 MENU\Quests\Active"
$stateDir = Join-Path $XP4LifeRoot "Systems\XP4L\State"
$logPath = Join-Path $stateDir "vaultforge-quest-watch.log"

New-Item -ItemType Directory -Force $stateDir | Out-Null

function Write-WatchLog {
    param([string]$Message)
    $stamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"
    Add-Content -LiteralPath $logPath -Value "[$stamp] $Message"
}

function Read-TextSafe {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        return ""
    }
    return Get-Content -Raw -LiteralPath $Path
}

function Set-YamlValue {
    param(
        [string]$Text,
        [string]$Key,
        [string]$Value
    )
    $pattern = "(?m)^$([regex]::Escape($Key)):\s*.*$"
    if ($Text -match $pattern) {
        return [regex]::Replace($Text, $pattern, "${Key}: $Value", 1)
    }
    return $Text
}

function Mark-TaskLine {
    param(
        [string]$Text,
        [string]$Label,
        [bool]$Done
    )
    if (-not $Done) {
        return $Text
    }
    $escaped = [regex]::Escape($Label)
    $pattern = "(?m)^(\s*-\s*)\[ \](\s*$escaped\s*)$"
    return [regex]::Replace($Text, $pattern, '${1}[x]${2}')
}

function Update-QuestProgress {
    param([string]$Path)
    $text = Read-TextSafe $Path
    if (-not $text) {
        return $false
    }

    $topTasks = [regex]::Matches($text, "(?m)^- \[[ xX]\] ")
    $doneTasks = [regex]::Matches($text, "(?m)^- \[[xX]\] ")
    $target = $topTasks.Count
    $current = $doneTasks.Count

    if ($target -gt 0) {
        $text = Set-YamlValue $text "progress_current" $current
        $text = Set-YamlValue $text "progress_target" $target
        if ($current -eq $target) {
            $text = Set-YamlValue $text "status" "completed"
            if ($text -notmatch "(?m)^completed_on:") {
                $text = [regex]::Replace($text, "(?m)^created:.*$", "`$0`r`ncompleted_on: $(Get-Date -Format yyyy-MM-dd)", 1)
            }
        } else {
            $text = Set-YamlValue $text "status" "active"
        }
    }

    $old = Read-TextSafe $Path
    if ($text -ne $old) {
        Set-Content -LiteralPath $Path -Value $text -NoNewline -Encoding utf8
        return $true
    }
    return $false
}

function Update-ResumeFlagQuest {
    $tasksText = Read-TextSafe (Join-Path $VaultForgeRoot "TASKS.md")
    $reviewText = Read-TextSafe (Join-Path $VaultForgeRoot "WORKFLOW_REVIEW.md")
    $planText = Get-ChildItem -LiteralPath (Join-Path $VaultForgeRoot "runs\workflow-b") -Recurse -File -Filter "workflow-b-plan.md" -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 5 |
        ForEach-Object { Read-TextSafe $_.FullName } |
        Out-String

    $hasRootTask = $tasksText -match "root-workflow-b-resume-execute-flag"
    $hasRunPackets = Test-Path -LiteralPath (Join-Path $VaultForgeRoot "runs\workflow-b")
    $hasLossEvidence = (
        $reviewText -match "generated resume command still omits.*--execute" -or
        $reviewText -match "Execute: True.*loses.*--execute" -or
        $planText -match "Execute:\s*True"
    )
    $rootTaskDone = $tasksText -match "(?m)^- \[[xX]\].*root-workflow-b-resume-execute-flag"

    $questPaths = @(
        (Join-Path $activeQuestDir "Workflow B Resume Flag Repair.md"),
        (Join-Path $questDir "Workflow B Resume Flag Repair Proposal.md")
    ) | Where-Object { Test-Path -LiteralPath $_ }

    $updated = 0
    foreach ($questPath in $questPaths) {
        $text = Read-TextSafe $questPath
        if (-not $text) {
            continue
        }
        $old = $text
        $text = Mark-TaskLine $text 'Read the active root task `root-workflow-b-resume-execute-flag`.' $hasRootTask
        $text = Mark-TaskLine $text "Inspect generated resume commands in recent Workflow B run packets." $hasRunPackets
        $text = Mark-TaskLine $text 'Identify exactly where `Execute: True` loses `--execute`.' $hasLossEvidence
        $text = Mark-TaskLine $text "Confirm the current bug shape" ($hasRootTask -and $hasRunPackets -and $hasLossEvidence)

        if ($rootTaskDone) {
            $labels = @(
                "Patch the command builder",
                "Update only the Workflow B controller or prompt/handoff code that emits resume commands.",
                "Preserve existing arguments, quoting, lane selection, cycle budget, hard-gate mode, and commit mode.",
                "Add focused verification",
                "Add or update a test for execute-mode resume command emission.",
                "Add or update a test for plan-only resume command emission.",
                "Run checks",
                "Run the Workflow B unit or smoke tests already used by the repo.",
                "Run a no-execute packet generation check if safe.",
                "Record the repair",
                'Update `TASKS.md` and `CHANGELOG.md`.',
                "Note any remaining Workflow B run-packet risks separately."
            )
            foreach ($label in $labels) {
                $text = Mark-TaskLine $text $label $true
            }
        }

        if ($text -ne $old) {
            Set-Content -LiteralPath $questPath -Value $text -NoNewline -Encoding utf8
            $updated += 1
        }

        if (Update-QuestProgress $questPath) {
            $updated += 1
        }
    }

    if ($updated -gt 0) {
        return @("updated resume quest")
    }
    return @()
}

function Update-IconsPartBQuest {
    $partRoot = Join-Path $VaultForgeRoot "ICON\XP4Life\part-a"
    $selectedRoot = Join-Path $partRoot "selected"
    $tasksText = Read-TextSafe (Join-Path $VaultForgeRoot "TASKS.md")
    $changeText = Read-TextSafe (Join-Path $VaultForgeRoot "CHANGELOG.md")
    $outputReview = Join-Path $VaultForgeRoot "vaultforge-icon\NOTE\Icons - part A - output review.md"
    $quickUse = Join-Path $VaultForgeRoot "vaultforge-icon\NOTE\Icons - part A - quick use guide.md"
    $promptRoot = Join-Path $partRoot "prompts"

    $hasEvidenceNotes = (Test-Path -LiteralPath $outputReview) -and (Test-Path -LiteralPath $quickUse) -and (Test-Path -LiteralPath $promptRoot)
    $hasGenerated = (Get-ChildItem -LiteralPath (Join-Path $partRoot "generated") -Recurse -File -Include "*.png","*.md" -ErrorAction SilentlyContinue | Select-Object -First 1) -ne $null
    $selectedFiles = @(Get-ChildItem -LiteralPath $selectedRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne ".gitkeep" })
    $hasSelected = $selectedFiles.Count -gt 0
    $hasIndex = (Get-ChildItem -LiteralPath $partRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "(?i)icon.*index|index.*icon" } | Select-Object -First 1) -ne $null
    $rootTaskDone = $tasksText -match "(?m)^- \[[xX]\].*root-xp4life-part-b"
    $hasRecord = $changeText -match "XP4Life Icons.*Part B|root-xp4life-part-b|selected XP4Life icon"

    $questPaths = @(
        (Join-Path $activeQuestDir "XP4Life Icons Part B Curation.md"),
        (Join-Path $questDir "XP4Life Icons Part B Curation Proposal.md")
    ) | Where-Object { Test-Path -LiteralPath $_ }

    $updated = 0
    foreach ($questPath in $questPaths) {
        $text = Read-TextSafe $questPath
        if (-not $text) {
            continue
        }
        $old = $text
        $text = Mark-TaskLine $text 'Review `Icons - part A` notes, quick-use guidance, prompt banks, and output review notes.' $hasEvidenceNotes
        $text = Mark-TaskLine $text "Confirm where generated examples and candidate outputs currently live." $hasGenerated
        $text = Mark-TaskLine $text "Reopen the Part A evidence" ($hasEvidenceNotes -and $hasGenerated)

        if ($rootTaskDone -or ($hasSelected -and $hasIndex -and $hasRecord)) {
            $labels = @(
                "Select the strongest outputs",
                'Copy only approved candidates into a scoped `selected/` location.',
                "Avoid moving or deleting originals unless a separate task approves asset operations.",
                "Rename cleanly",
                "Use readable icon names that match XP4Life surfaces such as quests, achievements, titles, rewards, dashboard, and logs.",
                "Keep collision handling explicit.",
                "Create the icon index note",
                "Embed or link selected outputs.",
                "Record source prompt, category, intended use, and review notes.",
                "Record gaps and follow-ups",
                "Mark weak categories, missing sizes, or style mismatches.",
                "Split any new generation, resize, SVG conversion, or folder-icon application into separate gated tasks.",
                "Update root and icon records",
                'Update root `TASKS.md` for `root-xp4life-part-b`.',
                "Update icon or root changelog entries as appropriate."
            )
            foreach ($label in $labels) {
                $text = Mark-TaskLine $text $label $true
            }
        }

        if ($text -ne $old) {
            Set-Content -LiteralPath $questPath -Value $text -NoNewline -Encoding utf8
            $updated += 1
        }

        if (Update-QuestProgress $questPath) {
            $updated += 1
        }
    }

    if ($updated -gt 0) {
        return @("updated icons quest")
    }
    return @()
}

function Invoke-Scan {
    $changes = @()
    $changes += Update-ResumeFlagQuest
    $changes += Update-IconsPartBQuest
    if ($changes.Count -gt 0) {
        Write-WatchLog ($changes -join "; ")
    } else {
        Write-WatchLog "scan complete; no quest checkbox changes"
    }
}

Write-WatchLog "watch start VaultForgeRoot=$VaultForgeRoot XP4LifeRoot=$XP4LifeRoot IntervalSeconds=$IntervalSeconds Once=$Once"

do {
    try {
        Invoke-Scan
    } catch {
        Write-WatchLog "error: $($_.Exception.Message)"
    }
    if ($Once) {
        break
    }
    Start-Sleep -Seconds $IntervalSeconds
} while ($true)
