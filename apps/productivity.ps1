# Install productivityt packages
$productivityapps = Write-Output `
    sharex `
    zoom `
    firefox `
    googlechrome `
    keypirinha `
    powertoys `
    quicklook `
    logitech-options `
    processhacker `
    wincdemu `
    filezilla `
    7-taskbar-tweaker `
    copyq `
    teracopy `
    office365business


choco install -y -r $productivityapps

# Install sumatrapdf with arguments
choco install sumatrapdf.install -ia "/opt pdfpreviewer /register"