@ECHO OFF

ECHO Uninstaller

ECHO This will remove Motion-Shell and any installed modules, replacing your shell back to the default Windows Shell.
ECHO If you are looking to remove a module please check the Motion-Shell Settings program.

ECHO Are you sure you want to continue?

set /p confirm=Y/N:
if "%confirm%"=="Y" goto Continue
if "%confirm%"=="y" goto Continue
if "%confirm%"=="N" goto nouninstall
if "%confirm%"=="n" goto nouninstall

:nouninstall
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO. No changes have been made to Motion-Shell or its setup.
pause
exit

:Continue
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
Uninstalling Motion-Shell and any modules installed
ECHO.
ECHO.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "" /f
ECHO Registry key returned to default
rmdir /S /Q C:\Motion-Shell
ECHO Removed Files
ECHO.
ECHO.
ECHO Motion-Shell uninstalled.
pause
exit