@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Motion-Shell\Settings\Custom-Settings.exe
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Motion-Shell Settings
REM BFCPEVERDESC=
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Settings
REM BFCPEOPTIONEND
@ECHO OFF
CD C:\Motion-Shell\Custom
:Start
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.
ECHO Custom settings
ECHO.
ECHO 1. Custom shell Location
type C:\Motion-Shell\CUSTOM\CUSTOM.LOCATION
ECHO.
ECHO 2. Closing action
type C:\Motion-Shell\CUSTOM\CLOSED.LOCATION
ECHO.
ECHO 3. Change Shell
ECHO 4. Exit
ECHO.
ECHO.
set /p op=Please select:
if "%op%"=="1" goto CUSTOM-Location
if "%op%"=="2" goto Closing
if "%op%"=="3" goto Set-Shell
if "%op%"=="4" goto end

:CUSTOM-Location
CLS
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.
ECHO Please select your custom.exe
rem BrowseFiles
ECHO|set /p=%result%>CUSTOM.LOCATION
goto Start

:Closing
CLS
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.

ECHO 1. Launch Windows Shell (default)
ECHO 2. Logout (recommened)
ECHO 3. Launch custom program

set /p EXITop=Select what you would like to happen when you close Steam:

if "%EXITop%"=="1" goto EXITop1
if "%EXITop%"=="2" goto EXITop2
if "%EXITop%"=="3" goto EXITop3

:EXITop1
SET "EXITaction=explorer.exe"
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto Start

:EXITop2
SET "EXITaction=Shutdown -l"
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto Start

:EXITop3
ECHO Please select the program you would like to be run when your shell program is closed (if you would like to add launch paramaters you can open the CLOSED.LOCATION file using notepad)
rem BrowseFiles
ECHO|set /p=%result%>CLOSED.LOCATION
goto Start

:Set-Shell
call C:\Motion-Shell\Settings\set-Shell.bat
goto Start


:end
Exit
