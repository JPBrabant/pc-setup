oh-my-posh init pwsh --config catppuccin | Invoke-Expression

$modules = @(
    'posh-git',                # Auto-complete for Git
    'Microsoft.WinGet.Client', # PowerShell style wrapper for WinGet
    'Terminal-Icons',          # Icons for files in Get-ChildItems
    'PSParquet',               # .parquet files
    'ImportExcel'              # .xlsx files
)

foreach ($m in $modules) {
    Import-Module -Name $m -ErrorAction SilentlyContinue
}

# Network Utilities
function Get-IP { 
    $externalIP = Invoke-WebRequest -Uri 'http://ifconfig.me/ip'
    $localIP = Get-NetIPAddress -AddressFamily IPv4 `
                | Where-Object -FilterScript { $_.AddressState -eq 'Preferred' -and $_.IPAddress -ne '127.0.0.1' } `
                | Sort-Object -Property InterfaceIndex `
                | Select-Object -First 1

    [PSCustomObject]@{
        Local    = $localIP.IPAddress
        External = $externalIP.Content
    }
}

# Common path
Set-Variable -Name DESKTOP -Value ([Environment]::GetFolderPath('Desktop')) -Option ReadOnly -ErrorAction SilentlyContinue
Set-Variable -Name DEV -Value ("C:\dev") -Option ReadOnly -ErrorAction SilentlyContinue