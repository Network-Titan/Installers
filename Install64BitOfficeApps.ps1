$testchoco = powershell choco -v
if(-not($testchoco)){
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco install office365business --force -y
}
else{
    choco install office365business --force -y
}
