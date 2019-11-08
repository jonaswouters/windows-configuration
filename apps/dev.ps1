# Install software development packages
$devapps = Write-Output `
    jetbrainstoolbox `
    vscode

choco install -y -r $devapps