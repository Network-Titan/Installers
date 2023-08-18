﻿param(
    [string] $AppName, # Name of the App being installed, so the install script can be downloaded into this folder. Don't use spaces.
    [string] $ExtraParameters, # Optionally, include any parameters that should be passed to Chocolatey. These are passed directly, read the warning on Choco website
    [switch] $Uninstall # Include this parameter to uninstall this app
)
$Logfile = "C:\NetworkTitan\$AppName.log"
Start-Transcript -Append $Logfile

if ($ExtraParameters){
$DecodedParameters = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($ExtraParameters))
$ExtraParameters = @"
--package-parameters="$($DecodedParameters)"
"@
}


# Check if Choco is installed already. If not, install it.
$testchoco = powershell choco -v
if(-not($testchoco)){
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

if ($Uninstall){
    # If Uninstall was set, remove app
    choco uninstall $AppName --force -y
}
Else{
    # If Uninstall is not set, use choco to install the selected app.
    choco install --debug --verbose $AppName $ExtraParameters --force -y
}


Stop-Transcript