@ECHO OFF
type .\txt\Welcome.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

@ECHO OFF
rem Extracting required files to a temp directory
md %temp%\Motion-Shell
copy .\Files\Playnite-Splash\Windows-Shell.exe %temp%\Motion-Shell
copy .\Files\Playnite-Splash\Default-Config-Script.ps1 %temp%\Motion-Shell
copy .\Files\Playnite-Splash\Portable-Config-Script.ps1 %temp%\Motion-Shell
copy .\Files\Playnite-Splash\PLAYNITE.LOCATION %temp%\Motion-Shell
copy .\Files\Playnite-Splash\FFPLAY.LOCATION %temp%\Motion-Shell
copy .\Files\Playnite-Splash\SCREENSIZE.PIXELS %temp%\Motion-Shell
copy .\Files\Playnite-Splash\VIDEO.LOCATION %temp%\Motion-Shell
copy .\txt\Header.txt %temp%\Motion-Shell
set Header=%temp%\Motion-Shell\Header.txt

@ECHO OFF
rem Creating folders and copying required files from temp
CLS
CD C:\Users\%USERNAME%\
md Motion-Shell
CD C:\Users\%USERNAME%\Motion-Shell
md Playnite-Splash
CD C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\Windows-Shell.exe C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\Default-config-Script.ps1 C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\Portable-config-Script.ps1 C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\PLAYNITE.LOCATION C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\FFPLAY.LOCATION C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\SCREENSIZE.PIXELS C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
copy %temp%\Motion-Shell\VIDEO.LOCATION C:\Users\%USERNAME%\Motion-Shell\Playnite-Splash
goto locations

:locations
rem setting user Playnite installation folder
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Set your playnite installation location
ECHO.
ECHO By default this is C:\Users\%USERNAME%\AppData\Local\Playnite but may be different if you selected to change location or used the portable install option during setup.
ECHO Please do not use quotation marks ("")
Set /p result=Enter your playnite installation location:
ECHO|set /p=%result%>Playnite.LOCATION
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.

CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Set your FFPLAY.exe location
ECHO.
ECHO FFPLAY.EXE can be downloaded from: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
ECHO Once downloaded please extract to a folder of your choice
ECHO Please do not use quotation marks ("")
Set /p result=Enter your FFPLAY.exe installation location:
ECHO|set /p=%result%>FFPLAY.LOCATION
CLS
ECHO FFPLAY.exe location set to: %result%

CLS
type %MYFILES%\Header.txt
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
CLS

CLS
type %Header%
ECHO.
ECHO.
ECHO Splash Video
ECHO.
set /p VIDEO=Video location:
ECHO|set /p=%VIDEO%>VIDEO.LOCATION
ECHO.
ECHO Video set to: %VIDEO%
ECHO.
ECHO.

REM need to add the remainging from here

ECHO 
timeout /t 10
goto misc

:misc
rem adding registry key to set Playnite as shell and running a Powershell script to set Playnite startup and close script.
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%result%\Playnite.FullscreenApp.exe" /f

ECHO Select the number of the option that applys to you
ECHO 1 Default installation
ECHO 2 Portable Installation
set /p Installtype=Please select your install type:
IF "%Installtype%"=="1" goto Defaultinst
IF "%Installtype%"=="2" goto Portableinst

:Defaultinst
powershell.exe -noprofile -executionpolicy bypass -file %temp%\Motion-Shell\Default-config-Script.ps1
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Motion Shell has set Playnite as the Shell, this will launch Playnite when you next sign in, when you close Playnite the default Windows Explorer will be opened.
ECHO.
ECHO.
goto complete

:Portableinst
powershell.exe -noprofile -executionpolicy bypass -file %temp%\Motion-Shell\Portable-config-Script.ps1
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Motion Shell has set Playnite as the Shell, this will launch Playnite when you next sign in, when you close Playnite the default Windows Explorer will be opened.
ECHO.
ECHO If you move your Playnite installation, please re-run this script else your system will login to a blank screen, if this does happen please use CTRL + ALT + Delete to open Task Manager.
ECHO Once in Task Manager click Run New Task and type Explorer into the box and hit enter.
ECHO.
ECHO.
goto complete

:complete
rem removing temp folder and offering for user to logout.
RMDIR /s /q %temp%\Motion-Shell
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