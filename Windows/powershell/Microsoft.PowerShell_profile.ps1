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

function tw-watch { npx tailwindcss -i ./src/input.css -o ./css/style.css --watch }
function tw-build { npx tailwindcss -i ./src/input.css -o ./css/style.css --minify }
function tw4-watch { npx @tailwindcss/cli -i ./src/input.css -o ./css/style.css --watch }
function tw4-build { npx @tailwindcss/cli -i ./src/input.css -o ./css/style.css --minify }

# Jump - bookmark directories and jump to them with tab completion
Import-Module 'C:\Users\ksolo\Projects\Misc Projects\dotfiles\powershell\jump.psm1'
