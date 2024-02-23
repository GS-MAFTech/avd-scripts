Set-ExecutionPolicy Bypass
# Define the URL for the Adobe Reader download
$AdobeReaderUrl = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300320269/AcroRdrDCx642300320269_en_US.exe"

# Define the path where you want to save the downloaded installer
$InstallerPath = "$env:TEMP\AdobeReaderInstaller.exe"

# Download the Adobe Reader installer
Invoke-WebRequest -Uri $AdobeReaderUrl -OutFile $InstallerPath

# Install Adobe Reader silently
Start-Process -FilePath $InstallerPath -ArgumentList "/sAll" -Wait

# Remove the downloaded installer
Remove-Item $InstallerPath

