# Install software development packages
$mediaapps = Write-Output `
    vlc

choco install -y -r $mediaapps