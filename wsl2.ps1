#REQUIRES -Version 2

# Write-Host -NoNewLine 'Capacity :'
# $CAPACITY = (Get-ChildItem $Path -Recurse -File | Measure-Object -property length -sum).SUM
# if ($CA -ge 1GB) {
#     Write-Host  ($CAPACITY / 1GB) 'GB'
# }
# else {
#     Write-Host    ($CAPACITY / 1MB) 'MB'
# }

# param([string]$BasePath = "", [string]$FolderName = "")
# $location = "C:\" + $BasePath + "\" + $FolderNameS
# Set-Location $location

Write-Host 'PowerShell-version: ' $PSVersionTable.PSVersion;

# $software = "Microsoft .NET Core Runtime - 3.1.0 (x64)";
# $installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
# Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*
Write-Host 'ref: https://docs.microsoft.com/zh-tw/windows/wsl/install-win10'

# Write-Host '接下來將會安裝 wsl2, Press any key to continue...'

# Write-Host ("PowerShell Script to run a loop and exit on pressing 'q'!")
# $count = 0
# $sleepTimer = 500 #in milliseconds
# $QuitKey = 81 #Character code for 'q' key.
# while ($count -le 100) {
#     if ($host.UI.RawUI.KeyAvailable) {
#         $key = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyUp")
#         if ($key.VirtualKeyCode -eq $QuitKey) {
#             #For Key Combination: eg., press 'LeftCtrl + q' to quit.
#             #Use condition: (($key.VirtualKeyCode -eq $Qkey) -and ($key.ControlKeyState -match "LeftCtrlPressed"))
#             Write-Host -ForegroundColor Yellow ("'q' is pressed! Stopping the script now.")
#             break
#         }
#     }
#     #Do your operations
#     $count++
#     Write-Host ("Count Incremented to - {0}" -f $count)
#     Write-Host ("Press 'q' to stop the script!")
#     Start-Sleep -m $sleepTimer
# }
# Write-Host -ForegroundColor Green ("The script has stopped.")

# $key = ($Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')) -split (',')
# $key1 = $key[0]

# Write-Host $key1

#1. Enable the Windows Subsystem for Linux
Write-Host 'Enable the Windows Subsystem for Linux, Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
Start-Process -FilePath dism.exe -ArgumentList '/online', '/enable-feature', '/featurename:Microsoft-Windows-Subsystem-Linux', '/all', '/norestart'

#2. Check requirements for running WSL 2
Write-Host 'Check requirements for running WSL 2, Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
$WIN_VER = Get-ComputerInfo | Select-Object windowsversion
if ([int]$WIN_VER.windowsversion -ge 1903) {
    Write-Host 'windowsversion: ' $WIN_VER.windowsversion
}
else {
    Write-Warning 'ref https://docs.microsoft.com/zh-tw/windows/wsl/install-win10#step-2---check-requirements-for-running-wsl-2'
    exit
}

#3. Enable Virtual Machine feature
Write-Host 'Enable Virtual Machine feature, Press any key to continue...'
Start-Process -FilePath dism.exe -ArgumentList '/online', '/enable-feature', '/featurename:VirtualMachinePlatform', '/all', '/norestart'

#4. Download the Linux kernel update packag
Write-Host 'Download the Linux kernel update packag, Press any key to continue...'
$PACKAGE_FILE = "wsl_update_x64.msi"

if (!(Test-Path -path $PACKAGE_FILE)) {
    Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile $PACKAGE_FILE -UseBasicParsing

    Write-Host '請重新開機並執行 wsl_update_x64.msi, Press any key to continue...'

    Write-Host '接下來將會安裝 wsl2, Press any key to continue...'
    $key = ($Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')) -split (',')
    # $key1 = $key[0]

    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit
}

#5 將 WSL 2 設定為預設版本
wsl --set-default-version 2

Write-Host 'Already Set Up'

Write-Host '...'
Write-Host '...'
Write-Host '請安裝 Ubuntu 20.04 LTS, Press any key to continue...'

Write-Host '接下來將會安裝 wsl2, Press any key to continue...'
$key = ($Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')) -split (',')
$key1 = $key[0]


$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')


$software = "Microsoft .NET Core Runtime - 3.1.0 (x64)";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

If (-Not $installed) {
    Write-Host "'$software' NOT is installed.";
}
else {
    Write-Host "'$software' is installed."
}
#Start-Process "https://aka.ms/wslubuntu2004" Ubuntu 20.04
