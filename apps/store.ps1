# Variables
$linebreak = "################################################"
$break = "`r`n"

################################################
# Install (and remove crap) windows store packages?
$uninstallCrap = Read-Host "Uninstall crap store packages? [Y/n]"
write-host $linebreak$break
################################################

if ($uninstallCrap -ne 'n') {
    get-appxpackage *3dbuilder* | remove-appxpackage
    get-appxpackage *officehub* | remove-appxpackage
    get-appxpackage *getstarted* | remove-appxpackage
    get-appxpackage *zune* | remove-appxpackage
    get-appxpackage *bing* | remove-appxpackage
    get-appxpackage *sway* | remove-appxpackage
    get-appxpackage *candy* | remove-appxpackage
    get-appxpackage *bubble* | remove-appxpackage
} else {
    write-host "Skipping uninstall crap packages"
}

write-host "Installing windows store apps doesn't seem to be supported"
