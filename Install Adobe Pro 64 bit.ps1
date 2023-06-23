Set-ExecutionPolicy Undrestricted -Force

New-Item -Path "C:\" -Name "PowerShell" -Item "directory"
New-Item -Path "C:\PowerShell" -Name "Zip" -Item "directory"
New-Item -Path "C:\PowerShell\Zip" -Name "ZipFile" -Item "directory"
New-Item -Path "C:\PowerShell\Zip" -Name "UnZipFiles" -Item "directory"


$Url = "https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_x64_WWMUI.zip"
$DownloadZipFile = "C:\PowerShell\Zip\ZipFile\" + $(Split-Path -Path $Url -Leaf)
$ExtractPath = "C:\PowerShell\Zip\UnZipFiles\"
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 
Start-Process $ExtractPath -wait

Start-Process "C:\Powershell\Zip\UnZipFiles\Adobe Acrobat\setup.exe" -force -wait

Set-ExecutionPolicy Undefined -Force