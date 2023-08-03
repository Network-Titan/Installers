New-Item -Path "C:\NetworkTitan\Adobe64\Powershell\Zip\ZipFiles" -ItemType Directory -Force
New-Item -Path "C:\NetworkTitan\Adobe64\Powershell\Zip\UnZipFiles" -ItemType Directory -Force



$Url = "https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_x64_WWMUI.zip"
$DownloadZipFile = "C:\NetworkTitan\Adobe64\Powershell\Zip\ZipFiles\" + $(Split-Path -Path $Url -Leaf)
$ExtractPath = "C:\NetworkTitan\Adobe64\Powershell\Zip\UnZipFiles\"
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 
Start-Process $ExtractPath -wait

Start-Process "C:\NetworkTitan\Adobe64\Powershell\Zip\UnZipFiles\Adobe Acrobat\setup.exe" -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory "C:\NetworkTitan\Adobe64\Powershell" -wait