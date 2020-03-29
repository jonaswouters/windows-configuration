# Install productivityt packages
$productivityapps = Write-Output `
    sharex `
    zoom `
    firefox `
    googlechrome `
    everything `
    keypirinha `
    powertoys `
    quicklook `
    logitech-options `
    procexp `
    processhacker `
    wincdemu `
    google-drive-file-stream `
    filezilla `
    7-taskbar-tweaker `
    vnote.portable `
    office365business


choco install -y -r $productivityapps