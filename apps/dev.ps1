# Install software development packages
$devapps = Write-Output `
    jetbrainstoolbox `
    vscode `
    golang `
    nvm.portable

choco install -y -r $devapps

# General
$projectsPath = "D:\Projects"
[System.Environment]::SetEnvironmentVariable("PROJECTS", $projectsPath, [System.EnvironmentVariableTarget]::Machine)

# Golang
$goPathVal = $projectsPath + "\Go"
[System.Environment]::SetEnvironmentVariable("GOPATH", $goPathVal, [System.EnvironmentVariableTarget]::Machine)