@ECHO OFF
CD C:\Playnite-Shell\

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
GOTO Config.json

:Config.json
@ECHO OFF
powershell.exe -noprofile -executionpolicy bypass -file .\config-Script.ps1
EXIT