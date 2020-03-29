# Install software development packages
$socialapps = Write-Output `
    slack `
    discord.install `
    whatsapp

choco install -y -r $socialapps