# DecompressEXR

A Windows utility that converts compressed EXR files to uncompressed format for compatibility with TinyEXR (used by Godot Engine).

## Prerequisites

- **ImageMagick** must be installed and available in your system PATH
  - Download from: https://imagemagick.org/script/download.php#windows
  - During installation, make sure to check "Add application directory to system path"

## Quick Start (Basic Usage)

1. Copy `decompressEXR.bat` into any folder containing `.exr` files
2. Double-click the batch file to run it
3. Decompressed files will be created with `_decompressed` suffix

That's it! The script works standalone without any installation or registry modifications.

## Advanced Installation (Context Menu Integration)

For convenience, you can add the script to your right-click context menu to run it from anywhere without copying the file.

### Option 1: Manual Registry Entry

1. Press `Win + R`, type `regedit`, and press Enter
2. Navigate to: `HKEY_CLASSES_ROOT\Directory\Background\shell`
3. Right-click on `shell` → New → Key, name it `DecompressEXR`
4. In the right pane, double-click `(Default)` and set the value to: `Decompress EXR Files`
5. Right-click on `DecompressEXR` → New → Key, name it `command`
6. In the `command` key, double-click `(Default)` and set the value to:
   ```
   "C:\path\to\decompress_exr.bat" "%V"
   ```
   Replace `C:\path\to\` with the actual location where you saved `decompress_exr.bat`

### Option 2: Import Registry File

1. Place `decompress_exr.bat` in a permanent location (e.g., `C:\Tools\`)
2. Edit the provided `.reg` file to match your installation path
3. Double-click the `.reg` file and click "Yes" to add to registry

## Usage

1. Navigate to any folder containing `.exr` files in Windows Explorer
2. Right-click on empty space in the folder
3. Select "Decompress EXR Files" from the context menu
4. The script will silently process all EXR files in that folder

## What It Does

For each `.exr` file in the folder:
1. Converts it to uncompressed EXR format using ImageMagick
2. Saves the uncompressed version as `filename_decompressed.exr`
3. Keeps the original file intact (non-destructive)
4. Skips files that already have `_decompressed` in the filename

## Uninstallation

1. Press `Win + R`, type `regedit`, and press Enter
2. Navigate to: `HKEY_CLASSES_ROOT\Directory\Background\shell`
3. Right-click on `DecompressEXR` and select Delete
4. Delete the `decompress_exr.bat` file from your system

## Notes

- The script runs silently with no visible window
- Original files are never modified or deleted (non-destructive operation)
- Uncompressed EXR files are significantly larger than compressed versions
- Running the script multiple times is safe - already decompressed files are skipped
- ImageMagick must be properly installed for the script to work
