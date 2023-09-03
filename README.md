
# Windows Auto-Install Script

This is a simple batch script designed to automatically install common applications and mount a network share on a fresh install of Windows.

## Features

- Mounts a network share to a drive letter
- Installs the following software:
  - Google Chrome
  - Discord
  - Steam
  - Epic Games Launcher
  - Battle.net
  - Spotify

## Requirements

- Windows operating system
- Administrative privileges for software installation

## Usage

1. Download the `autoinstall.bat` script from this repository.
2. Right-click on the script and choose "Run as administrator".

**Note**: Running scripts from the internet is risky. Always read through the script and understand what it does before running it.

## How it Works

1. **Network Share Mounting**: The script first mounts a public network share located at `\\192.168.1.133\share` to the `Z:` drive. 
2. **Software Installation**: The script then downloads and installs each software one by one.

## Customization

- You can customize the network share and drive letter in the `net use` command.
- You can add or remove software installations by modifying the `powershell.exe -Command "Invoke-WebRequest"` lines and their corresponding `start /wait` lines.

## Security

- This script downloads executable files from the internet. Make sure you trust the source before running them.
- The network share is mounted without any credentials. Ensure that you are okay with this level of access.

## License

This script is released under the MIT License. See the [LICENSE](LICENSE) file for details.
