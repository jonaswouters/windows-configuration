# windows-configuration
Windows configuration files

## Installation of a new system

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/jonaswouters/windows-configuration/master/install.ps1'))
```

### Or locally
```
Set-ExecutionPolicy Bypass -Scope Process -Force; ./install.ps1
```

### Setup SSH, Git, GPG, ...
Use the install script included on the USB Key to configure this (sorry this is private stuff)
The installation script might be included at a later point in this repo

## Install following packages manually

* 1Password: https://1password.com/downloads/windows/
* Install windows store apps
* Eagle: https://en.eagle.cool/download/
* Revo Uninstaller Pro: https://www.revouninstaller.com/download-professional-version.php
* Optional: Registry workshop: http://torchsoft.com/en/rw_information.html
* TreeSize: https://customers.jam-software.de/directDownload.php
* Adguard: https://adguard.com/en/welcome.html
* Remarkable desktop: https://my.remarkable.com/
* DriveThruRPG
* Painter


## Manual configuration (for now)

* Check startup items
* Login 1Password

* Configure ShareX destination folder (<path-to->\Screenshots)
* * Task settings File naming:
* * * Capture: `%y-%mo-%d - %hh%mihm%ss - %ra{10}`
* * * Window Capture: `%y-%mo-%d - %hh%mihm%ss - %pn - %ra{10}`
* Authenticate various apps

## After installing WSL 2

* Install WSL2 Linux kernel https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
* Install a WSL distribution
* in the WSL, run for SSH setup `wget -O - https://raw.githubusercontent.com/jonaswouters/windows-configuration/master/settings/wsl-ssh-setup.sh | bash`
* Install docker for wsl2 https://docs.docker.com/docker-for-windows/wsl/

## Thanks to

* https://github.com/mikemaccana/powershell-profile
* https://gist.github.com/nerzhulart/89c6a376b521a6e7eb69a04277a9489a
* https://gallery.technet.microsoft.com/scriptcenter/How-to-disable-Cortana-on-b44924a4

## Todo

* ~~Make powershell look nicer~~
* ~~SSH agent setup (dont forget WSL)~~
* ~~Git config setup~~
* ~~PHP Version manager powershell~~
* ~~Configure PC Name?~~