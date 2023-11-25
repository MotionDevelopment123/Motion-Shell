@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Playnite\Playnite-Setup.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter PRO v4.61\ab2econv461pro\icons\icon12.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Motion-Shell Setup - Playnite
REM BFCPEVERDESC=Motion-Shell Setup - Playnite
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Shell Setup
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\config-Script.PS1
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\FFPLAY.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\PLAYNITE.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\SCREENSIZE.PIXELS
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\Splash-Shell.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\VIDEO.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\playnite-shell\Playnite\Windows-Shell.exe
REM BFCPEOPTIONEND
@ECHO OFF
ECHO Motion-Shell - Playnite
ECHO.
ECHO Installing...
ECHO.
ECHO.

@ECHO OFF
CD C:\
md Motion-Shell
CD C:\Motion-Shell
md Playnite
CD C:\Motion-Shell\Playnite
copy %MYFILES%\*.* C:\Motion-Shell\Playnite
goto locations

:locations
ECHO Please select your Playnite installation folder
rem BrowseFolder
ECHO|set /p=%result%>Playnite.LOCATION
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.


ECHO FFPLAY Location
ECHO.
ECHO	NOTE: FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
rem BrowseFiles
ECHO|set /p=%result%>FFPLAY.LOCATION
ECHO.
ECHO FFPLAY.exe set to: %result%
ECHO.
ECHO.


ECHO Screen size:
ECHO.
ECHO width (in pixels)
set /p WIDTH=eg 1920:
ECHO.
ECHO Height (in pixels)
set /p HEIGHT=eg 1080:
ECHO.
set /p SIZE=-x %WIDTH% -y %HEIGHT%
ECHO|set /p=%SIZE%>SCREENSIZE.PIXELS
ECHO.
ECHO size set to: %HEIGHT% X %WIDTH%
ECHO.
ECHO.

ECHO Splash Video
ECHO.
set /p VIDEO=Video location:
rem BrowseFiles
ECHO|set /p=%result%>VIDEO.LOCATION
ECHO.
ECHO Video set to: %result%
ECHO.
ECHO.
goto misc


:misc
CLS
ECHO Motion-Shell - Playnite
ECHO.
ECHO Installing...
ECHO.
ECHO.

ECHO Installing...

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "C:\Motion-Shell\Playnite\Splash-Shell.exe" /f

powershell.exe -noprofile -executionpolicy bypass -file .\config-Script.ps1

goto complete

:complete
CLS

ECHO Motion-Shell is now installed and set as the Shell to launch Playnite with your splash video and when closed run will launch the Windows Shell
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