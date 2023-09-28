$AcrobatReaderInstalled = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
    Where-Object { $_.DisplayName -like "Adobe Acrobat*" }

if ($AcrobatReaderInstalled) {
    Write-Output "Adobe Acrobat is installed."
    exit 0 # Return 0 to indicate success
} else {
    Write-Output "Adobe Acrobat is not installed."
    exit 1 # Return 1 to indicate failure
}
