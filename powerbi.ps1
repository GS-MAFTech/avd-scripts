[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$A = ""

## Initial link for the product
## "https://www.microsoft.com/en-us/download/details.aspx?id=58494"

## Download Page for PowerBI refered by the Download button of the previous page
$DownloadPowerBIUri = "https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494"

## Get the Page content
$A = Invoke-WebRequest -Uri $DownloadPowerBIUri -UseBasicParsing

## Find the first x64 link and download the file to c:\temp
Invoke-WebRequest -Uri ( ($A.Links | ? {$_.href -like "*PBIDesktopSetup_x64.exe*" }) | Select -First 1 ).href -OutFile c:\Temp\PBIDesktopSetup_x64.exe
Start-Process c:\Temp\PBIDesktopSetup_x64.exe  -ArgumentList "/quiet /norestart ACCEPT_EULA=1 INSTALLDESKTOPSHORTCUT=0 DISABLE_UPDATE_NOTIFICATION=1 ENABLECXP=0" -WindowStyle Hidden
Start-Sleep -Seconds 60
