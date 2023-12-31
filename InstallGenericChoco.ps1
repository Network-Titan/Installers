﻿param(
    [string] $AppName, # Name of the App being installed, so the install script can be downloaded into this folder. Don't use spaces.
    [switch] $Uninstall # Include this parameter to uninstall this app
)
$Logfile = "C:\NetworkTitan\$AppName.log"
Start-Transcript -Append $Logfile

# Check if Choco is installed already. If not, install it.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


if ($Uninstall){
    # If Uninstall was set, remove app
    choco uninstall $AppName --force -y
}
Else{
    # If Uninstall is not set, use choco to install the selected app.
    choco install $AppName --force -y
}


Stop-Transcript
