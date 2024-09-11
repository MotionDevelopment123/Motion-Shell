@ECHO OFF
:Start
type %MYFILES%\Header.txt
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
ECHO 3. Set as current shell
ECHO 4. Install another module
ECHO 5. Exit
ECHO.
ECHO.
set /p op=Please select:
if "%op%"=="1" goto CUSTOM-Location
if "%op%"=="2" goto Closing
if "%op%"=="3" goto Set-Shell
if "%op%"=="4" goto Module
if "%op%"=="5" goto end

:Steam-Location
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Please select your custom.exe
rem BrowseFiles
ECHO|set /p=%result%>CUSTOM.LOCATION
goto Start

:Closing
CLS
type %MYFILES%\Header.txt
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
ECHO Please select the program you would like to be run at when your shell program is closed (if you would like to add launch paramaters you can open the CLOSED.LOCATION file using notepad)
rem BrowseFiles
ECHO|set /p=%result%>CLOSED.LOCATION
goto Start

:Set-Shell
call %MYFILES%\set-Shell.bat
goto Start


:Module
Start C:\Motion-Shell\Motion-Settings.exe
goto end



:end
Exit
