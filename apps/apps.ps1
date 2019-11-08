# Variables
$linebreak = "################################################"
$break = "`r`n"

# Install dev packages?
$installDev = Read-Host "Install dev packages? [Y/n]"
if ($installDev -ne 'n') {
   & .\apps\dev.ps1
}

write-host $break$linebreak

# Install productivity packages?
$installProductivity = Read-Host "Install productivity packages? [Y/n]"
if ($installProductivity -ne 'n') {
   & .\apps\productivity.ps1
}

write-host $break$linebreak

# Install media packages?
$installMedia = Read-Host "Install media packages? [Y/n]"
if ($installMedia -ne 'n') {
   & .\apps\media.ps1
}

write-host $break$linebreak

# Install social packages?
$installSocial = Read-Host "Install social packages? [Y/n]"
if ($installSocial -ne 'n') {
   & .\apps\social.ps1
}

write-host $break$linebreak

# Install security packages?
$installSecurity = Read-Host "Install security packages? [Y/n]"
if ($installSecurity -ne 'n') {
   & .\apps\security.ps1
}
