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
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\Setup\Motion-Shell-Playnite.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Steam\Setup\Motion-Shell-Steam.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Setup\Header.txt
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Setup\Welcome.txt
REM BFCPEOPTIONEND
@ECHO OFF
:Welcome
type %MYFILES%\Welcome.txt
ECHO.
ECHO 1. Steam
ECHO 2. Playnite Splash (Has support for a custom launch video)
ECHO 3. Playnite
ECHO 4. Custom (COMING SOON!)
ECHO 5. Exit
ECHO.
ECHO.
set /p op=Please select:
if "%op%"=="1" goto Steam
if "%op%"=="2" goto Playnite-Splash
if "%op%"=="3" goto Playnite
if "%op%"=="4" goto Custom
if "%op%"=="5" goto end

:Steam
CLS
type %MYFILES\Header.txt
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Motion-Shell-Steam.exe
GOTO end

:Playnite-Splash
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Installing...
START %MYFILES%\Motion-Shell-Playnite.exe
GOTO end

:Playnite
CLS
type %MYFILES%\Header.txt
ECHO This is coming soon!
ECHO.
GOTO Welcome

:custom
CLS
type %MYFILES%\Header.txt
ECHO This is coming soon!
ECHO.
GOTO Welcome

:end
Exit
