# Define the download URL for the RingCentral Meetings MSI installer
$downloadUrl = "https://app.ringcentral.com/download/RingCentral-x64.msi"

$NTAppPath = "C:\NetworkTitan\RingCentral"
New-Item -Path $NTAppPath -ItemType Directory -Force

# Define the path where you want to save the installer
$installerPath = $NTAppPath + "\RingCentral-x64.msi"

# Download the MSI installer silently
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Install RingCentral Meetings silently
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /qn" -Wait

# Clean up the downloaded installer
Remove-Item $installerPath
