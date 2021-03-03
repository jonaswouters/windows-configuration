# Install security packages
$securityapps = Write-Output `
    glasswire `
    yubikey-manager-qt `
    gpg4win `
    keybase

choco install -y -r $securityapps