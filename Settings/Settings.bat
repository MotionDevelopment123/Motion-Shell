@ECHO OFF
:Welcome
type %MYFILES%\Header.txt
set /p op=<CURRENT.OPTION
if "%op%"=="Steam" goto Steam
if "%op%"=="Playnite-Splash" goto Playnite-Splash
if "%op%"=="Playnite" goto Playnite
if "%op%"=="Custom" goto Custom

:Steam
CLS
Call %MYFILES%\Steam-Settings.bat
GOTO end

:Playnite-Splash
CLS
Call %MYFILES%\Playnite-Splash-Settings.bat
GOTO end

:Playnite
CLS
Call %MYFILES%\Playnite-Settings.bat
GOTO end

:custom
CLS
Call %MYFILES%\Custom-Settings.bat
GOTO end

:end
Exit
