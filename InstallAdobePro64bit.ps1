# Working directory to download installer, unzip it, and run from here
$NTAppPath = "C:\NetworkTitan\Acrobat64"
New-Item -Path $NTAppPath -ItemType Directory -Force


# Path to Acrobat Pro installer
$Url = "https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_x64_WWMUI.zip"

# Download the file to our working directory
$DownloadZipFile = $NTAppPath + "\" + $(Split-Path -Path $Url -Leaf)
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile

# Extract ZIP file
Expand-Archive -Path $DownloadZipFile -DestinationPath $NTAppPath

# Run silent installation
Start-Process "$($NTAppPath)\Adobe Acrobat\setup.exe" -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory $NTAppPath -wait

# Delete working directory and files to save disk space
Remove-Item $NTAppPath -Recurse -Force