@echo off&cls
setlocal enabledelayedexpansion
:menu
cls
echo.
echo -----------------
echo --  Transfert  --
echo -----------------
echo.
echo 1 Copy
echo 2 Paste
echo 3 Contact me
echo 4 Quitter
echo 5 Readme
echo.
set /p reponse="Quels est votre choix ? "

If /i "%reponse%"=="1" goto :copy
If /i "%reponse%"=="2" goto :validation_paste
If /i "%reponse%"=="3" goto :contact
If /i "%reponse%"=="4" goto :exit
If /i "%reponse%"=="5" goto :readme
If /i "%reponse%"=="9" goto :test



:copy
::windows
cls
echo.
echo ----------------------
echo --  Transfert Copy  --
echo ----------------------
echo.
set transfert=transfert\%username%
mkdir %transfert%
mkdir %transfert%\Desktop
mkdir %transfert%\Documents
mkdir %transfert%\Downloads
mkdir %transfert%\Images
mkdir %transfert%\Pictures
mkdir %transfert%\Music
mkdir %transfert%\Videos
mkdir %transfert%\Firefox
mkdir %transfert%\Chrome
mkdir %transfert%\Onedrive
::copy
robocopy %userprofile%\Desktop\ %transfert%\Desktop\ /e > nul
echo desktop ok
pause
xcopy "%userprofile%\Documents\*" "%transfert%\Documents" /C /h /e /i /q /y
echo documents ok
xcopy "%userprofile%\Downloads\*" "%transfert%\Downloads" /C /h /e /i /q /y
echo downloads ok
xcopy "%userprofile%\Images\*" "%transfert%\Images" /C /h /e /i /q /y
echo images ok
xcopy "%userprofile%\Pictures\*" "%transfert%\Pictures" /C /h /e /i /q /y
echo pictures ok
xcopy "%userprofile%\Music\*" "%transfert%\Music" /C /h /e /i /q /y
echo music ok
xcopy "%userprofile%\Videos\*" "%transfert%\Videos" /C /h /e /i /q /y
echo video ok
xcopy "%userprofile%\Onedrive\*" "%transfert%\OneDrive" /C /h /e /i /q /y
echo onedrive ok
xcopy "%userprofile%\appdata\local\Google\Chrome\User Data\Default\*" "%transfert%\Chrome\" /C /h /e /i /q /y
echo chrome ok
cls
echo.
echo ----------------------
echo --  Transfert Copy  --
echo ----------------------
echo.
if exist temp del temp
setlocal enabledelayedexpansion
set $count=1
for /D %%a in (%appdata%\Mozilla\Firefox\Profiles\*) do (echo %%a >>temp
                                                        echo !$count! - %%a
                                                        set /a $count+=1)
set /p $choix=Entrez la valeur correspondante au fichier que vous voulez lancer : 
set $count=1
for /f "delims=" %%a in (temp) do (if !$count!==%$choix% (set %$fichier%=%%a
                                                        xcopy %%a "%transfert%\Firefox" /C /h /e /i /q /y
                                                        ) 
                                    set /a $count+=1)
echo firefox ok
goto :menu

:validation_paste
cls
echo.
echo -----------------------
echo --  Transfert Paste  --
echo -----------------------
echo.
set /p  AREYOUSURE=Etes-vous sure ? (Y/N)?
if /i "%AREYOUSURE%"=="Y" goto :paste
if /i "%AREYOUSURE%"=="N" ( goto :main 
) else ( goto :menu )

:paste
cls
echo.
echo -----------------------
echo --  Transfert Paste  --
echo -----------------------
echo.
::paste
robocopy transfert\%username%\desktop\ %userprofile%\Desktop\ /e > nul
echo.
echo desktop ok
xcopy "transfert\%username%\documents\*" "%userprofile%\Documents\*" /c /h /e /i /y
echo documents ok
xcopy "transfert\%username%\downloads\*" "%userprofile%\Downloads\*" /c /h /e /i /y
echo downloads ok
xcopy "transfert\%username%\images\*" "%userprofile%\Images\*" /c /h /e /i /y
echo images ok
xcopy "transfert\%username%\pictures\*" "%userprofile%\Pictures\*" /c /h /e /i /y
echo pictures ok
xcopy "transfert\%username%\music\*" "%userprofile%\Music\*" /c /h /e /i /y
echo music ok
xcopy "transfert\%username%\videos\*" "%userprofile%\Videos\*" /q /C /e /i /h /y
echo video ok
xcopy "%transfert%\OneDrive" "%userprofile%\Onedrive\*" /C /h /e /i /q /y
echo onedrive ok
xcopy "transfert\%username%\chrome\*" "%userprofile%\appdata\local\Google\Chrome\User Data\Default\" /C /h /e /i /q /y
echo chrome ok
cls
echo.
echo -----------------------
echo --  Transfert Paste  --
echo -----------------------
echo.
if exist temp del temp
setlocal enabledelayedexpansion
set $count=1
for /D %%a in (%appdata%\Mozilla\Firefox\Profiles\*) do (echo %%a >>temp
                                                        echo !$count! - %%a
                                                        set /a $count+=1)
set /p $choix=Entrez la valeur correspondante au fichier que vous voulez lancer : 
set $count=1
for /f "delims=" %%a in (temp) do (if !$count!==%$choix% (set %$fichier%=%%a
                                                        xcopy "transfert\%username%\firefox\*" %%a /C /h /e /i /q /y
                                                        goto :menu
                                                        ) 
                                    set /a $count+=1)
echo firefox ok
goto :menu

:readme
cls
echo.
echo --------------
echo --  Readme  --
echo --------------
echo.
echo Avant d'effectuer une copier coller, le fichier 'sauvegarde_script' ne dois pas se trouver dans les endroits suivants :
echo.
echo Bureau
echo Document
echo OneDrive
echo Download
echo Images ou Pictures
echo Musique
echo Video
echo.
echo Votre fichier 'sauvegarde_script' doit être stocker sur une cle USB.
pause
goto :menu

:test
cls
echo.
echo ----------------------
echo --  Transfert Test  --
echo ----------------------
echo.
echo test
echo test ok
pause
goto :menu

:contact
cls
echo.
echo -------------------------
echo         By ZeFix        
echo pro.simaojulien@gmail.com
echo  Mon site : zefix-dev.fr
echo -------------------------
pause
goto :menu
:exit
exit