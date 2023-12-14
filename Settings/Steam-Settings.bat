@ECHO OFF
:Start
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Steam settings
ECHO.
ECHO 1. Steam Location
type C:\Motion-Shell\Steam\STEAM.LOCATION
ECHO.
ECHO 2. Closing action
type C:\Motion-Shell\Steam\CLOSED.LOCATION
ECHO.
ECHO 3. Set as current shell
ECHO 4. Install another module
ECHO 5. Exit
ECHO.
ECHO.
set /p op=Please select:
if "%op%"=="1" goto Steam-Location
if "%op%"=="2" goto Closing
if "%op%"=="3" goto Set-Shell
if "%op%"=="4" goto Module
if "%op%"=="5" goto end

:Steam-Location
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Please select your Steam.exe
rem BrowseFiles
ECHO|set /p=%result%>STEAM.LOCATION
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
ECHO Please select the program you would like to be run at when steam is closed (if you would like to add launch paramaters you can open the CLOSED.LOCATION file using notepad)
rem BrowseFiles
ECHO|set /p=%result%>CLOSED.LOCATION
goto Start

:Set-Shell
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Steam\Motion-Shell.exe" /f
goto Start


:Module
Start C:\Motion-Shell\Motion-Settings.exe
goto end



:end
Exit