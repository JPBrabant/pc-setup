# Prerequisites

## PowerShell

By default on Windows 11, Windows PowerShell (v5) is installed, we start by installing PowerShell Core (v7).

```pwsh
winget install --exact --id Microsoft.PowerShell
```

## WinGet wrapper

In a new Windows Terminal Window with PowerShell 7, we will install a wrapper for WinGet. WinGet can be used with 
`winget.exe` but it easier with the wrapper that follow PowerShell conventions.

```pwsh
Install-Module -Name Microsoft.WinGet.Client
Import-Module -Name Microsoft.WinGet.Client
```

# Main softwares

## Winget

```pwsh
$packages = @(
#   "Microsoft.PowerShell"          # Installed previously
#   "Git.Git"                       # Need a custom install
#   "Microsoft.WindowsTerminal"     # Shoud already be installed by default on Win 11
    "astral-sh.uv"                  # For python
    "Microsoft.Edit"                # As a command line text editor for Git
    "JanDeDobbeleer.OhMyPosh"       # To style the prompt
    "Microsoft.VisualStudioCode"    #
    "Microsoft.PowerToys"           # For markdown and pdf preview, alway on top and ZoomIt
    "AutoHotkey.AutoHotkey"         #
    "Apryse.XodoPDFReader"          #
    "7zip.7zip"                     #
    "Mozilla.Firefox"               #
    "Discord.Discord"               #
    "Amazon.Kindle"                 # 
    "Microsoft.RemoteDesktopClient" # 
    "ShareX.ShareX"                 # Or Flameshot.Flameshot
    "VideoLAN.VLC"                  # 
    "Valve.Steam"                   # 
    "Microsoft.BingWallpaper"       # 
    "SteelSeries.GG"                # 
    "DelugeTeam.DelugeBeta"         # 
)

# Install all packages
ForEach-Object -InputObject $packages -Process { Install-WinGetPackage -MatchOption Equals -Id $_ }

# See if there is an update available
Get-WinGetPackage | Where-Object -Property Id -In $packages | Sort-Object -Property Id | Format-Table -AutoSize
```

## Special winget command for `Git`

## PowerShell modules

```pwsh
#Install-Module -Name Microsoft.WinGet.Client # Already installed
Install-Module -Name posh-git                 # 
Install-Module -Name Terminal-Icons           # 
```

## Custom installation

- Office
- Cover (by French Fry Software)
- NirSoft WakeMeOnLan
- NirSoft ControlMyMonitor
- Antidote

## Font

winget install ryanoasis.CaskaydiaCove -s winget-font