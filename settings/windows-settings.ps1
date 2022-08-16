# Disable cortana
#$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"     
#IF(!(Test-Path -Path $path)) {  
#    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Windows Search" 
#}  
#Set-ItemProperty -Path $path -Name "AllowCortana" -Value 1  


# Add items to Explorer Quick Access
$o = new-object -com shell.application
$o.Namespace($env:USERPROFILE).Self.InvokeVerb("pintohome")
$o.Namespace('D:\Projects').Self.InvokeVerb("pintohome")


# Restart Explorer to change it immediately     
Stop-Process -name explorer