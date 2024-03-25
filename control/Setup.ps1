# Path to MariaDB
$mariaDb = 'C:\Program Files\MariaDB 10.6\bin\mysql.exe'
$exeFound = Test-Path $mariadb

if (!($exeFound)) { Write-Warning "$mariaDb not found. Please update path in script."; return }

# Construct the full path to the scripts
$settingsFilePath = Join-Path -Path $PSScriptRoot -ChildPath "..\settings\default\network.lua"

if (!($settingsFilePath)) { Write-Warning "$settingsFilePath not found. Exiting." ; return }

# Get the content of the network.lua file
$dbSettings = Get-Content -Path $settingsFilePath -Raw

# Use regular expressions to extract values
# Use regular expressions to extract values
$dbSettings -match 'SQL_DATABASE\s*=\s*"(.+)"' | Out-Null; $database = $matches[1]
$dbSettings -match 'SQL_LOGIN\s*=\s*"(.+)"' | Out-Null; $databaseLogin = $matches[1]
$dbSettings -match 'SQL_PASSWORD\s*=\s*"(.+)"' | Out-Null; $databasePassword = $matches[1]
$dbSettings -match 'SQL_PORT\s*=\s*(\d+)' | Out-Null; $databasePort = $matches[1]

# Construct the full path to the scripts
$scriptFilePath = Join-Path -Path $PSScriptRoot -ChildPath "scripts\54230_Main.bat"

# Find the line containing 'xi_map.exe' in the file
$configLine = Get-Content $scriptFilePath | Where-Object { $_ -match 'xi_map.exe' }

# Extract the IP address from the line
$currentIP = ($configLine -split " ")[2].Trim()

Write-Host "CatsEyeXI Control Configuration"
Write-Host "-------------------------------"
Write-Host "1) 108.44.45.69 (PROD)"
Write-Host "2) 87.249.134.80 (TEST)"
Write-Host "3) 127.0.0.1 (local)"
Write-Host ""
Write-Host "Current IP:  " $currentIP
Write-Host ""
$selection = Read-Host -Prompt "Please select the IP Address to set for startup "
if ($selection -eq '1') {
    $newIP = "108.44.45.69"
} elseif ($selection -eq '2') {
    $newIP = "87.249.134.80"
} elseif ($selection -eq '3') {
    $newIP = "127.0.0.1"
} else {
    Write-Host "Invalid selection. Exiting script."
    exit
}
Write-Host ""

# Replace $currentIP with the selected IP in all *.bat files
Get-ChildItem -Path "$PSScriptRoot\scripts\*.bat" | ForEach-Object {
    (Get-Content $_.FullName) | ForEach-Object {
        $_ -replace [regex]::Escape($currentIP), $newIP
    } | Set-Content $_.FullName

    # Add the command to run 'git update-index --skip-worktree'
    git update-index --skip-worktree $_.FullName
}

Write-Host "New IP has been set to: "$newIP
Write-Host ""

$updateDb = Read-Host -Prompt "Would you like to update the IP in zone_settings? [y/n]"
if ($updateDb -eq 'y') {
    $updateArgs = '-u', $databaseLogin, "-p$databasePassword", $database
    & $mariaDb $updateArgs -e "UPDATE zone_settings SET zoneip = '$newIP';"
    Write-Host ""
    Write-Host "Database IP updated."
}

$start = Read-Host -Prompt "Start the server? [y/n]"
if ($start -eq 'y') {
    Write-Host ""
    Write-Host "Kicking off services in 5 seconds ..."
    & $PSScriptRoot\Start.bat
} else {
    return
}