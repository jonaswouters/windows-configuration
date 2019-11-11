# Install productivityt packages
$productivityapps = Write-Output `
    sharex `
    rescuetime `
    zoom `
    firefox `
    googlechrome `
    1password `
    office365business

choco install -y -r $productivityapps