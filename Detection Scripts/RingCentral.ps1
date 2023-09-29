# Define the expected installation path
$installationPath = "C:\Program Files\RingCentral"

# Check if the installation directory exists
if (Test-Path $installationPath -PathType Container) {
    # Check for the presence of a specific file that indicates a successful installation
    $installerFile = Join-Path $installationPath "RingCentral.exe"

    if (Test-Path $installerFile -PathType Leaf) {
        Write-Output "RingCentral is installed correctly."
        Exit 0  # 0 indicates success in Intune detection script
    }
}

# If the installation is not found, return failure
Write-Output "RingCentral is not installed."
Exit 1  # 1 indicates failure in Intune detection script
