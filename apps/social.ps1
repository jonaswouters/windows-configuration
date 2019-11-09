# Install software development packages
$socialapps = Write-Output `
    slack `
    discord.install

choco install -y -r $socialapps