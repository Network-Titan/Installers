param(
    [string]$AppName #Name of the App being installed, so the install script can be downloaded into this folder. Don't use spaces.
)

# Check if Choco is installed already. If not, install it.
$testchoco = powershell choco -v
if(-not($testchoco)){
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Use choco to install the selected app.
choco install $AppName --force -y
