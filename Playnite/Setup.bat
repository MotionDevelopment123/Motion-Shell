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
REM BFCPEVERVERSION=1.0.0.0
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
REM BFCPEOPTIONEND
@ECHO OFF
ECHO Motion-Shell - Steam
ECHO.
ECHO Installing...

@ECHO OFF
CD C:\
md Motion-Shell
CD C:\Motion-Shell
md Steam
CD C:\Motion-Shell\Steam
copy %MYFILES%\*.* C:\Motion-Shell\Steam


CLS
ECHO Please select your Steam.exe
rem BrowseFiles
ECHO|set /p=%result%>STEAM.LOCATION

CLS
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
goto misc

:EXITop2
SET "EXITaction=Shutdown -l"
ECHO|set /p=%EXITaction%>CLOSED.LOCATION
goto misc

:EXITop3
ECHO Please select the program you would like to be run at when steam is closed (if you would like to add launch paramaters you can open the CLOSED.LOCATION file using notepad)
rem BrowseFiles
ECHO|set /p=%result%>CLOSED.LOCATION
goto misc

:misc
CLS
ECHO Installing...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Steam\SDL.exe" /f
goto complete

:complete
CLS
ECHO Motion-Shell is now installed and set as the Shell to launch Steam and when closed run %EXITaction%
ECHO.
ECHO For help and more information please visit: https://sites.google.com/view/motion-shell/
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