param (
    [validateset('Dxsteel', 'Customer')]
    [String] $Type = 'Dxsteel'
)

Write-Host "Discard all changes for $Type"

switch ($Type) {
    'Dxsteel' { . (Join-path $PSScriptRoot '_Settings.ps1') }
    'Customer' { . (Join-path $PSScriptRoot '_SettingsCustomers.ps1') }
}

$ToBranch = 'main'

foreach ($Target in $targetRepos) {
    write-host $Target -ForegroundColor Green
    Set-Location $Target
    & git checkout -q "$ToBranch"
    & git pull
}