# Variables
$linebreak = "################################################"
$break = "`r`n"
$repoUrl = "https://github.com/jonaswouters/windows-configuration.git"
$repoUrlSSH = "git@github.com:jonaswouters/windows-configuration.git"
$configFolder = "$HOME\Configuration"

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Chocolatey if not installed 
if(test-path "C:\ProgramData\chocolatey\choco.exe"){	
    Write-Output "Chocolatey Version $testchoco is already installed"
}
else{	
    Write-Output "Seems Chocolatey is not installed, installing now"	   
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Scoop if not installed.
if(test-path "$HOME\scoop\apps\scoop\current"){
    Write-Output "Scoop is already installed"
}
else{
    Write-Output "Seems like Scoop is not installed, installing now"
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

################################################
write-host $break$linebreak
write-host "Renaming PC"
write-host $linebreak
################################################
$currentPcName = $env:computername
$newPcName = Read-Host "Rename PC? Type new name: [$currentPcName]" 
if ($newPcName -ne '') {
    Rename-Computer -newname $newPcName
    write-host "Name changed to $newPcName"
 } else {
     write-host "Name is still $currentPcName"
 }

################################################
write-host $break$linebreak
write-host "Installing base packages"
write-host $linebreak
################################################

scoop update

# Install global packages and openssh
sudo scoop install win32-openssh 7zip git --global
sudo C:\ProgramData\scoop\apps\win32-openssh\current\install-sshd.ps1

# Install basic packages to be able to proceed
$apps = Write-Output `
    aria2 `
    sudo `
    git

scoop install $apps


# extra scoop buckets
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add nonportable

################################################
write-host $break$linebreak
write-host "Fixing environment..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
write-host $linebreak$break$break
################################################

################################################
write-host $break$linebreak
write-host "Configure Git settings ..."
& .\settings\gitconfig.ps1
write-host $linebreak$break$break
################################################

write-host $break$linebreak
write-host "Retrieving git repository"
if(Test-Path $configFolder){
    write-host "Using existing git repository" $configFolder
    Set-Location $configFolder
    git pull
} else {
    write-host "Cloning git repository to" $configFolder
    git clone $repoUrl $configFolder
    Set-Location $configFolder
}

write-host $linebreak$break$break
################################################

# Install other packages
write-host "Installing other packages ..."
choco install -y .\apps\dev.config
choco install -y .\apps\productivity.config
choco install -y .\apps\media.config
choco install -y .\apps\social.config
choco install -y .\apps\security.config
& .\apps\store.ps1

# Install fonts
$fonts = Write-Output `
    CascadiaCode-NF-Mono `
    CascadiaCode-NF

scoop install $fonts

$apps = Write-Output `
    graphviz `
    imagemagick `
    nvm `
    go `
    concfg `
    pshazz `
    curl `
    neovim `
    grep `
    sed `
    less `
    touch `
    coreutils `
    hwinfo `
    7tt

scoop install $apps

concfg import solarized-dark

################################################
write-host $break$linebreak
write-host "Devenv settings"

# General
$projectsPath = "D:\Projects"
$projectsPathInput = Read-Host 'What is the path to your Projects folder? (example: D:\Projects)'

if ($projectsPathInput -ne '') {
    $projectsPath = $projectsPathInput
}

Write-Host ""
Write-Host "Adding Path Exclusion: " $projectsPath
Add-MpPreference -ExclusionPath $projectsPath
[System.Environment]::SetEnvironmentVariable("PROJECTS", $projectsPath, [System.EnvironmentVariableTarget]::Machine)

# Golang
$goPathVal = $projectsPath + "\Go"
[System.Environment]::SetEnvironmentVariable("GOPATH", $goPathVal, [System.EnvironmentVariableTarget]::Machine)
Write-Host "Adding Path Exclusion: " $goPathVal
Add-MpPreference -ExclusionPath $goPathVal

# WSL and Hyper-V
Write-Host ""
Write-Host "Enabling WSL and Hyper-V"
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

################################################

# Windows Defender path exclusions
write-host "Settings path exclusions ..."
& .\Settings\defender-exclusions.ps1
write-host $break$break$linebreak$break$break

# Powershell modules
write-host "Powershell modules ..."
& .\Settings\powershell-modules.ps1
write-host $break$break$linebreak$break$break


# Other settings
write-host "Other settings ..."
& .\Settings\windows-settings.ps1
write-host $break$break$linebreak$break$break

# Fix Git url
write-host "* Fixing git url"
git remote set-url origin $repoUrlSSH
write-host "* Last few things"

# Fix SSH agent auto start
write-host "Start SSH agent automatically"
Set-Service -Name ssh-agent -StartupType Automatic


# The end
write-host $break$break$linebreak$break$linebreak$break$break
write-host "Installation finished."