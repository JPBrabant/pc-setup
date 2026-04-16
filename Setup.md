# Prerequisites

## PowerShell

On Windows 11, Windows PowerShell (v5) is installed by default. Start by installing PowerShell Core (v7).

```pwsh
winget install --exact --id Microsoft.PowerShell --source winget
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

    # Terminal
    #"Microsoft.PowerShell"         # Installed previously
    #"Microsoft.WindowsTerminal"    # Should already be installed by default on Win 11
    #"Microsoft.Edit"               # Command line text editor for Git, should already be installed on Win 11
    "JanDeDobbeleer.OhMyPosh"       # To style the prompt

    # Dev
    "Microsoft.VisualStudioCode"    #
    #"Git.Git"                      # Needs a custom install
    "astral-sh.uv"                  # Python
    "Microsoft.DotNet.SDK.10"       # .NET (latest version `Find-WinGetPackage Microsoft.DotNet.SDK`)
    "OpenJS.NodeJS"                 # NodeJS and NPM (for mermaid-cli)

    # Work related
    "Microsoft.PowerBI"             # 
    "Microsoft.RemoteDesktopClient" # 

    # Tools
    "Microsoft.PowerToys"           # For Markdown and PDF preview, Always On Top and ZoomIt
    "AutoHotkey.AutoHotkey"         #
    "ShareX.ShareX"                 # Or Flameshot.Flameshot

    # Software
    "Apryse.XodoPDFReader"          #
    "M2Team.NanaZip"                # Or 7zip.7zip
    "Mozilla.Firefox"               #
    "Discord.Discord"               #
    "Amazon.Kindle"                 # 
    "VideoLAN.VLC"                  # 
    "Valve.Steam"                   # 
    "Microsoft.BingWallpaper"       # 
    "SteelSeries.GG"                # 
    "DelugeTeam.DelugeBeta"         # 
)

# Install all packages
ForEach-Object -InputObject $packages -Process { Install-WinGetPackage -MatchOption Equals -Id $_ -Source winget }

# See if there is an update available
Get-WinGetPackage | Where-Object -Property Id -In $packages | Sort-Object -Property Id | Format-Table -AutoSize
```

## Special winget command for `Git`

See my learning-git repository for a script to install Git with the correct settings.

## PowerShell modules

```pwsh
#Install-Module -Name Microsoft.WinGet.Client          # Already installed
Install-Module -Name posh-git -Scope CurrentUser       # Autocomplete for Git
Install-Module -Name Terminal-Icons -Scope CurrentUser # Icons for Get-ChildItem output
Install-Module -Name ImportExcel -Scope CurrentUser    # Excel support
Install-Module -Name PSParquet -Scope CurrentUser      # Parquet files support
```

## Custom installations

- Office
- Cover (by French Fry Software)
- NirSoft WakeMeOnLan
- NirSoft ControlMyMonitor
- Antidote

## Font

A winget package is available to install the Cascadia/Caskaydia Nerd Font from the Nerd Fonts project, and there is also the official Microsoft repository: [Cascadia Code](<https://github.com/microsoft/cascadia-code>).