$CheckADCReg = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | where {$_.DisplayName -like "Adobe Acrobat Reader DC*"}
If ($CheckADCReg -eq $null) {
$Installdir = "c:\temp\install_adobe"
New-Item -Path $Installdir  -ItemType directory

$source = "ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/2001320064/AcroRdrDC2001320064_en_US.exe"
$destination = "$Installdir\AcroRdrDC2001320064_en_US.exe"
Invoke-WebRequest $source -OutFile $destination


Start-Process -FilePath "$Installdir\AcroRdrDC2001320064_en_US.exe" -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES"

Start-Sleep -s 240


rm -Force $Installdir\AcroRdrDC*
}
