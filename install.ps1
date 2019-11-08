# Variables
$linebreak = "################################################"
$break = "`r`n"
$repoUrl = "https://github.com/jonaswouters/windows-configuration.git"
$configFolder = "$HOME/Configuration"

# Install Chocolatey if not installed.
$testchoco = powershell choco -v
if(-not($testchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $testchoco is already installed"
}

write-host $break$linebreak
write-host "Installing base packages"
write-host $linebreak

# Install basic packages to be able to proceed
$apps = Write-Output `
    git.install `
    googlechrome `
    7zip.install `
    openssh `
    curl

choco install -y -r $apps

write-host $break$linebreak
write-host "Retrieving git repository"
if(![System.IO.File]::Exists($configFolder)){
    Set-Location $configFolder
    git pull
} else {
    git clone $repoUrl $configFolder
}
write-host $break$linebreak

# Install dev packages?
$installDev = Read-Host "Install dev packages? [Y/n]"
if ($installDev -ne 'n') {
   & .\apps\dev.ps1
}

write-host $break$linebreak

# Install productivity packages?
$installProductivity = Read-Host "Install productivity packages? [Y/n]"
if ($installProductivity -ne 'n') {
   & .\apps\productivity.ps1
}

write-host $break$linebreak

# Install media packages?
$installMedia = Read-Host "Install media packages? [Y/n]"
if ($installMedia -ne 'n') {
   & .\apps\media.ps1
}

write-host $break$linebreak

# Install social packages?
$installSocial = Read-Host "Install social packages? [Y/n]"
if ($installSocial -ne 'n') {
   & .\apps\social.ps1
}

write-host $break$linebreak

# Install security packages?
$installSecurity = Read-Host "Install security packages? [Y/n]"
if ($installSecurity -ne 'n') {
   & .\apps\security.ps1
}

write-host $break$linebreak

write-host "Installation finished."