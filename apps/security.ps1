# Install security packages
$securityapps = Write-Output `
    glasswire `
    yubikey-manager `
    yubico-authenticator `
    gpg4win `
    keybase

choco install -y -r $securityapps