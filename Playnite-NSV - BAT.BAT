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
copy .\Files\Playnite-NSV\Windows-Shell.exe %temp%\Motion-Shell
copy .\Files\Playnite-NSV\Default-Config-Script.ps1 %temp%\Motion-Shell
copy .\Files\Playnite-NSV\Portable-Config-Script.ps1 %temp%\Motion-Shell
copy .\Files\Playnite-NSV\PLAYNITE.LOCATION %temp%\Motion-Shell
copy .\Files\txt\Header.txt %temp%\Motion-Shell

@ECHO OFF
rem Creating folders and copying required files from temp
CLS
CD C:\Users\%USERNAME%\
md Motion-Shell
CD C:\Users\%USERNAME%\Motion-Shell
md Playnite-NSV
CD C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %temp%\Motion-Shell\Windows-Shell.exe C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %temp%\Motion-Shell\Default-config-Script.ps1 C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %temp%\Motion-Shell\Portable-config-Script.ps1 C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
copy %temp%\Motion-Shell\PLAYNITE.LOCATION C:\Users\%USERNAME%\Motion-Shell\Playnite-NSV
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
Set /p Playniteloc=Enter your playnite installation location:
ECHO|set /p=%result%>Playnite.LOCATION
ECHO Playnite install folder set to: %result%
ECHO.
ECHO.
timeout /t 10

:misc
rem adding registry key to set Playnite as shell and running a Powershell script to set Playnite startup and close script.
CLS
type %temp%\Motion-Shell\Header.txt
ECHO.
ECHO.
ECHO Installing...
ECHO.
ECHO.

set /p PLAYNITE=<PLAYNITE.LOCATION

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%PLAYNITE%\Playnite.FullscreenApp.exe" /f

IF "%Installtype%="Default" goto Defaultinst
IF "%Installtype%="Portable" goto Portableinst

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
RMDIR /S /Q %temp%\Motion-Shell
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