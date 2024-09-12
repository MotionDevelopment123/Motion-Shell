@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Setup\Playnite\Motion-Shell-Playnite.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter PRO v4.61\ab2econv461pro\icons\icon12.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Motion-Shell Setup
REM BFCPEVERDESC=Motion-Shell Setup
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Shell Setup
REM BFCPEOPTIONEND
@ECHO OFF
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

@ECHO OFF
CD C:\Users\%USERNAME%\
md Motion-Shell
CD C:\Users\%USERNAME%\Motion-Shell
md Playnite-NSV
CD C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %MYFILES%\Splash-Shell.exe C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %MYFILES%\Windows-Shell.exe C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %MYFILES%\config-Script.ps1 C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %MYFILES%\PLAYNITE.LOCATION C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
goto locations

:locations
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Please select your Playnite installation folder
ECHO By default this is C:\Users\%USERNAME%\AppData\Local\Playnite but may be different if you selected to change location or used the portable install option during setup.
PAUSE
rem BrowseFolder
ECHO|set /p=%result%>Playnite.LOCATION
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.
timeout /t 10

:misc
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

set /p PLAYNITE=<PLAYNITE.LOCATION

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%PLAYNITE%\Playnite.FullscreenApp.exe" /f

powershell.exe -noprofile -executionpolicy bypass -file .\config-Script.ps1

goto complete

:complete
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Motion Shell is now installed and set as the Shell, this will launch Playnite when you next sign in, when you close Playnite the default Windows Explorer will be opened.
ECHO.
ECHO.

ECHO Would you like to logout now to use the new shell?
set /p logoutop=Y/N:
IF "%logoutop%"=="Y" goto logout
IF "%logoutop%"=="N" goto end
IF "%logoutop%"=="y" goto logout
IF "%logoutop%"=="n" goto end

:logout
shutdown -l -f

:end
EXIT