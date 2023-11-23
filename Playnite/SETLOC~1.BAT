@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Shared Folder\GitHub\playnite-shell\Playnite-Shell Settings.exe
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Playnite-Shell Settings
REM BFCPEVERDESC=Set file locations
REM BFCPEVERCOMPANY=Motion Development
REM BFCPEVERCOPYRIGHT=
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Playnite-Shell Settings
REM BFCPEOPTIONEND
@ECHO OFF
CD C:\Playnite-Shell
set /p PLAYNITE=<Playnite.LOCATION
set /p FFPLAY=<FFPLAY.LOCATION
set /p SIZE=<SCREENSIZE.PIXELS
set /p VIDEO=<VIDEO.LOCATION



ECHO If this is your first time running the program please select option 1
ECHO.

@ECHO OFF
:Begin
ECHO 1.All

ECHO 2.Playnite

ECHO 3.FFPLAY
ECHO	NOTE: FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip

ECHO 4.Splash Video

ECHO 5.Screen Size

ECHO 6.Exit
ECHO.

set /p op=Please select which locations you would like to set:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5
if "%op%"=="6" goto end
ECHO.

:op1
@ECHO OFF
ECHO Playnite installation folder (Please include \ at end)
ECHO.
ECHO Current location: %Playnite%
set /p Playnite=Playnite Folder location:
ECHO|set /p="%Playnite%">PLAYNITE.LOCATION
ECHO.

ECHO FFPLAY Location
ECHO	NOTE: FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
ECHO.
ECHO Current location: %FFPLAY%
set /p FFPLAY=FFPLAY.exe location:
ECHO|set /p="%FFPLAY%">FFPLAY.LOCATION
ECHO.

ECHO Screen size
ECHO	Please format like: -x 1920 -y 1080
ECHO.
ECHO Current size: %SIZE%
set /p SIZE=Screen size:
ECHO|set /p="%SIZE%">SCREENSIZE.PIXELS
ECHO.

ECHO Splash Video
ECHO.
ECHO Current video: %VIDEO%
set /p VIDEO=Video location:
ECHO|set /p="%VIDEO%">VIDEO.LOCATION
ECHO.
GOTO Begin

:op2
@ECHO OFF
ECHO Playnite installation folder (Please include \ at end)
ECHO.
ECHO Current location: %Playnite%
set /p Playnite=Playnite Folder location:
ECHO|set /p="%Playnite%">PLAYNITE.LOCATION
ECHO.

GOTO Begin

:op3
@ECHO OFF

ECHO FFPLAY Location
ECHO	NOTE: FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
ECHO.
ECHO Current location: %FFPLAY%
set /p FFPLAY=FFPLAY.exe location:
ECHO|set /p="%FFPLAY%">FFPLAY.LOCATION
ECHO.

GOTO Begin

:op4
@ECHO OFF
ECHO Screen size
ECHO	Please format like: -x 1920 -y 1080
ECHO.
ECHO Current size: %SIZE%
set /p SIZE=Screen size:
ECHO|set /p="%SIZE%">SCREENSIZE.PIXELS
ECHO.

GOTO Begin

:op5
@ECHO OFF

ECHO Current video: %VIDEO%
set /p VIDEO=Video location:
ECHO|set /p="%VIDEO%">VIDEO.LOCATION
ECHO.

GOTO Begin

:End
Exit