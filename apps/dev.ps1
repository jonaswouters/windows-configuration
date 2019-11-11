# Install software development packages
$devapps = Write-Output `
    jetbrainstoolbox `
    vscode `
    golang `
    nvm.portable `
    graphviz # for golang profiling

choco install -y -r $devapps

# General
$projectsPath = "D:\Projects"
$projectsPathInput = Read-Host 'What is the path to your Projects folder? (example: D:\Projects)'

if ($projectsPathInput -ne '') {
    $projectsPath = $projectsPathInput
}

Write-Host ""
Write-Host "Adding Path Exclusion: " $projectsPath
Add-MpPreference -ExclusionPath $projectsPath
[System.Environment]::SetEnvironmentVariable("PROJECTS", $projectsPath, [System.EnvironmentVariableTarget]::Machine)

# Golang
$goPathVal = $projectsPath + "\Go"
[System.Environment]::SetEnvironmentVariable("GOPATH", $goPathVal, [System.EnvironmentVariableTarget]::Machine)
Write-Host "Adding Path Exclusion: " $goPathVal
Add-MpPreference -ExclusionPath $goPathVal