@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\Motion-Shell\Settings\Motion-Settings.exe
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Motion-Settings
REM BFCPEVERDESC=Change Motion-Shell settings
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Motion-Settings
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Settings\Custom-Settings.bat
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Settings\Playnite-Settings.bat
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Settings\set-Shell.bat
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Settings\Settings.bat
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Settings\Steam-Settings.bat
REM BFCPEEMBED=C:\Shared Folder\GitHub\Motion-Shell\Setup\Header.txt
REM BFCPEOPTIONEND
@ECHO OFF
:Welcome
type C:\Motion-Shell\Settings\Header.txt
CD C:\Motion-Shell\Settings
set /p op=<CURRENT.OPTION
if "%op%"=="Steam" goto Steam
if "%op%"=="Playnite-Splash" goto Playnite-Splash
if "%op%"=="Playnite" goto Playnite
if "%op%"=="Custom" goto Custom

:Steam
CLS
Call C:\Motion-Shell\Settings\Steam-Settings.bat
GOTO end

:Playnite-Splash
CLS
Call C:\Motion-Shell\Settings\Playnite-Splash-Settings.bat
GOTO end

:Playnite
CLS
Call C:\Motion-Shell\Settings\Playnite-Settings.bat
GOTO end

:custom
CLS
Call C:\Motion-Shell\Settings\Custom-Settings.bat
GOTO end

:end
exit
