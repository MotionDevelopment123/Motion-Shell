@ECHO OFF
:Start
CD C:\Motion-Shell\Playnite
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.
ECHO Playnite settings
ECHO.
ECHO 1. Playnite Location
type C:\Motion-Shell\Playnite\PLAYNITE.LOCATION
ECHO.
ECHO 2. FFPLAY.exe Location
type C:\Motion-Shell\Playnite\FFPLAY.LOCATION
ECHO.
ECHO 3. Change Shell
ECHO.
ECHO The following 2 options only apply to the Splash version
ECHO.
ECHO 4. Splash video size
ECHO 5. Splash video
ECHO.
ECHO 6. Exit
ECHO.
ECHO.
set /p op=Please select:
if "%op%"=="1" goto PLAYNITELOCATION
if "%op%"=="2" goto FFPLAYLOCATION
if "%op%"=="3" goto Set-Shell
if "%op%"=="4" goto SIZE
if "%op%"=="4" goto SPLASHVIDEO
if "%op%"=="6" goto end

:PLAYNITELOCATION
CLS
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.
ECHO Please select your Playnite installation folder
rem BrowseFolder
ECHO|set /p=%result%>Playnite.LOCATION
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.
CLS & goto Start
:FFPLAYLOCATION
CLS
type C:\Motion-Shell\Settings\Header.txt
ECHO.
ECHO.
ECHO Please select your FFPLAY.exe Location
ECHO.
ECHO	NOTE: FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
rem BrowseFiles
ECHO|set /p=%result%>FFPLAY.LOCATION
ECHO.
ECHO FFPLAY.exe set to: %result%
ECHO.
ECHO.
CLS & goto Start
:SIZE
CLS
type C:\Motion-Shell\Settings\Header.txt
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
ECHO size set to: %WIDTH% X %HEIGHT%
ECHO.
ECHO.
CLS & goto Start
:SPLASHVIDEO
CLS
type C:\Motion-Shell\Settings\Header.txt
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
CLS & goto Start
:Set-Shell
call C:\Motion-Shell\Settings\set-Shell.bat
goto end
:end
Exit