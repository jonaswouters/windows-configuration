# Variables
$linebreak = "################################################"
$break = "`r`n"
$repoUrl = "https://github.com/jonaswouters/windows-configuration.git"
$repoUrlSSH = "git@github.com:jonaswouters/windows-configuration.git"
$configFolder = "$HOME\Configuration"

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

################################################
write-host $break$linebreak
write-host "Renaming PC"
write-host $linebreak
################################################
$currentPcName = $env:computername
$newPcName = Read-Host "Rename PC? Type new name: [$currentPcName]" 
if ($newPcName -ne '') {
    Rename-Computer -newname $newPcName
    write-host "Name changed to $newPcName"
 } else {
     write-host "Name is still $currentPcName"
 }

################################################
write-host $break$linebreak
write-host "Installing base packages"
write-host $linebreak
################################################

# Winget
(
	"Google.Chrome",
    "7zip.7zip",
    "XPDC2RH70K22MN", # Discord
    "9NKSQGP7F2NH", # WhatsApp
    "Microsoft.WindowsTerminal.Preview",
    "Amazon.AWSCLI",
    "CPUID.CPU-Z",
    "Microsoft.PowerToys",
    "9WZDNCRDK3WP", # Slack
    "Valve.Steam",
    "Microsoft.Teams.Preview",
    "Ubisoft.Uplay",
    "Microsoft.VisualStudioCode",
    "AgileBits.1Password",
    "CloudImperiumGames.RSILauncher",
    #"rammichael.7+TaskbarTweaker", # Not supported on windows 11
    "ImageMagick.ImageMagick",
    "ogdesign.Eagle",
    "Graphviz.Graphviz",
    "vim.vim",
    "JetBrains.Toolbox",
    "ElectronicArts.EADesktop",
    "TimKosse.FileZilla.Client",
    "CodeSector.TeraCopy",
    "9NV4BS3L1H4S", # QuickLook
    "9NBLGGH4Z1SP", # VLC ???
    "VideoLAN.VLC",
    "ShareX.ShareX", # "9NBLGGH4Z1SP", # ShareX. Store version does not work with Streamdeck
    "XP99VR1BPSBQJ2", # Epic Games Store
    "9P9TQF7MRM4R", # Windows Subsystem for Linux Preview
    "Yubico.YubikeyManager",
    "9NFNG39387K0", # Yubico Authenticator
    "GnuPG.Gpg4win",
    "Elgato.StreamDeck",
    "9PMRW2DG7JFW", # GameGlass
    "JAMSoftware.TreeSize",
    "9PKTQ5699M62", # iCloud
    "9WZDNCRDCTL3", # Soundpad
    "Nvidia.Broadcast",
    "Nvidia.GeForceExperience",
    "9NK3RF9NBJNP", # Toggl Track
    "XK72.Charles",
    "9PLDPG46G47Z", # Xbox Insider Hub
    "Obsidian.Obsidian",
    "Docker.DockerDesktop",
    "GlassWire.GlassWire",
    "gerardog.gsudo",
    "9MZ1SNWT0N5D", # Powershell,
    "Bostrot.WSLManager"
) | foreach {winget install -e --id $_ --accept-package-agreements --accept-source-agreements}

################################################
write-host $break$linebreak
write-host "Fixing environment..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
write-host $linebreak$break$break
################################################

################################################
write-host $break$linebreak
write-host "Configure Git settings ..."
& .\settings\gitconfig.ps1
write-host $linebreak$break$break
################################################

write-host $break$linebreak
write-host "Retrieving git repository"
if(Test-Path $configFolder){
    write-host "Using existing git repository" $configFolder
    Set-Location $configFolder
    #git pull
} else {
    write-host "Cloning git repository to" $configFolder
    git clone $repoUrl $configFolder
    Set-Location $configFolder
}

write-host $linebreak$break$break
################################################


################################################
write-host $break$linebreak
write-host "Devenv settings"

# General
$projectsPath = "D:\Projects"
$projectsPathInput = Read-Host 'What is the path to your Projects folder? (example: D:\Projects)'

if ($projectsPathInput -ne '') {
    $projectsPath = $projectsPathInput
}

Write-Host ""
Write-Host "Adding Path Exclusion: " $projectsPath
Add-MpPreference -ExclusionPath $projectsPath
[System.Environment]::SetEnvironmentVariable('PROJECTS', $projectsPath, [System.EnvironmentVariableTarget]::Machine)

# Golang
$goPathVal = $projectsPath + "\Go"
[System.Environment]::SetEnvironmentVariable('GOPATH', $goPathVal, [System.EnvironmentVariableTarget]::Machine)
Write-Host "Adding Path Exclusion: " $goPathVal
Add-MpPreference -ExclusionPath $goPathVal

################################################

# Windows Defender path exclusions
write-host "Settings path exclusions ..."
& .\Settings\defender-exclusions.ps1
write-host $break$break$linebreak$break$break

# Powershell modules
write-host "Powershell modules ..."
& .\Settings\powershell-modules.ps1
write-host $break$break$linebreak$break$break


# Other settings
write-host "Other settings ..."
& .\Settings\windows-settings.ps1
write-host $break$break$linebreak$break$break

# Fix Git url
write-host "* Fixing git url"
git remote set-url origin $repoUrlSSH
write-host "* Last few things"

# Fix SSH agent auto start
write-host "Start SSH agent automatically"
Set-Service -Name ssh-agent -StartupType Automatic


# The end
write-host $break$break$linebreak$break$linebreak$break$break
write-host "Installation finished."
