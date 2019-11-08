# Variables
$linebreak = "################################################"
$break = "`r`n"

write-host $break$break$linebreak
################################################
# Install dev packages?
$installDev = Read-Host "Install dev packages? [Y/n]"
write-host $linebreak$break
################################################

if ($installDev -ne 'n') {
   & .\apps\dev.ps1
} else {
    write-host "Skipping dev packages"
}


################################################
write-host $break$break$linebreak
# Install productivity packages?
$installProductivity = Read-Host "Install productivity packages? [Y/n]" 
write-host $linebreak$break
################################################

if ($installProductivity -ne 'n') {
   & .\apps\productivity.ps1
} else {
    write-host "Skipping productivity packages"
}


################################################
write-host $break$break$linebreak
# Install media packages?
$installMedia = Read-Host "Install media packages? [Y/n]"
write-host $linebreak$break
################################################

if ($installMedia -ne 'n') {
   & .\apps\media.ps1
} else {
    write-host "Skipping media packages"
}


################################################
write-host $break$break$linebreak

# Install social packages?
$installSocial = Read-Host "Install social packages? [Y/n]"
write-host $linebreak$break
################################################

if ($installSocial -ne 'n') {
   & .\apps\social.ps1
} else {
    write-host "Skipping social packages"
}


################################################
write-host $break$break$linebreak
# Install security packages?
$installSecurity = Read-Host "Install security packages? [Y/n]"
write-host $linebreak$break
################################################

if ($installSecurity -ne 'n') {
   & .\apps\security.ps1
} else {
    write-host "Skipping security packages"
}
