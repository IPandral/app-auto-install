
# Windows Auto-Install and Configuration Script

This is an advanced batch script designed to automatically install common applications, mount a network share, and configure system settings on a fresh install of Windows.

## Features

- Mounts a network share to a drive letter
- Installs the following software:
  - Google Chrome
  - Discord
  - Steam
  - Epic Games Launcher
  - Battle.net
  - Spotify
- Disables system sleep and hibernation
- Enables Remote Desktop
- Forces Windows Update to check for updates

## Requirements

- Windows operating system
- Administrative privileges for software installation and system configuration

## Usage

1. Download the `auto_install.bat` script from this repository.
2. Right-click on the script and choose "Run as administrator".

**Note**: Running scripts from the internet is risky. Always read through the script and understand what it does before running it.

## How it Works

1. **Network Share Mounting**: Mounts a public network share located at `\\192.168.1.133\share` to the `Z:` drive.
2. **Software Installation**: Downloads and installs each software one by one.
3. **System Configuration**: Disables sleep, enables Remote Desktop, and forces a Windows Update check.

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
