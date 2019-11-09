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
write-host "Installing base packages"
write-host $linebreak
################################################

# Install basic packages to be able to proceed
$apps = Write-Output `
    git.install `
    googlechrome `
    7zip.install `
    openssh `
    curl

choco install -y -r $apps

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
}

write-host $linebreak$break$break
################################################


# Install other packages
write-host "Installing other packages ..."
& .\apps\apps.ps1
write-host $break$break$linebreak$break$break


################################################


# Fix Git url
write-host "* Fixing git url"
git remote set-url origin $repoUrlSSH
write-host "* Last few things"
# TODO


# The end
write-host $break$break$linebreak$break$linebreak$break$break
write-host "Installation finished."