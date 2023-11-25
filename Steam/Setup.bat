@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Steam\Steam-Setup.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter PRO v4.61\ab2econv461pro\icons\icon12.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=0.5.0.0
REM BFCPEVERPRODUCT=Motion-Shell Setup - Steam
REM BFCPEVERDESC=Motion-Shell Setup - Steam
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Shell Setup
REM BFCPEEMBED=C:\Shared Folder\GitHub\SDL\SDL\CLOSED.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\SDL\SDL\ICON.ico
REM BFCPEEMBED=C:\Shared Folder\GitHub\SDL\SDL\Return To Gaming Mode.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\SDL\SDL\SDL.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\SDL\SDL\STEAM.LOCATION
REM BFCPEEMBED=C:\Motion-Shell\Steam\Return To Gaming Mode.exe
REM BFCPEOPTIONEND
@ECHO OFF
ECHO Motion-Shell - Steam
ECHO.
ECHO Installing...
CD C:\Motion-Shell\
md Steam
CD C:\Motion-Shell\Steam
copy %MYFILES%\*.* C:\Motion-Shell\Steam
reg add "HKEY_CURRENT_USER\Software\Microsoft\WindowsNT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Steam\SDL.exe" /f

CLS
ECHO Please select your Steam.exe
rem BrowseFiles
ECHO|set /p=%result%>STEAM.LOCATION

CLS
ECHO 1. Launch Windows Shell (default & recommened)
ECHO 2. Logout (recommened)
ECHO 3. Launch custom program

set /p EXITop=Select what you would like to happen when you close Steam:

if "%EXITop%"=="1" goto EXITop1
if "%EXITop%"=="2" goto EXITop2
if "%EXITop%"=="3" goto EXITop3

:EXITop1
SET /P EXITaction=explorer.exe
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto misc

:EXITop2
SET /P EXITaction=Shutdown -l
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto misc

:EXITop3
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto misc

:misc
CLS
goto complete

:complete
CLS
ECHO Motion-Shell - Steam is now installed and set as the Shell
ECHO.
ECHO Would you like to logout now to use the new shell?
set /p logoutop=Y/N:
IF "%logoutop%"=="Y" goto logout
IF "%logoutop%"=="N" goto end

:logout
shutdown -l -f

:end
EXIT
