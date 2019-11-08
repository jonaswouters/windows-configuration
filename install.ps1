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
write-host "Installing other packages"
write-host $linebreak

& .\apps\apps.ps1

write-host $linebreak

write-host "Installation finished."