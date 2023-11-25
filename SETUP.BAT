@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Motion-Shell Setup.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter PRO v4.61\ab2econv461pro\icons\icon12.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Motion-Shell Setup
REM BFCPEVERDESC=Install and Setup Motion-Shell
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Shell Setup
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\Motion-Shell-Playnite.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Steam\Motion-Shell-Steam.exe
REM BFCPEOPTIONEND
@ECHO OFF

:Welcome
ECHO Welcome to Motion-Shell Setup
ECHO.
ECHO Please take a moment to read the following before continuing:
ECHO.
ECHO Motion-Shell will replace the Windows Shell of the account running this script (please ensure this account has admin rights)
ECHO.
ECHO It is recommended to run the Setup from a secondary PC account, Steam is accsessible accross PC accounts and Playnite is best to be installed as a portable program to the C:\Playnite location
ECHO.
ECHO.

CLS

ECHO Please select which program you would like to set as the Shell:
ECHO.
ECHO 1. Steam
ECHO 2. Playnite Splash 	(Has support for a custom launch video)
ECHO 3. Playnite (Without splash coming soon)
ECHO 4. Custom	(COMING SOON!)
ECHO 5. Exit
ECHO.
ECHO.
set /p op=Please select which locations you would like to set:
if "%op%"=="1" goto Steam
if "%op%"=="2" goto Playnite-Splash
if "%op%"=="3" goto Playnite
if "%op%"=="4" goto Custom
if "%op%"=="5" goto end

:Steam
CLS
ECHO Motion-Shell - Steam
ECHO Sets the Shell to Steam and opens the Windows-Shell once closed
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Motion-Shell-Steam.exe
GOTO end

:Playnite-Splash
CLS
ECHO Motion-Shell - Playnite-Splash
ECHO Sets the Shell to Playnite with a launch video of your choice then opens the Windows-Shell once closed
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Motion-Shell-Playnite.exe
GOTO end

:Playnite
CLS
ECHO This is coming soon!
ECHO.
GOTO Welcome

:custom
CLS
ECHO This is coming soon!
ECHO.
GOTO Welcome

:end
Exit