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