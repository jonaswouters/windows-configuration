# Variables
$linebreak = "################################################"
$break = "`r`n"
$repoUrl = "https://github.com/jonaswouters/windows-configuration.git"
$repoUrlSSH = "git@github.com:jonaswouters/windows-configuration.git"
$configFolder = "$HOME\Configuration"

# Install Chocolatey if not installed.
if(test-path "C:\ProgramData\chocolatey\choco.exe"){
    Write-Output "Chocolatey Version $testchoco is already installed"
}
else{
    Write-Output "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
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

# Install basic packages to be able to proceed
$apps = Write-Output `
    git.install `
    7zip.install `
    openssh `
    curl `
    neovim

choco install -y -r $apps


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
& .\apps\apps.ps1
write-host $linebreak$break$break


################################################


# Windows Defender path exclusions
write-host "Settings path exclusions ..."
& .\Settings\defender-exclusions.ps1
write-host $break$break$linebreak$break$break


# Other settings
write-host "Other settings ..."
& .\Settings\windows-settings.ps1
write-host $break$break$linebreak$break$break

################################################


# Fix Git url
write-host "* Fixing git url"
git remote set-url origin $repoUrlSSH
write-host "* Last few things"
# TODO

# Fix SSH agent auto start
write-host "Start SSH agent automatically"
Set-Service -Name ssh-agent -StartupType Manual


# The end
write-host $break$break$linebreak$break$linebreak$break$break
write-host "Installation finished."