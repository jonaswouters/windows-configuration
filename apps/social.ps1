# Install software development packages
$socialapps = Write-Output `
    franz
    # slack `
    # discord.install `

choco install -y -r $socialapps