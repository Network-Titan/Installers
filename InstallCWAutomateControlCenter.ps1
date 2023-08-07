# Working directory to download installer, unzip it, and run from here
$NTAppPath = "C:\NetworkTitan\Automate"
New-Item -Path $NTAppPath -ItemType Directory -Force

# Path to Network Titan Connectwise Automate Control Center installer
$Url = "https://monitor.networktitan.com/LabTech/Updates/ControlCenterInstaller.exe"

# Download the file to our working directory
$DownloadInstallFile = $NTAppPath + "\" + $(Split-Path -Path $Url -Leaf)
Invoke-WebRequest -Uri $Url -OutFile $DownloadInstallFile

# Run silent installation
Start-Process "$($NTAppPath)\ControlCenterInstaller.exe" -ArgumentList "/s" -wait

# Delete working directory and files to save disk space
Remove-Item $NTAppPath -Recurse -Force