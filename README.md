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

## Install following packages manually

* InSync 3: https://www.insynchq.com/
* 1Password: https://1password.com/downloads/windows/

## Manual configuration (for now)

* Check startup items
* Login 1Password
* Set InSync folder
* Configure ShareX destination folder (InSync configuration backup)
* Copy over private files (GPG, SSH & AWS)
* Authenticate various apps
