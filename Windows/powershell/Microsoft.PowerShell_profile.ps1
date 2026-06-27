$env:POSH_GIT_ENABLED = $true
oh-my-posh init pwsh --config C:\Users\ksolo\OneDrive\Documents\PowerShell\theme-ks.json | Invoke-Expression
Import-Module -Name Terminal-Icons


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function tw3-watch { npx tailwindcss -i ./src/input.css -o ./css/style.css --watch }
function tw3-build { npx tailwindcss -i ./src/input.css -o ./css/style.css --minify }
function tw-watch { npx @tailwindcss/cli -i ./src/input.css -o ./css/style.css --watch }
function tw-build { npx @tailwindcss/cli -i ./src/input.css -o ./css/style.css --minify }

# Jump - bookmark directories and jump to them with tab completion
Import-Module 'C:\Users\ksolo\Projects\Misc Projects\dotfiles\Windows\powershell\jump.psm1'

function Invoke-ClaudeWithProject {
    # Check if we are inside a Git repository
    $isGit = git rev-parse --is-inside-work-tree 2>$null
    
    if ($isGit -eq "true") {
        # Fetch the top-level repository directory path
        $gitRoot = git rev-parse --show-toplevel 2>$null
        # Extract just the folder name and make it lowercase
        $repoName = (Split-Path $gitRoot -Leaf).ToLower()
        # Clean special characters out of the string
        $repoName = $repoName -replace '[^a-z0-9_-]', ''

        # Safely append project.name to existing OTel attributes if they exist
        if ($env:OTEL_RESOURCE_ATTRIBUTES) {
            $env:OTEL_RESOURCE_ATTRIBUTES = "project.name=${repoName}," + $env:OTEL_RESOURCE_ATTRIBUTES
        } else {
            $env:OTEL_RESOURCE_ATTRIBUTES = "project.name=${repoName}"
        }
    }

    # Pass all arguments through to the original claude CLI application
    & (Get-Command claude -CommandType Application) @args
}

# Create an alias so typing 'claude' executes our project wrapper function
Set-Item -Path Alias:claude -Value Invoke-ClaudeWithProject -Force
