
@echo off
echo Welcome to the Windows Auto-Setup Script!
echo Please choose an installation type:

:menu
echo.
echo 1 - General Use
echo 2 - Development
echo.

:: Capture user choice
choice /c 12 /n /m "Enter your selection:"

:: Check the choice and jump to the corresponding section
if errorlevel 2 goto Development
if errorlevel 1 goto GeneralUse

:GeneralUse
echo You selected General Use.
echo Installing software for general use...

:: Mount network share
echo Mounting network share as Z: drive...
net use Z: \\192.168.1.133\Chungus /persistent:yes
:: change IP address and share name to match your network share

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

goto end

:Development
echo You selected Development.
echo Installing software for development use...

:: Mount network share
echo Mounting network share as Z: drive...
net use Z: \\192.168.1.133\Chungus /persistent:yes

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

:: Install VS Code
echo Installing VS Code...
powershell.exe -Command "Invoke-WebRequest 'https://update.code.visualstudio.com/latest/win32-x64-user/stable' -OutFile 'C:\Temp\VSCodeSetup.exe'"
start /wait "" "C:\Temp\VSCodeSetup.exe"

:: Install Python
echo Installing Python...
powershell.exe -Command "Invoke-WebRequest 'https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe' -OutFile 'C:\Temp\python-3.9.6-amd64.exe'"
start /wait "" "C:\Temp\python-3.9.6-amd64.exe" /quiet

:: Install Node.js
echo Installing Node.js...
powershell.exe -Command "Invoke-WebRequest 'https://nodejs.org/dist/v16.6.2/node-v16.6.2-x64.msi' -OutFile 'C:\Temp\node-v16.6.2-x64.msi'"
start /wait "" "C:\Temp\node-v16.6.2-x64.msi" /quiet

:: Install Notepad++
echo Installing Notepad++...
powershell.exe -Command "Invoke-WebRequest 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.4/npp.8.1.4.Installer.x64.exe' -OutFile 'C:\Temp\npp.8.1.4.Installer.x64.exe'"
start /wait "" "C:\Temp\npp.8.1.4.Installer.x64.exe" /S

:: Install PuTTY
echo Installing PuTTY...
powershell.exe -Command "Invoke-WebRequest 'https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.76-installer.msi' -OutFile 'C:\Temp\putty-64bit-0.76-installer.msi'"
start /wait "" "C:\Temp\putty-64bit-0.76-installer.msi" /quiet

:: Download and install Visual Studio Code
echo Downloading and installing Visual Studio Code...
powershell.exe -Command "Invoke-WebRequest 'https://go.microsoft.com/fwlink/?Linkid=850641' -OutFile 'C:\Temp\VSCodeSetup.exe'"
start /wait "" "C:\Temp\VSCodeSetup.exe" /silent /install

:: Download and install Git
echo Downloading and installing Git...
powershell.exe -Command "Invoke-WebRequest 'https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe' -OutFile 'C:\Temp\Git-2.33.0.2-64-bit.exe'"
start /wait "" "C:\Temp\Git-2.33.0.2-64-bit.exe" /SILENT /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"

:: Download and install Docker Desktop
echo Downloading and installing Docker Desktop...
powershell.exe -Command "Invoke-WebRequest 'https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe' -OutFile 'C:\Temp\Docker Desktop Installer.exe'"
start /wait "" "C:\Temp\Docker Desktop Installer.exe" /S

:: Download and install Postman
echo Downloading and installing Postman...
powershell.exe -Command "Invoke-WebRequest 'https://dl.pstmn.io/download/latest/win64' -OutFile 'C:\Temp\Postman-win64-latest.zip'"
powershell.exe -Command "Expand-Archive -Path 'C:\Temp\Postman-win64-latest.zip' -DestinationPath 'C:\Program Files\Postman'"

:: Download and install MySQL Workbench
echo Downloading and installing MySQL Workbench...
powershell.exe -Command "Invoke-WebRequest 'https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-8.0.26-winx64.msi' -OutFile 'C:\Temp\mysql-workbench-community-8.0.26-winx64.msi'"
start /wait "" "C:\Temp\mysql-workbench-community-8.0.26-winx64.msi" /quiet

:: Download and install Eclipse
echo Downloading and installing Eclipse...
powershell.exe -Command "Invoke-WebRequest 'https://mirror.downloadvn.com/eclipse/technology/epp/downloads/release/2021-06/R/eclipse-java-2021-06-R-win32-x86_64.zip' -OutFile 'C:\Temp\eclipse-java-2021-06-R-win32-x86_64.zip'"
powershell.exe -Command "Expand-Archive -Path 'C:\Temp\eclipse-java-2021-06-R-win32-x86_64.zip' -DestinationPath 'C:\Program Files\Eclipse'"

:: Download and install IntelliJ IDEA
echo Downloading and installing IntelliJ IDEA...
powershell.exe -Command "Invoke-WebRequest 'https://download.jetbrains.com/idea/ideaIC-2021.2.1.exe' -OutFile 'C:\Temp\ideaIC-2021.2.1.exe'"
start /wait "" "C:\Temp\ideaIC-2021.2.1.exe" /S

:: Download and install Android Studio
echo Downloading and installing Android Studio...
powershell.exe -Command "Invoke-WebRequest 'https://redirector.gvt1.com/edgedl/android/studio/install/2020.3.1.22/android-studio-2020.3.1.22-windows.exe' -OutFile 'C:\Temp\android-studio-2020.3.1.22-windows.exe'"
start /wait "" "C:\Temp\android-studio-2020.3.1.22-windows.exe" --silent --install-location=C:\Program Files\Android\Android Studio

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

:end
echo.
echo Installation complete!
pause
