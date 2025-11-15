@echo off
setlocal enabledelayedexpansion

REM Change to the directory passed as parameter
if not "%~1"=="" cd /d "%~1"

REM Check if ImageMagick is available
magick -version >nul 2>&1
if errorlevel 1 exit /b 1

REM Process all .exr files in current directory
for %%f in (*.exr) do (
    REM Skip files that already have _decompressed suffix
    echo %%f | find "_decompressed" >nul
    if errorlevel 1 (
        REM Convert to uncompressed format with _decompressed suffix
        magick "%%f" -compress None -define exr:compression=none "%%~nf_decompressed%%~xf" >nul 2>&1
    )
)
