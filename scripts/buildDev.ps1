############################################################################
# buildDev.ps1                                                            #
# Dev build script                                                        #
############################################################################

if (-not (Test-Path "cgi-bin")) {
  New-Item -ItemType Directory -Name "cgi-bin" | Out-Null
  #exit 1
}

if (-not (Test-Path "dev")) {
  New-Item -ItemType Directory -Name "dev" | Out-Null
  #exit 1
}

Write-Host "Cleaning dev dir..."
Remove-Item -Recurse -Force "dev\*" | Out-Null

Write-Host "Copying files..."
Copy-Item "index.html" "dev\"
Copy-Item -Recurse "public\*" "dev\"
Copy-Item -Recurse "src\forms" "dev\"

Write-Host "Compiling to dev..."
fpc "src\main.pas" -O3 -Ooregvar -Xg -Xs -XX `
-Fu"src\*" -Fu"src\*\*" -Fu"src\*\*\*" `
-o"cgi-bin\app.cgi"

if ($LASTEXITCODE -ne 0) {
Write-Host "Compilation error! Check your source code!"
exit 0
}

Write-Host "Moving cgi-bin folder to dev..."
Move-Item "cgi-bin" "dev"

Write-Host ""
Write-Host "Starting local server at http://localhost:3000"
Set-Location "dev"

if (Test-Path "$(Get-Command python3 -ErrorAction SilentlyContinue)"){
  Set-Location "..\dev"
  python3 -m http.server 3000 --cgi
}
else {
  Write-Host "Local server error!!!"
  Write-Host "This script requires Python to run a local server."
  Write-Host "Python was not found."
  Write-Host "You can upload the files to your server or modify this script."
}