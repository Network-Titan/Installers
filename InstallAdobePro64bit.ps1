$NTAppPath = "C:\NetworkTitan\Acrobat64"

$ZipPath = "$($NTAppPath)\Zip\ZipFiles\"
$UnZipPath = "$($NTAppPath)\Zip\UnZipFiles\"

New-Item -Path $ZipPath -ItemType Directory -Force
New-Item -Path $UnZipPath -ItemType Directory -Force

$Url = "https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_x64_WWMUI.zip"
$DownloadZipFile = $ZipPath + $(Split-Path -Path $Url -Leaf)
$ExtractPath = $UnZipPath
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 
Start-Process $ExtractPath -wait

Start-Process "$($UnZipPath)\Adobe Acrobat\setup.exe" -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory $NTAppPath -wait