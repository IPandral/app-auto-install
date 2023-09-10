
# Windows Auto-Install and Configuration Script with Menu

This batch script allows you to automatically install common applications, mount a network share, and configure system settings on a fresh install of Windows. It features a user selection menu to customize the installation based on the intended use (General Use or Development).

## Features

- User selection menu for installation type: General Use or Development
- Mounts a network share to a drive letter
- Installs the following software for General Use:
  - Google Chrome: Web browser
  - Discord: Communication platform
  - Steam: Gaming platform
  - Epic Games Launcher: Another gaming platform
  - Battle.net: Online gaming platform
  - Spotify: Music streaming service
- Installs additional software for Development:
  - All software from the "General Use" option
  - VS Code: Source code editor
  - Python: Programming language
  - Node.js: JavaScript runtime
  - Notepad++: Text and source code editor
  - PuTTY: SSH and telnet client
  - Docker Desktop: Containerization platform
  - Postman: API testing tool
  - MySQL Workbench: Database design & management
  - Eclipse: IDE for Java
  - IntelliJ IDEA: IDE for Java
  - Android Studio: IDE for Android development
- Disables system sleep and hibernation
- Enables Remote Desktop
- Forces Windows Update to check for updates

## Requirements

- Windows operating system
- Administrative privileges for software installation and system configuration

## Usage

1. Download the `autoinstall.bat` script from this repository.
2. Right-click on the script and choose "Run as administrator".
3. Follow the on-screen menu to select the installation type.

**Note**: Running scripts from the internet is risky. Always read through the script and understand what it does before running it.

## How it Works

1. **User Selection Menu**: Allows the user to choose between General Use and Development.
2. **Network Share Mounting**: Mounts a public network share located at `\\192.168.1.133\share` to the `Z:` drive.
3. **Software Installation**: Downloads and installs each software one by one, based on the user's selection.
4. **System Configuration**: Disables sleep, enables Remote Desktop, and forces a Windows Update check.

## Customization

- You can customize the network share and drive letter in the `net use` command.
- You can add or remove software installations by modifying the `powershell.exe -Command "Invoke-WebRequest"` lines and their corresponding `start /wait` lines.
- Additional system configurations can be added as needed.

## Security

- This script downloads executable files from the internet. Make sure you trust the source before running them.
- The network share is mounted without any credentials. Ensure that you are okay with this level of access.
- Disabling sleep and enabling Remote Desktop may have security implications.

## License

This script is released under the MIT License. See the [LICENSE](LICENSE) file for details.
