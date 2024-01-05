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
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Header.txt
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\config-Script.PS1
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\FFPLAY.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\Motion-Shell.exe
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\PLAYNITE.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\SCREENSIZE.PIXELS
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\VIDEO.LOCATION
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Playnite\Windows-Shell.exe
REM BFCPEOPTIONEND
@ECHO OFF
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

@ECHO OFF
CD C:\Motion-Shell
md Playnite
CD C:\Motion-Shell\Playnite
copy %MYFILES%\Splash-Shell.exe C:\Motion-Shell\Playnite
copy %MYFILES%\Windows-Shell.exe C:\Motion-Shell\Playnite
copy %MYFILES%\config-Script.ps1 C:\Motion-Shell\Playnite
copy %MYFILES%\PLAYNITE.LOCATION C:\Motion-Shell\Playnite
copy %MYFILES%\FFPLAY.LOCATION C:\Motion-Shell\Playnite
copy %MYFILES%\SCREENSIZE.PIXELS C:\Motion-Shell\Playnite
copy %MYFILES%\VIDEO.LOCATION C:\Motion-Shell\Playnite
goto locations

:locations
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Please select your Playnite installation folder
rem BrowseFolder
ECHO|set /p=%result%>Playnite.LOCATION
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.

:misc
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%PLAYNITE%" /f

powershell.exe -noprofile -executionpolicy bypass -file .\config-Script.ps1

goto complete

:complete
CLS
type %MYFILES%\Header.txt
ECHO.
ECHO.
ECHO Motion Shell is now installed and set as the Shell to launch Playnite and when closed will launch the Windows Shell.
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