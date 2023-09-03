@echo off
echo Setting up your software and network drives...

:: Mount network share
echo Mounting network share as Z: drive...
net use Z: \\192.168.1.133\share /persistent:yes

:: Create a temp directory for downloads
mkdir C:\Temp

:: Install Google Chrome
echo Installing Google Chrome...
powershell.exe -Command "Invoke-WebRequest 'https://dl.google.com/chrome/install/375.126/chrome_installer.exe' -OutFile 'C:\Temp\chrome_installer.exe'"
start /wait "" "C:\Temp\chrome_installer.exe" /silent /install

:: Install Discord
echo Installing Discord...
powershell.exe -Command "Invoke-WebRequest 'https://discord.com/api/download?platform=win' -OutFile 'C:\Temp\DiscordSetup.exe'"
start /wait "" "C:\Temp\DiscordSetup.exe"

:: Install Steam
echo Installing Steam...
powershell.exe -Command "Invoke-WebRequest 'https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe' -OutFile 'C:\Temp\SteamSetup.exe'"
start /wait "" "C:\Temp\SteamSetup.exe" /silent

:: Install Epic Games Launcher
echo Installing Epic Games Launcher...
powershell.exe -Command "Invoke-WebRequest 'https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi' -OutFile 'C:\Temp\EpicInstaller.msi'"
start /wait msiexec /i "C:\Temp\EpicInstaller.msi" /quiet

:: Download and install Battle.net
echo Installing Battle.net...
powershell.exe -Command "Invoke-WebRequest 'https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live' -OutFile 'C:\\Temp\\BattleNet-Setup.exe'"
start /wait "" "C:\\Temp\\BattleNet-Setup.exe"

:: Install Spotify
echo Installing Spotify...
powershell.exe -Command "Invoke-WebRequest 'https://download.scdn.co/SpotifyFullSetup.exe' -OutFile 'C:\Temp\SpotifySetup.exe'"
start /wait "" "C:\Temp\SpotifySetup.exe"

:: Cleanup
echo Cleaning up...
rd /s /q C:\Temp

echo All Done. All software is installed and network share is mounted.

:: Disable sleep
echo Disabling sleep...
powercfg /change -standby-timeout-ac 0
powercfg /change -hibernate-timeout-ac 0

:: Enable Remote Desktop
echo Enabling Remote Desktop...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

:: Force Windows Update
echo Forcing Windows Update...
wuauclt /detectnow
wuauclt /updatenow
