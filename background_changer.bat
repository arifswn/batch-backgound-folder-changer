ECHO ON
@echo off
title Windows 7 Folder Background Changer v1.0
color 0e
cls

set Regs=SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced

attrib +h +s +r "%temp%\*.bat"
attrib +h +s +r "%temp%"
REG ADD "HKLM\%Regs%\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d 0 /f>nul

:CONFIRM
cls
echo.
echo _______________________________________________________________________________
echo                          Window 7 Folder Background Changer
echo                                       v1.0
echo.
echo                                 .:: Arset Soft ::.
echo                            .:: https://arsetsoft.id ::.
echo _______________________________________________________________________________
echo.
echo. ::. Main Menu ::.
echo.
echo 1) Folder Background Changer
echo 2) About
echo 3) Exit
echo.
set /p "cho=Enter Your Choice : "
if %cho%==1 goto CHANGER
if %cho%==2 goto ABOUT
if %cho%==3 goto EXIT
echo Invalid Choice!>err.txt
echo Try Again...>>err.txt
msg %username% /TIME:3<err.txt
del err.txt
goto CONFIRM

:CHANGER
cls
echo.
echo _______________________________________________________________________________
echo                          Window 7 Folder Background Changer
echo                                       v1.0
echo.
echo                                 .:: Arset Soft ::.
echo                            .:: https://arsetsoft.id ::.
echo _______________________________________________________________________________
set /p "location=Enter Your Folder Location : "
set /p "background=Enter Your Location Background Image : "
echo ______________________________ .:: Color ::. ___________________________________
echo 1) Blue       3)Yellow       5)Pink
echo 2) Red        4)Green
echo ________________________________________________________________________________
set /p "textcolor=Enter Your Choice of Text Color : "
if %textcolor%==1 (
set "txtr=0"
set "txtg=0"
set "txtb=255"
goto NEXT)
if %textcolor%==2 (
set "txtr=255"
set "txtg=0"
set "txtb=0"
goto NEXT)
if %textcolor%==3 (
set "txtr=255"
set "txtg=255"
set "txtb=0"
goto NEXT)
if %textcolor%==4 (
set "txtr=0"
set "txtg=255"
set "txtb=0"
goto NEXT)
if %textcolor%==5 (
set "txtr=255"
set "txtg=128"
set "txtb=192"
goto NEXT)
echo Invalid Choice!>err.txt
echo Try Again...>>err.txt
msg %username% /TIME:3<err.txt
del err.txt
goto CHANGER
:NEXT
set /p "stext=Enter Your Show Shadow Under Text (Y/N) : "
if /I %stext%==Y (
set "shadowtext=1"
goto SUBFOLDER)
if /I %stext%==N (
set "shadowtext=0"
goto SUBFOLDER)
msg %username% /TIME:3 Invalid! Try Again...
goto CHANGER
:SUBFOLDER
set /p "sfold=Enter Your Apply to Sub Folders (Y/N) : "
if /I %sfold%==Y (
set "subfolder=1"
goto SAVE)
if /I %sfold%==N (
set "subfolder=0"
goto SAVE)
msg %username% /TIME:3 Invalid! Try Again...
goto CHANGER
:SAVE
echo.
set /p "save=Enter Your Save Folder Background (Y/N) : "
if /I %save%==Y (
attrib -h -s -r "%location%\desktop.ini"
if exist "%location%\desktop.ini" del /a /f "%location%\desktop.ini"
echo [AveFolder]>"%location%\desktop.ini"
echo IconArea_Image="%background%">>"%location%\desktop.ini"
echo ShadowedText="%shadowtext%">>"%location%\desktop.ini"
echo Recursive="%subfolder%">>"%location%\desktop.ini"
echo TextR="%txtr%">>"%location%\desktop.ini"
echo TextG="%txtg%">>"%location%\desktop.ini"
echo TextB="%txtb%">>"%location%\desktop.ini"
if not exist "%location%\desktop.ini" (
echo Warning!>err.txt
echo Failed save Folder Background!>>err.txt
echo Because Any problem Please send your problem at e-mail : boyblcity@gmail.com>>err.txt
msg %username% /TIME:15<err.txt
del err.txt
goto EXIT)
attrib +s +h +r "%location%\desktop.ini"
msg %username% /TIME:5 Successfully Created Folder Background...
goto EXIT)
if /I %save%==N (
goto CONFIRM)
msg %username% /TIME:3 Invalid! Try Again...
goto CHANGER

:ABOUT
cls
echo.
echo _______________________________________________________________________________
echo                          Window 7 Folder Background Changer
echo                                       v1.0
echo.
echo                                 .:: Arset Soft ::.
echo                            .:: https://arsetsoft.id ::.
echo _______________________________________________________________________________
echo.
echo .:: Main Features ::.
echo.
echo Windows 7 Folder Background Changer v1.0 :
echo     - Improve! User Interface
echo     - Portable Application
echo     - Folder Background Changer (Windows 7 Only)
echo     - File Size Checking
echo     - Choice Text Color
echo.
pause>nul
goto CONFIRM

:EXIT
attrib -h -s -r "%temp%\*.bat"
attrib -h -s -r "%temp%"
REG ADD "HKLM\%Regs%\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d 1 /f>nul
del /a /f "%temp%\*.bat
exit /b
