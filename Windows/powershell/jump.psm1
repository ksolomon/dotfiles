# PowerShell jump - bookmark folders and jump to them with tab completion
# Port of oh-my-zsh jump plugin
#
#   Enter-Bookmark <name>  - jump to a bookmarked directory (alias: jump)
#   Set-Bookmark [name]    - bookmark the current directory (alias: mark)
#   Remove-Bookmark <name> - delete a bookmark (alias: unmark)
#   Get-Bookmarks          - list all bookmarks (alias: marks)

$MarkFile = Join-Path $env:USERPROFILE '.marks.json'

function Get-MarkData {
    if (Test-Path $MarkFile) {
        Get-Content $MarkFile -Raw | ConvertFrom-Json -AsHashtable
    } else {
        @{}
    }
}

function Set-MarkData {
    param([hashtable]$Data)
    $Data | ConvertTo-Json -Depth 10 | Set-Content $MarkFile -Encoding UTF8
}

function Enter-Bookmark {
    <#
    .SYNOPSIS
    Jump to a bookmarked directory.
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )
    $marks = Get-MarkData
    if (-not $marks.ContainsKey($Name)) {
        Write-Host "No such mark: $Name" -ForegroundColor Red
        return
    }
    $target = $marks[$Name]
    if (-not (Test-Path $target -PathType Container)) {
        Write-Host "Destination does not exist for mark [$Name]: $target" -ForegroundColor Red
        return
    }
    Set-Location $target
}

function Set-Bookmark {
    <#
    .SYNOPSIS
    Bookmark the current directory. Uses the folder name if no name is given.
    #>
    param(
        [string]$Name
    )
    if (-not $Name) {
        $Name = Split-Path (Get-Location) -Leaf
    }
    $marks = Get-MarkData
    $marks[$Name] = (Get-Location).Path
    Set-MarkData $marks
    Write-Host "Marked $(Get-Location) as $Name" -ForegroundColor Green
}

function Remove-Bookmark {
    <#
    .SYNOPSIS
    Delete a bookmark by name.
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )
    $marks = Get-MarkData
    if (-not $marks.ContainsKey($Name)) {
        Write-Host "No such mark: $Name" -ForegroundColor Red
        return
    }
    $marks.Remove($Name)
    Set-MarkData $marks
    Write-Host "Removed mark: $Name" -ForegroundColor Green
}

function Get-Bookmarks {
    <#
    .SYNOPSIS
    List all bookmarks.
    #>
    $marks = Get-MarkData
    if ($marks.Count -eq 0) {
        Write-Host "No marks defined." -ForegroundColor Yellow
        return
    }
    # Find max name length for alignment
    $maxLen = ($marks.Keys | Measure-Object -Maximum Length).Maximum
    foreach ($key in $marks.Keys | Sort-Object) {
        Write-Host ("{0,-$maxLen} -> {1}" -f $key, $marks[$key])
    }
}

# Tab completion for Enter-Bookmark and Remove-Bookmark
Register-ArgumentCompleter -CommandName Enter-Bookmark, Remove-Bookmark -ParameterName Name -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
    $marks = Get-MarkData
    $marks.Keys | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $marks[$_])
    }
}

# Aliases matching the zsh conventions
Set-Alias -Name jump -Value Enter-Bookmark -Force
Set-Alias -Name mark -Value Set-Bookmark -Force
Set-Alias -Name unmark -Value Remove-Bookmark -Force
Set-Alias -Name marks -Value Get-Bookmarks -Force

Export-ModuleMember -Function Enter-Bookmark, Set-Bookmark, Remove-Bookmark, Get-Bookmarks -Alias jump, mark, unmark, marks