@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\hbrow\Desktop\Motion-Shell Setup.exe
REM BFCPEICON=
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
REM BFCPEOPTIONEND
@ECHO OFF

:Welcome
ECHO Welcome to Motion-Shell Setup
ECHO.
ECHO Please take a moment to read the following before continuing:
ECHO.
ECHO Motion-Shell will replace the Windows Shell of the account running this script, please do not run the script as administrator!
ECHO.
ECHO It is recommended to run the Setup from a secondary PC account, Steam is accsessible accross PC accounts and Playnite is best to be installed as a portable program to the C:\Playnite location
ECHO.
ECHO.

CLS

ECHO Please select which program you would like to set as the Shell:
ECHO.
ECHO 1. Steam
ECHO 2. Playnite Splash 	(Has support for a custom launch video)
ECHO 2. Playnite
ECHO 3. Custom	(COMING SOON!)
ECHO 4. Exit
ECHO.
ECHO.
set /p op=Please select which locations you would like to set:
if "%op%"=="1" goto Steam
if "%op%"=="2" goto Playnite-Splash
if "%op%"=="3" goto Custom
if "%op%"=="4" goto end

:Steam
CLS
ECHO Motion-Shell - Steam
ECHO Sets the Shell to Steam and opens the Windows-Shell once closed
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Steam-Setup.exe
GOTO end

:Playnite-Splash
CLS
ECHO Motion-Shell - Playnite-Splash
ECHO Sets the Shell to Playnite with a launch video of your choice then opens the Windows-Shell once closed
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Playnite-Setup.exe
GOTO end

:custom
CLS
ECHO This is coming soon!
ECHO.
GOTO Welcome

:end
Exit