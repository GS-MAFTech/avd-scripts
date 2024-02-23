# Define the URL for the Postman download
$PostmanUrl = "https://dl.pstmn.io/download/latest/win64"

# Define the path where you want to save the downloaded installer
$InstallerPath = "$env:TEMP\PostmanInstaller.exe"

# Download the Postman installer
Invoke-WebRequest -Uri $PostmanUrl -OutFile $InstallerPath

# Install Postman silently
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait

# Remove the downloaded installer
Remove-Item $InstallerPath
