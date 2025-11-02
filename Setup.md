# Prerequisites

## PowerShell

On Windows 11, Windows PowerShell (v5) is installed by default. Start by installing PowerShell Core (v7).

```pwsh
winget install --exact --id Microsoft.PowerShell
```

## WinGet wrapper

Open a new Windows Terminal window running PowerShell 7 and install the WinGet wrapper module. You can use WinGet via
`winget.exe`, but it's easier with the wrapper that follows PowerShell conventions.

```pwsh
Install-Module -Name Microsoft.WinGet.Client
Import-Module -Name Microsoft.WinGet.Client
```


# Main software

## Winget

```pwsh
$packages = @(
#   "Microsoft.PowerShell"          # Installed previously
#   "Git.Git"                       # Needs a custom install
#   "Microsoft.WindowsTerminal"     # Should already be installed by default on Win 11
    "astral-sh.uv"                  # For Python
    "Microsoft.Edit"                # Command line text editor for Git
    "JanDeDobbeleer.OhMyPosh"       # To style the prompt
    "Microsoft.VisualStudioCode"    #
    "Microsoft.PowerToys"           # For Markdown and PDF preview, Always On Top and ZoomIt
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

See my learning-git repository for a script to install Git with the correct settings.

## PowerShell modules

```pwsh
#Install-Module -Name Microsoft.WinGet.Client # Already installed
Install-Module -Name posh-git                 # Autocomplete for Git
Install-Module -Name Terminal-Icons           # Icons for Get-ChildItem output
```

## Custom installations

- Office
- Cover (by French Fry Software)
- NirSoft WakeMeOnLan
- NirSoft ControlMyMonitor
- Antidote

## Font

A winget package is available to install the Cascadia/Caskaydia Nerd Font from the Nerd Fonts project, and there is also the official Microsoft repository: https://github.com/microsoft/cascadia-code

```pwsh
Install-WinGetPackage -MatchOption Equals -Source winget-font -Id ryanoasis.CaskaydiaCove
```