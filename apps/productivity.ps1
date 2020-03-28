# Install productivityt packages
$productivityapps = Write-Output `
    sharex `
    zoom `
    firefox `
    googlechrome `
    office365business `
    everything `
    keypirinha `
    powertoys `
    quicklook `
    logitech-options `
    procexp `
    processhacker `
    wincdemu `
    google-drive-file-stream `
    filezilla


choco install -y -r $productivityapps