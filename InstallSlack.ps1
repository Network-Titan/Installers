﻿$testchoco = powershell choco -v
if(-not($testchoco)){
    Set-ExecutionPolicy Unrestricted -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco install slack --force -y
    Set-ExecutionPolicy Undefined -Force
}
else{
    Set-ExecutionPolicy Unrestricted -Force
    choco install slack --force -y
    Set-ExecutionPolicy Undefined -Force
}