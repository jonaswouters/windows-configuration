# Install productivityt packages
$productivityapps = Write-Output `
    sharex `
    zoom `
    firefox `
    googlechrome `
    dropbox-np `
    powertoys-np `
    quicklook `
    processhacker `
    wincdemu `
    filezilla `
    7tt `
    taskbarx `
    copyq `
    notepads `
    teracopy-np `
    office-365-apps-np


choco install -y -r $productivityapps

# Install sumatrapdf with arguments
choco install sumatrapdf.install -ia "/opt pdfpreviewer /register"