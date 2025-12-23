oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin.omp.json" | Invoke-Expression

Import-Module -Name posh-git # Auto-complete for Git
Import-Module -Name Microsoft.WinGet.Client # PowerShell style wrapper for WinGet
Import-Module -Name Terminal-Icons # Icons for files in Get-ChildItems

# Network Utilities
function Get-IP { 
    $externalIP = Invoke-WebRequest -Uri 'http://ifconfig.me/ip'
    $localIP = Get-NetIPAddress -AddressFamily IPv4 `
                | Where-Object -FilterScript { $_.AddressState -eq 'Preferred' -and $_.IPAddress -ne '127.0.0.1' } `
                | Sort-Object -Property InterfaceIndex `
                | Select-Object -First 1

    $ip = @{
        Local = $localIP.IPAddress
        External = $externalIP.Content 
    }

    return $ip
}

# Desktop
$Desktop = [Environment]::GetFolderPath('Desktop')