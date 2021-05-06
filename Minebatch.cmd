@echo off
set version=0.0.0.7.0
title Minebatch ^| %version% ^|

color 9f
set load=0
set/a loadnum=0
set/a ready=0
set/a finish=100
set progress_text=Gathering data
call:loading
call:internet
call:loading
if not exist %appdata%\.minecraft\minebatch call:install
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
call:loading
if exist debug.log del debug.log
call:loading
mode con:cols=130 lines=50
call:loading
call:url
(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
color %color%
call:loading
IF "%1"=="" SET TAG=Normal
IF /I "%1"=="-update" goto force
IF /I "%1"=="-unins" goto uninstall
IF /I "%1"=="-discord" goto discord
IF /I "%1"=="-mail" goto e-mail
IF /I "%1"=="-opt" goto options
IF /I "%1"=="-folder" goto mc_folder
IF /I "%1"=="-clean" goto clean
IF /I "%1"=="-minebatch_uninstall" goto minebatch_unins
IF /I "%1"=="-news" call:news_down
IF /I "%1"=="-change" call:launch_changelog
call:verion_updater
set progress_text=Loading
title Minebatch ^| %version% ^| %mode% ^|
call:daily_news
set/a ready=1
set progress_text=Finishing
call:loading

:menu
cls
echo Menu
echo.
echo 1) Games ^& apps
echo 2) Programs
echo 3) Minebatch
echo 4) Options
echo 5) Contact ^& credits
echo 6) Utilities
echo 7) Exit
echo.
echo.
echo.
choice /c 1234567 /n /m "Select: "
if %errorlevel%==1 (goto games)
if %errorlevel%==2 (goto pro)
if %errorlevel%==3 (goto mbatch)
if %errorlevel%==4 (goto options)
if %errorlevel%==5 (goto info)
if %errorlevel%==6 (goto ut)
if %errorlevel%==7 (exit)

:info
cls
echo Contact ^& credits
echo.
echo 1) Discord
echo 2) E-mail
echo 3) Credits
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto discord1)
if %errorlevel%==2 (goto e-mail1)
if %errorlevel%==3 (goto credits)
if %errorlevel%==4 (goto menu)

:e-mail1
echo|set /p=kotsasmin@gmail.com|clip
cls
echo E-mail
echo.
echo My e-mail is now on clipboard but here it is if you can't find it: kotsasmin@gmail.com
echo.
echo.
echo.
pause
goto info

:discord1
cls
echo Discord
echo.
echo You can DM me on Discord, or you can just join mine Discord server.
echo.
echo 1) DM me
echo 2) Join my server
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto discord_dm1)
if %errorlevel%==2 (goto discord_server1)
if %errorlevel%==3 (goto info)

:discord_dm1
echo|set /p=Kotsasmin#9454|clip
cls
echo Discord DM
echo.
echo Tag copied to clipboard, but here it is if you can't find it: Kotsasmin#9454
echo.
echo.
echo.
pause
goto discord1

:discord_server1
echo|set /p=https://discord.gg/KHvjMcKkEX|clip
start https://discord.gg/KHvjMcKkEX
cls
echo Invite link copied to clipboard, but here it is if you can't find it: https://discord.gg/KHvjMcKkEX
echo.
echo.
echo.
pause
goto discord1

:e-mail
echo|set /p=kotsasmin@gmail.com|clip
cls
echo E-mail
echo.
echo My e-mail is now on clipboard but here it is if you can't find it: kotsasmin@gmail.com
echo.
echo.
echo.
pause
goto bug


:ut
cls
echo Utilities
echo.
echo 1) System clean up
echo 2) Youtube video-audio downloader
echo 3) Minecraft folder options
echo 4) Back
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto clean)
if %errorlevel%==2 (goto youtube)
if %errorlevel%==3 (goto mc_folder)
if %errorlevel%==4 (goto menu)

:youtube
cls
echo This utility isn't ready yet...
echo.
echo.
echo.
pause
goto ut


:how1
cls
echo How to... (1/2)
echo.
echo 1) Play Minecraft for free?
echo 2) Play Minecraft Pocket Edition for free?
echo 3) Play Minecraft Dungeons for free?
echo 4) Play Minecraft Story Mode?
echo 5) Update Minebatch?
echo 6) Install opengl
echo 7) Fix Minecraft Story Mode's error?
echo 8) (2/2)
echo 9) Back
echo.
echo.
echo.
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (goto mcfree)
if %errorlevel%==2 (goto mcpefree)
if %errorlevel%==3 (goto mcdfree)
if %errorlevel%==4 (goto mcsmh)
if %errorlevel%==5 (goto mupdate_help)
if %errorlevel%==6 (goto open_help)
if %errorlevel%==7 (goto mcsm_error)
if %errorlevel%==8 (goto how2)
if %errorlevel%==9 (goto menu)

:how2
cls
echo How to... (2/2)
echo.
echo 1) Install DirectX?
echo 2) Make a Minecraft server for free?
echo 3) Disable auto updates/daily news?
echo 4) Play Minecraft Earth?
echo 5) Install curl.exe to my computer?
echo 6) (1/2)
echo 7) Back
echo.
echo.
echo.
choice /c 1234567 /n /m "Select: "
if %errorlevel%==1 (goto dir_help)
if %errorlevel%==2 (goto mcs)
if %errorlevel%==3 (goto news_help)
if %errorlevel%==4 (goto mce_help)
if %errorlevel%==5 (goto curl_help)
if %errorlevel%==6 (goto how1)
if %errorlevel%==7 (goto menu)

:mcfree
cls
echo How to play Minecraft for free?
echo.
echo The easiest way to play Minecraft Java Edition for now it from
echo TLauncher. Download it, install, launch it and play!
echo.
echo.
echo.
pause
goto how1

:mcpefree
cls
echo How to play Minecraft Pocket Edition for free?
echo.
echo After downloading Minecraft Pocket Edition on your Desktop, copy it to your phone, open the file
echo from your phone, install it and you are ready!
echo.
echo.
echo.
pause
goto how1


:mcdfree
cls
echo How to play Minecraft Dungeons for free?
echo.
echo Download the torrent file, open it with uTorrent and download the installer. After that
echo do the installation. Finally, open the file: minecraft_server.exe and enjoy!
echo.
echo.
echo.
pause
goto how1

:mcsmh
cls
echo How to play Minecraft Story Mode?
echo.
echo Download the torrent file, open it with uTorrent and download the installer. After that
echo unzip all the files from the downloaded zip file. Open the file Minecraft Story Mode.exe
echo for Minecraft Story Mode Season 1 or the file Minecraft2.exe for Minecraft Story Mode Season
echo 2. Have fun!
echo.
echo.
echo.
pause
goto how1

:mbatch
cls
echo Minebatch
echo.
echo 1) Update
echo 2) Bug or broken link
echo 3) Recreate Desktop shortcuts
echo 4) About
echo 5) Back
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (goto update)
if %errorlevel%==2 (goto bug)
if %errorlevel%==3 (goto recreate)
if %errorlevel%==4 (goto about)
if %errorlevel%==5 (goto menu)

:recreate
cls
echo Recreating Desktop shortcuts...
echo.
echo.
echo.
set /a scr=1
goto scr_start
exit


:about
cls
echo About Minebatch
echo.
echo Minebatch is a batch coded program made by Kotsasmin. Ιt is compatible with all windows 10
echo computers with the curl file already installed. Its main purpose is to download/install/launch
echo Minecraft Games such as: Minecraft Dungeons or Minecraft Story Mode even Minecraft itself!
echo.
echo It is updateable as long as there is internet connection. It can run offline but it won't have
echo the ability to download files or games. It is user-friendly or at least I am trying to make it.
echo.
echo It all started when I made, for personal use, a small batch file to download and install Minecraft.
echo Then, I took the idea of making a batch file that it could download/install/launch Minecraft and some
echo other games.
echo.
echo Now, you can use Minebatch to download/install/launch a lot of games and as the time passes, more games
echo will be added! I am trying to make updates as soon as I can to give you the best experience!
echo.
echo.
echo.
pause
goto mbatch


:pro
cls
echo Programs
echo.
echo 1) Java
echo 2) DirectX
echo 3) uTorrent
echo 4) opengl
echo 5) Minecraft server soft
echo 6) Install extra programs for Minecraft Story Mode (both seasons)
echo 7) Back
choice /c 1234567 /n /m "Select: "
if %errorlevel%==1 (goto java)
if %errorlevel%==2 (goto dirx)
if %errorlevel%==3 (goto torrent)
if %errorlevel%==4 (goto open)
if %errorlevel%==5 (goto mcss)
if %errorlevel%==6 (goto extra)
if %errorlevel%==7 (goto menu)


:games
cls
echo Games ^& apps
echo.
echo 1) Minecraft Java Edition
echo 2) Minecraft Dungeons
echo 3) Minecraft Pocket Edition
echo 4) Minecraft Story Mode
echo 5) Back
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (goto mcje)
if %errorlevel%==2 (goto dun)
if %errorlevel%==3 (goto mcpe)
if %errorlevel%==4 (goto mcsmm)
if %errorlevel%==5 (goto menu)


:mcje
cls
echo Minecraft Java Edition
echo.
echo 1) Minecraft Launcher
echo 2) TLauncher
echo 3) copyitright Launcher
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto mc)
if %errorlevel%==2 (goto tl)
if %errorlevel%==3 (goto copy)
if %errorlevel%==4 (goto games)

:copy
cls
echo copyitright Launcher
echo.
echo 1) Download from the official website
echo 2) Download from the mirror link
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto copy_official)
if %errorlevel%==2 (goto copy_mirror)
if %errorlevel%==3 (goto mcje)


:copy_official
cls
echo Openning website...
echo.
echo.
echo.
start https://www.playfreeminecraft.nl/downloads.htm
goto copy

:copy_mirror
cls
echo Downloading copyitright Launcher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://github.com/Kotsasmin/Minebatch/blob/main/Minecraft%20Installer%20(copyitright).exe?raw=true" -o "%appdata%\.minecraft\minebatch\copyitright.exe"
start %appdata%\.minecraft\minebatch\copyitright.exe
goto copy



:options
cls
echo Options
echo.
echo 1) Uninstall .minecraft
echo 2) Uninstall Minebatch
echo 3) Factory reset
echo 4) Toggle automatic updates on startup
echo 5) Toggle daily news on startup
echo 6) Change color
echo 7) Back
echo.
echo.
echo.
choice /c 1234567 /n /m "Select: "
if %errorlevel%==1 (goto uninstall)
if %errorlevel%==2 (goto minebatch_unins)
if %errorlevel%==3 (goto reset)
if %errorlevel%==4 (goto change_auto_updates)
if %errorlevel%==5 (goto change_news)
if %errorlevel%==6 (goto change_color)
if %errorlevel%==7 (goto menu)

:minebatch_unins
cls
echo Warning! This will uninstall Minebatch from your computer. Your games
echo won't be deleted...
echo.
echo.
echo.
echo 1) Do the uninstallation
echo 2) Back
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto uninstall_minebatch)
if %errorlevel%==2 (goto options)

:uninstall_minebatch
cls
echo Deleting files...
echo.
echo.
echo.
(
echo @echo off
echo title Minebatch uninstaller
echo @RD /S /Q %appdata%\.minecraft\minebatch
echo if exist %USERPROFILE%\Desktop\Minebatch @RD /S /Q %USERPROFILE%\Desktop\Minebatch
echo exit
)>%appdata%\minebatch_uninstaller.cmd
timeout 1 /nobreak >nul
start %appdata%\minebatch_uninstaller.cmd
exit


:mc_folder
cls
echo Minecraft folder options
echo.
echo 1) Delete .minecraft
echo 2) Minecraft folders launcher
echo 3) Back
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto uninstall)
if %errorlevel%==2 (goto folders)
if %errorlevel%==3 (goto ut)


:folders
cls
echo Minecraft folders launcher
echo.
echo 1) Appdata folder
echo 2) .minecraft folder
echo 3) Saves folder
echo 4) Resourcepacks folder
echo 5) Mods folder
echo 6) Versions folder
echo 7) Logs folder
echo 8) Back

choice /c 12345678 /n /m "Select: "
if %errorlevel%==1 (goto appdata_launch)
if %errorlevel%==2 (goto .minecraft_launch)
if %errorlevel%==3 (goto saves_launch)
if %errorlevel%==4 (goto re_launch)
if %errorlevel%==5 (goto mod_launch)
if %errorlevel%==6 (goto ver_launch)
if %errorlevel%==7 (goto log_launch)
if %errorlevel%==8 (goto mc_folder)

:appdata_launch
start %appdata%
goto folders

:.minecraft_launch
start %appdata%\.minecraft
goto folders

:saves_launch
if not exist %appdata%\.minecraft\saves mkdir %appdata%\.minecraft\saves
start %appdata%\.minecraft\saves
goto folders

:re_launch
if not exist %appdata%\.minecraft\resourcepacks mkdir %appdata%\.minecraft\resourcepacks
start %appdata%\.minecraft\resourcepacks
goto folders


:mod_launch
if not exist %appdata%\.minecraft\mods mkdir %appdata%\.minecraft\mods
start %appdata%\.minecraft\mods
goto folders

:ver_launch
if not exist %appdata%\.minecraft\versions mkdir %appdata%\.minecraft\versions
start %appdata%\.minecraft\versions
goto folders

:ver_log
if not exist %appdata%\.minecraft\logs mkdir %appdata%\.minecraft\logs
start %appdata%\.minecraft\logs
goto folders


:change_color
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
cls


ECHO Now you can change the color
echo.
ECHO Simply choose a color combination from the list below, the first of the 
echo combination will be used for backround and the second color will be used
echo for characters. For example if you type: D2, the backround will change to
echo light purple and characters will change into blue.
echo.
ECHO    0 = Black       8 = Gray
ECHO    1 = Blue        9 = Light Blue
ECHO    2 = Green       A = Light Green
ECHO    3 = Aqua        B = Light Aqua
ECHO    4 = Red         C = Light Red
ECHO    5 = Purple      D = Light Purple
ECHO    6 = Yellow      E = Light Yellow
ECHO    7 = White       F = Bright White
echo.
echo.
echo.
set /p user_color="Select a combination: "

(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
(
echo %update_start%
echo %news_start%
echo %user_color%
)>%appdata%\.minecraft\minebatch\select.txt
color %user_color%
goto options


:reset
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
(
echo 1
echo 1
echo 9f
)>%appdata%\.minecraft\minebatch\select.txt
goto options

:change_news
cls
echo Toggle daily news on startup
echo.
echo 1) On
echo 2) Off
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto on_news)
if %errorlevel%==2 (goto off_news)
if %errorlevel%==3 (goto options)

:on_news
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
(
echo %update_start%
echo 1
echo %color%
)>%appdata%\.minecraft\minebatch\select.txt
goto options

:off_news
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
(
echo %update_start%
echo 0
echo %color%
)>%appdata%\.minecraft\minebatch\select.txt
goto options

:change_auto_updates
cls
echo Toggle automatic updates on startup
echo.
echo 1) On
echo 2) Off
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto on_update)
if %errorlevel%==2 (goto off_update)
if %errorlevel%==3 (goto options)

:on_update
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
(
echo 1
echo %news_start%
echo %color%
)>%appdata%\.minecraft\minebatch\select.txt
goto options

:off_update
if not exist %appdata%\.minecraft\minebatch\select.txt call:options_make
(
set /p update_start=
set /p news_start=
set /p color=
)<%appdata%\.minecraft\minebatch\select.txt
(
echo 0
echo %news_start%
echo %color%
)>%appdata%\.minecraft\minebatch\select.txt
goto options



:uninstall
cls
echo Warning! This will delete all of your data! Your games, files, settings will be
echo deleted! Minecraft, TLauncher and all of the files in "%appdata%\.minecraft" will be deleted!
echo Except from Minebatch data and settings.
echo.
echo 1) Do the uninstallation
echo 2) Back
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto uninstall_start)
if %errorlevel%==2 (goto options)

:uninstall_start
cls
echo Deleting files...
echo.
echo.
echo.
(
echo @echo off
echo title Minebatch uninstaller
echo @RD /S /Q %appdata%\.minecraft
echo if exist %USERPROFILE%\Desktop\Minebatch @RD /S /Q %USERPROFILE%\Desktop\Minebatch
echo exit
)>%appdata%\minebatch_unins.cmd
timeout 1 /nobreak >nul
start %appdata%\minebatch_unins.cmd
exit


:extra
if %internet%==0 goto:EOF
cls
echo Downloading extras...
echo.
echo.
echo.
curl -o %appdata%\.minecraft\minebatch\vc_redist.x64.exe "https://github.com/Kotsasmin/Minebatch/blob/main/vc_redist.x64.exe?raw=true" -L -s
curl -o %appdata%\.minecraft\minebatch\vc_redist.x86.exe "https://github.com/Kotsasmin/Minebatch/blob/main/vc_redist.x86.exe?raw=true" -L -s
curl -o %appdata%\.minecraft\minebatch\directX_mcsm.exe "https://github.com/Kotsasmin/Minebatch/blob/main/DirectX%20Web%20setup.exe?raw=true" -L -s
curl -o %appdata%\.minecraft\minebatch\directXweb.exe "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -L -s
cls
echo Installing extras...
echo.
echo.
echo.
cmd /C start /wait %appdata%\.minecraft\minebatch\vc_redist.x64.exe
cls
echo Installing extras...
echo.
echo.
echo.
cmd /C start /wait %appdata%\.minecraft\minebatch\vc_redist.x86.exe
cls
echo Installing extras...
echo.
echo.
echo.
cmd /C start /wait %appdata%\.minecraft\minebatch\directX_mcsm.exe
cls
echo Installing extras...
echo.
echo.
echo.
cmd /C start /wait %appdata%\.minecraft\minebatch\directXweb.exe
cls
echo Installation complete!
echo.
echo.
echo.
pause
goto pro




:message
cls
if %internet%==0 goto:EOF
echo Downloading News...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\message.txt del %appdata%\.minecraft\minebatch\message.txt
timeout 2 /nobreak >nul
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/message.txt" -o "%appdata%\.minecraft\minebatch\message.txt"
cls
echo ------------------ Minebatch news ------------------------
echo.
type %appdata%\.minecraft\minebatch\message.txt
echo.
echo ----------------------------------------------------------
echo.
echo.
echo.
pause>nul
goto menu


:mc
cls
echo Minecraft Launcher
echo.
echo 1) Smart launch
echo 2) Launch
echo 3) Download
echo 4) Manual Download
echo 5) Back
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (goto mc_smart)
if %errorlevel%==2 (goto mc_launch)
if %errorlevel%==3 (goto mc_download)
if %errorlevel%==4 (goto mc_mdownload)
if %errorlevel%==5 (goto mcje)


:mc_help
cls
echo Minecraft Launcher help
echo.
echo The Minecraft launcher is the login and downloader front-end 
echo to the Minecraft client. It is responsible for downloading the main Java 
echo packages such as minecraft.jar, which holds the code and resources, and LWJGL. 
echo It is possible to use the launcher to run versions of Minecraft from nearly any era, 
echo however versions such as Indev, Minecraft 2.0, and any of the Beta 1.9 pre-releases 
echo are not available. The current launcher is the seventh launcher for Minecraft, and the 
echo third that was built to automatically update itself. It is written in C++[1] and is 
echo developed by Nathan Adams and Petr Mrazek.
echo.
echo Minecraft Launcher is the best way to play Minecraft legally, but only having a premium
echo Minecraft account! To play Minecraft for free, without having a premium Minecraft account,
echo You can use TLauncher instead.
echo.
echo.
echo.
pause
goto mc


:mc_smart
if exist %appdata%\.minecraft\Minecraft.exe start %appdata%\.minecraft\Minecraft.exe & goto mc
cls
echo Downloading Minecraft Launcher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://launcher.mojang.com/download/Minecraft.exe" -o "%appdata%\.minecraft\Minecraft.exe"
start %appdata%\.minecraft\Minecraft.exe & goto mc


:mc_download
cls
if exist %appdata%\.minecraft\Minecraft.exe goto mc
echo Downloading Minecraft Launcher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://launcher.mojang.com/download/Minecraft.exe" -o "%appdata%\.minecraft\Minecraft.exe"
goto mc

:mc_mdownload
cls
echo Opening website... After downloading it, please put it in that folder: %appdata%\.minecraft
echo.
echo.
echo.
start https://launcher.mojang.com/download/Minecraft.exe
start %appdata%\.minecraft
pause
goto mc

:mc_launch
cls
if exist %appdata%\.minecraft\Minecraft.exe start %appdata%\.minecraft\Minecraft.exe & goto mc
echo You have to install Minecraft first! Automatically or manually.
echo.
echo.
echo.
pause
goto mc


:dun
cls
echo Minecraft Dungeons
echo.
echo 1) Download and open torrent
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto dun_download)
if %errorlevel%==2 (goto dun_mdownload)
if %errorlevel%==3 (goto games)

:dun_help
cls
echo Minecraft Dungeons Help
echo.
echo To download Minecraft Dungeons you will need to download the torrent given
echo from the Minecraft Dungeons Menu. After that, you have to download the installer file
echo using uTorrent. Save it to your computer and open it. Finally do the installation
echo and your done!
echo.
echo.
echo.
pause
goto dun

:news_down
set progress_text=Downloading daily news
call:loading
if %internet%==0 goto:EOF
if %news_start%==0 goto:EOF
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\message.txt del %appdata%\.minecraft\minebatch\message.txt
call:loading
timeout 2 /nobreak >nul
call:loading
curl -o %appdata%\.minecraft\minebatch\message.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/message.txt" -L -s
cls
echo ------------------ Minebatch news ------------------------
echo.
type %appdata%\.minecraft\minebatch\message.txt
echo.
echo ----------------------------------------------------------
echo.
echo.
echo.
pause
goto:EOF

:dun_download
cls
if exist %appdata%\.minecraft\minebatch\dun.torrent start %appdata%\.minecraft\minebatch\dun.torrent & goto dun
echo Downloading Minecraft Dungeons...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/10524" -o "%appdata%\.minecraft\minebatch\dun.torrent"
start %appdata%\.minecraft\minebatch\dun.torrent & goto dun

:dun_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://tlauncher.org/download/10524 & goto menu


:mcsm
cls
echo Minecraft Story Mode Season 1
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcsm_download)
if %errorlevel%==2 (goto mcsm_manual_download)
if %errorlevel%==3 (goto menu)


:mcsm_download
cls
if exist %appdata%\.minecraft\minebatch\mcsm.torrent start %appdata%\.minecraft\minebatch\mcsm.torrent & goto menu
echo Downloading Minecraft Story Mode Season 1...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/3494" -o "%appdata%\.minecraft\minebatch\mcsm.torrent"
start %appdata%\.minecraft\minebatch\mcsm.torrent & goto menu


:mcsm_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://tlauncher.org/download/3494 & goto menu


:mcsm2
cls
echo Minecraft Story Mode Season 2
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcsm2_download)
if %errorlevel%==2 (goto mcsm2_manual_download)
if %errorlevel%==3 (goto menu)


:mcsm2_download
cls
if exist %appdata%\.minecraft\minebatch\mcsm2.torrent start %appdata%\.minecraft\minebatch\mcsm2.torrent & goto menu
echo Downloading Minecraft Story Mode Season 2...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/download/4585" -o "%appdata%\.minecraft\minebatch\mcsm2.torrent"
start %appdata%\.minecraft\minebatch\mcsm2.torrent & goto menu


:mcsm2_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://tlauncher.org/download/4585 & goto menu


:mcpe
cls
echo Minecraft Pocket Edition
echo.
echo Minecraft Pocket Edition has two versions: Mod 1 and Mod 2.
echo.
echo.
echo 1) Mod 1 includes: Unlocked premium skins - Unlocked premium textures
echo 2) Mod 2 includes: Unlocked premium skins - Unlocked premium textures 
echo 	No damage mod - Unlimited breath - Max Inventory Size - ONE hit kill with weapons 
echo 	Max score - Indestructible Tools
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe1)
if %errorlevel%==2 (goto mcpe2)
if %errorlevel%==3 (goto menu)


:mcpe1
cls
echo Minecraft Pocket Edition (Mod 1)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe1_download)
if %errorlevel%==2 (goto mcpe1_manual_download)
if %errorlevel%==3 (goto mcpe)


:mcpe2
cls
echo Minecraft Pocket Edition (Mod 2)
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcpe2_download)
if %errorlevel%==2 (goto mcpe2_manual_download)
if %errorlevel%==3 (goto mcpe)



:mcpe1_download
cls
echo Downloading Minecraft Pocket Edition (MOD 1)... After the downloading, please copy the
echo file: mcpe1.apk from your Desktop to your phone. Then open the file from your phone
echo and do the installation!
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod1-www.ReXdl.com.apk" -o "%USERPROFILE%\Desktop\mcpe1.apk"
start %USERPROFILE%\Desktop
pause
goto menu


:mcpe1_manual_download
cls
echo Opening website... When the download is finished, copy the file to your phone
echo and do the installation from your phone!
echo.
echo.
echo.
start http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod1-www.ReXdl.com.apk
pause>nul
goto menu

:mcpe2_download
cls
echo Downloading Minecraft Pocket Edition (MOD 2)... After the downloading, please copy the
echo file: mcpe1.apk from your Desktop to your phone. Then open the file from your phone
echo and do the installation!
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod2-www.ReXdl.com.apk" -o "%USERPROFILE%\Desktop\mcpe2.apk"
start %USERPROFILE%\Desktop
pause
goto menu


:mcpe2_manual_download
cls
echo Opening website... When the download is finished, copy the file to your phone
echo and do the installation from your phone!
echo.
echo.
echo.
start http://s3.rexdl.com/android/game/Minecraft-v1.12.1.1-Mod2-www.ReXdl.com.apk
pause>nul
goto menu!

:tl
cls
echo TLauncher
echo.
echo 1) Smart launch
echo 2) Launch
echo 3) Download
echo 4) Manual Download
echo 5) Back
echo.
echo.
echo.
choice /c 123456 /n /m "Select: "
if %errorlevel%==1 (goto tl_smart)
if %errorlevel%==2 (goto tl_launch)
if %errorlevel%==3 (goto tl_download)
if %errorlevel%==4 (goto tl_mdownload)
if %errorlevel%==5 (goto mcje)


:tl_smart
cls
if exist %appdata%\.minecraft\TLauncher.exe start %appdata%\.minecraft\TLauncher.exe & goto tl
echo Downloading TLauncher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/exe" -o "%appdata%\.minecraft\TLauncher.exe"
start %appdata%\.minecraft\TLauncher.exe & goto tl


:tl_download
cls
if exist %appdata%\.minecraft\TLauncher.exe goto tl
echo Downloading TLauncher...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://tlauncher.org/exe" -o "%appdata%\.minecraft\TLauncher.exe"
goto tl


:tl_mdownload
cls
echo Opening website... After downloading it, please put it in that folder: %appdata%\.minecraft
echo.
echo.
echo.
start https://tlauncher.org/exe
start %appdata%\.minecraft
pause
goto tl


:tl_launch
cls
if exist %appdata%\.minecraft\TLauncher.exe start %appdata%\.minecraft\TLauncher.exe & goto tl
echo You have to install TLauncher first! Automatically or manually.
echo.
echo.
echo.
pause
goto tl


:mcss
cls
echo Minecraft server soft
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto mcss_download)
if %errorlevel%==2 (goto mcss_manual_download)
if %errorlevel%==3 (goto menu)



:mcss_download
cls
echo Downloading Minecraft server soft...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://www.mcserversoft.com/downloadlatest" -o "%appdata%\.minecraft\minebatch\mcss.zip"
start %appdata%\.minecraft\minebatch\mcss.zip
goto menu


:mcss_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://www.mcserversoft.com/downloadlatest
goto menu


:java
cls
echo Java
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto java_download)
if %errorlevel%==2 (goto java_manual_download)
if %errorlevel%==3 (goto pro)


:java_download
cls
echo Downloading Java...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242959_a4634525489241b9a9e1aa73d9e118e6" -o "%appdata%\.minecraft\minebatch\java.exe"
start %appdata%\.minecraft\minebatch\java.exe
goto pro


:java_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242959_a4634525489241b9a9e1aa73d9e118e6
goto pro


:dirX
cls
echo DirectX
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto dirX_download)
if %errorlevel%==2 (goto dirX_manual_download)
if %errorlevel%==3 (goto pro)


:dirX_download
cls
echo Downloading DirectX...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -o "%appdata%\.minecraft\minebatch\dirX.exe"
start %appdata%\.minecraft\minebatch\dirX.exe & goto pro


:dirX_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe
goto pro


:torrent
cls
echo uTorrent
echo.
echo 1) Auto download
echo 2) Manual download
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto torrent_download)
if %errorlevel%==2 (goto torrent_manual_download)
if %errorlevel%==3 (goto pro)




:torrent_download
cls
echo Downloading uTorrent...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://download-hr.utorrent.com/track/stable/endpoint/utorrent/os/windows" -o "%appdata%\.minecraft\minebatch\torrent.exe"
start %appdata%\.minecraft\minebatch\torrent.exe & goto pro


:torrent_manual_download
cls
echo Opening website...
echo.
echo.
echo.
start https://download-hr.utorrent.com/track/stable/endpoint/utorrent/os/windows
goto pro


:open
cls
echo opengl
echo.
echo 1) Smart install
echo 2) 32-bit
echo 3) 64-bit
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto open_smart)
if %errorlevel%==2 (goto open32)
if %errorlevel%==3 (goto open64)
if %errorlevel%==4 (goto pro)

:open32
cls
echo opengl (32-bit)
echo.
echo 1) Smart install
echo 2) Download to Desktop
echo 3) Manual download
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto open_smart)
if %errorlevel%==2 (goto open32_download_de)
if %errorlevel%==3 (goto open32_mdownload)
if %errorlevel%==4 (goto open)

:open_smart
cls
echo Please wait...
echo.
echo.
echo.
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT goto 32bit
if %OS%==64BIT goto 64bit
goto open
:32bit
if exist %appdata%\.minecraft\runtime\jre-x32\bin\opengl32.dll goto open
if not exist %appdata%\.minecraft\runtime\jre-x32\bin mkdir %appdata%\.minecraft\runtime\jre-x32\bin
timeout 1 /nobreak >nul
curl -o %appdata%\.minecraft\runtime\jre-x32\bin\opengl32.dll "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/32.dll?raw=true" -L -s
goto open
:64bit
if exist %appdata%\.minecraft\runtime\jre-x364\bin\opengl32.dll goto open
if not exist %appdata%\.minecraft\runtime\jre-x64\bin mkdir %appdata%\.minecraft\runtime\jre-x64\bin
timeout 1 /nobreak >nul
curl -o %appdata%\.minecraft\runtime\jre-x64\bin\opengl32.dll "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/64.dll?raw=true" -L -s
goto open

:open32_download_de
cls
echo Downloading opengl (32-bit)...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/32.dll?raw=true" -o "%USERPROFILE%\Desktop\opengl32.dll"
goto open


:open32_mdownload
echo Opening website...
echo.
echo.
echo.
start https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/32.dll?raw=true
goto open

:open64
cls
echo opengl (64-bit)
echo.
echo 1) Smart install
echo 2) Download to Desktop
echo 3) Manual download
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto open_smart)
if %errorlevel%==2 (goto open64_download_de)
if %errorlevel%==3 (goto open64_mdownload)
if %errorlevel%==4 (goto open)

:open64_download_de
cls
echo Downloading opengl (64-bit)...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/64.dll?raw=true" -o "%USERPROFILE%\Desktop\opengl32.dll"
goto open


:open64_mdownload
cls
echo Opening website...
echo.
echo.
echo.
start https://github.com/Kotsasmin/Minecraft-launcher-data/blob/master/64.dll?raw=true
goto open


:launch_changelog
cls
echo Changelog
echo.
echo 1) View changelog (three versions)
echo 2) View changelog (all versions)
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto change)
if %errorlevel%==2 (goto change_full)
if %errorlevel%==3 (goto:EOF)

:change
cls
echo Downloading changelog...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\news.txt del %appdata%\.minecraft\minebatch\news.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\news.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/news.txt" -L -s
cls
echo.
echo Three versions changelog:
echo -----------------------------------------
echo.
type %appdata%\.minecraft\minebatch\news.txt
echo.
echo -----------------------------------------
echo.
echo.
echo.
pause
goto launch_changelog

:change_full
cls
echo Downloading changelog...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\changelog.txt del %appdata%\.minecraft\minebatch\changelog.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\changelog.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/changelog" -L -s
start %appdata%\.minecraft\minebatch\changelog.txt
goto launch_changelog

:update
cls
echo Update Minebatch
echo.
echo 1) Smart update
echo 2) Check for updates
echo 3) Force update
echo 4) View changelog (three versions)
echo 5) View changelog (all versions)
echo 6) Back
echo.
echo.
echo.
choice /c 123456 /n /m "Select: "
if %errorlevel%==1 (goto update_smart)
if %errorlevel%==2 (goto checkm)
if %errorlevel%==3 (goto force)
if %errorlevel%==4 (goto changelog)
if %errorlevel%==5 (goto changelog_full)
if %errorlevel%==6 (goto mbatch)

:changelog
cls
echo Downloading changelog...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\news.txt del %appdata%\.minecraft\minebatch\news.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\news.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/news.txt" -L -s
cls
echo.
echo Three versions changelog:
echo -----------------------------------------
echo.
type %appdata%\.minecraft\minebatch\news.txt
echo.
echo -----------------------------------------
echo.
echo.
echo.
pause
goto update

:changelog_full
cls
echo Downloading changelog...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\changelog.txt del %appdata%\.minecraft\minebatch\changelog.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\changelog.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/changelog" -L -s
start %appdata%\.minecraft\minebatch\changelog.txt
goto update



:checkm
cls
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
cls
echo Checking for updates...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
timeout 3 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\minebatch\version.txt
if %version%==%new_version% goto version_not_found
if exist %appdata%\.minecraft\minebatch\news.txt del %appdata%\.minecraft\minebatch\news.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\news.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/news.txt" -L -s
cls
cls
echo A brand new version is available: %new_version%
echo.
echo Three versions changelog:
echo -----------------------------------------
echo.
type %appdata%\.minecraft\minebatch\news.txt
echo.
echo -----------------------------------------
echo.
echo 1) Update
echo 2) Don't update
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto updatem)
if %errorlevel%==2 (goto update)

:force
cls
echo Updating...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
timeout 3 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\minebatch\version.txt
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd"
if not exist %USERPROFILE%\Desktop\Minebatch mkdir %USERPROFILE%\Desktop\Minebatch
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Minebatch.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

start %appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
exit


:updatem
cls
echo Updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd"
if not exist %USERPROFILE%\Desktop\Minebatch mkdir %USERPROFILE%\Desktop\Minebatch
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Minebatch.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

start %appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
exit


:update_smart
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
cls
echo Checking for updates...
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
timeout 3 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
set /p new_version=<%appdata%\.minecraft\minebatch\version.txt
if %version%==%new_version% goto version_not_found
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd"
if not exist %USERPROFILE%\Desktop\Minebatch mkdir %USERPROFILE%\Desktop\Minebatch
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Minebatch.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

start %appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
exit


:version_not_found
cls
echo You are using the latest version: %version%
echo.
echo.
echo.
pause
goto pro

:download
cls
echo Opening website...
echo.
echo.
echo.
start https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd
goto pro

:bug
cls
echo Please, let me know about that bug! You can contact me with:
echo.
echo 1) Discord
echo 2) E-mail
echo 3) Fill an online form
echo 4) Back
echo.
echo.
echo.
choice /c 1234 /n /m "Select: "
if %errorlevel%==1 (goto discord)
if %errorlevel%==2 (goto e-mail)
if %errorlevel%==3 (goto form)
if %errorlevel%==4 (goto mbatch)

:discord
cls
echo Discord
echo.
echo You can DM me on Discord, or you can just join mine Discord server.
echo.
echo 1) DM me
echo 2) Join my server
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (goto discord_dm)
if %errorlevel%==2 (goto discord_server)
if %errorlevel%==3 (goto bug)

:discord_dm
echo|set /p=Kotsasmin#9454|clip
cls
echo Discord DM
echo.
echo Tag copied to clipboard, but here it is if you can't find it: Kotsasmin#9454
echo.
echo.
echo.
pause
goto bug

:discord_server
echo|set /p=https://discord.gg/KHvjMcKkEX|clip
start https://discord.gg/KHvjMcKkEX
cls
echo Invite link copied to clipboard, but here it is if you can't find it: https://discord.gg/KHvjMcKkEX
echo.
echo.
echo.
pause
goto bug

:e-mail
echo|set /p=kotsasmin@gmail.com|clip
cls
echo E-mail
echo.
echo My e-mail is now on clipboard but here it is if you can't find it: kotsasmin@gmail.com
echo.
echo.
echo.
pause
goto bug


:form
cls
echo Opening website...
echo.
echo.
echo.
start https://forms.gle/xUKXpNnvkgBLBvct8
goto bug


:web1
cls
echo websites (page: 1/2)
echo.
echo 1) Kotsasmin's website
echo 2) copyitright's website
echo 3) TLauncher's website
echo 4) Rexdl's website
echo 5) Mc server soft's website
echo 6) Minecraft's website
echo 7) Java's website
echo 8) Page 2
echo 9) Back
choice /c 123456789 /n /m "Select: "
if %errorlevel%==1 (start http://kotsasmin.blogspot.com & goto web1)
if %errorlevel%==2 (start https://www.playfreeminecraft.nl/ & goto web1)
if %errorlevel%==3 (start https://tlauncher.org/ & goto web1)
if %errorlevel%==4 (start https://rexdl.com/ & goto web1)
if %errorlevel%==5 (start https://www.mcserversoft.com/ & goto web1)
if %errorlevel%==6 (start https://www.minecraft.net/en-us/ & goto web1)
if %errorlevel%==7 (start https://www.java.com/en/ & goto web1)
if %errorlevel%==8 (goto web2)
if %errorlevel%==9 (goto menu3)


:web2
cls
echo websites (page: 2/2)
echo.
echo 1) DirectX's website
echo 2) uTorrent's website
echo 3) Back
echo.
echo.
echo.
choice /c 123 /n /m "Select: "
if %errorlevel%==1 (start https://www.microsoft.com/en-us/download/details.aspx?id=35 & goto web2)
if %errorlevel%==2 (start https://www.utorrent.com/ & goto web2)
if %errorlevel%==3 (goto web1)

:credits
cls
echo     MINSProduction and Kotsasmin presents
timeout 5 /nobreak >nul
echo       in association with copyitright
timeout 5 /nobreak >nul
cls
echo                 Minebatch
timeout 5 /nobreak >nul
cls
echo Main programmer: Kotsasmin
timeout 1 /nobreak >nul
echo.
echo Assistants: Nickolasmin
timeout 1 /nobreak >nul
echo             Aggelosmin
timeout 1 /nobreak >nul
echo             copyitright
timeout 1 /nobreak >nul
echo.
echo Testers: copyitright
timeout 1 /nobreak >nul
echo          Efitselou
timeout 10 /nobreak >nul
cls
echo Curl commands and "curl.exe" file by copyitright
timeout 1 /nobreak >nul
echo.
echo Updating system assistant: copyitright
timeout 1 /nobreak >nul
echo.
echo Idea by: Nickolasmin
timeout 1 /nobreak >nul
echo.
echo Design and main menu by: Kotsasmin, Nickolasmin
timeout 10 /nobreak >nul
cls
echo Websites and sources: Minecraft
timeout 1 /nobreak >nul
echo                       TLauncher
timeout 1 /nobreak >nul
echo                       Rexdl
timeout 1 /nobreak >nul
echo                       MC server soft
timeout 1 /nobreak >nul
echo                       uTorrent
timeout 1 /nobreak >nul
echo                       Java
timeout 1 /nobreak >nul
echo                       GitHub
timeout 1 /nobreak >nul
echo                       DirectX
timeout 1 /nobreak >nul
echo                       playfreeminecraft (copyitright)
timeout 1 /nobreak >nul
echo                       Mega
timeout 1 /nobreak >nul
echo                       MediaFire
timeout 10 /nobreak >nul
cls
echo Special thanks to copyitright ^& Error for supporting us!
timeout 1 /nobreak >nul
echo.
echo Special thanks to GitHub and MediaFire for helping in online storage!
timeout 5 /nobreak >nul
cls
echo Thank you for downloading Minebatch! Have a nice day!
echo.
echo.
echo.
pause
goto info



:contact
cls
echo Contact (copy)
echo.
echo 1) My e-mail: kotsasmin@gmail.com
echo 2) My Discord server: https://discord.gg/KHvjMcKkEX
echo 3) My Discord tag: Kotsasmin#9454
echo 4) My website: kotsasmin.blogspot.com
echo 5) Back
echo.
echo.
echo.
choice /c 12345 /n /m "Select: "
if %errorlevel%==1 (echo|set /p=kotsasmin@gmail.com|clip)
if %errorlevel%==2 (echo|set /p=https://discord.gg/KHvjMcKkEX|clip)
if %errorlevel%==3 (echo|set /p=Kotsasmin#9454|clip)
if %errorlevel%==4 (echo|set /p=kotsasmin.blogspot.com|clip)
if %errorlevel%==5 (goto menu3)
goto contact

:clean
cls
echo Warning! Save and close all of your progresses before cleaning up your PC! Also,
echo this will take a lot of time.
echo.
echo 1) Start cleaning up
echo 2) Back
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto cleanup)
if %errorlevel%==2 (goto menu3)

:cleanup
cls
echo Cleaning up...
echo.
echo -----------------------
echo.
del /f /q "%userprofile%\Start Menu\Programs\Accessories\Program Compatibility Wizard.lnk">nul
del /f /q "%userprofile%\Start Menu\Programs\Accessories\Tour Windows XP.lnk">nul
rd /s /q "C:\Documents and Settings\All Users\Start Menu\Programs\Games\">nul
del /f /q "%userprofile%\Start Menu\Programs\Outlook Express.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\MSN.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\Windows Messenger.lnk">nul
del /f /q "%userprofile%\Start Menu\Programs\Remote Assistance.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Set Program Access and Defaults.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Windows Catalog.lnk">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\New Microsoft Office Document*">nul
del /f /q "C:\Documents and Settings\All Users\Start Menu\Open Microsoft Office Document*">nul
CD /d "C:\Documents and Settings\All Users\Desktop">nul
del /f /q "Show Desktop*">nul
CD /d "%userprofile%\Desktop">nul
del /f /q "Show Desktop*">nul
defrag C: -f
defrag D: -f
del /a /s /q %windir%\temp & md %windir%\temp>nul
del /a /s /q %userprofile%\recent\*.*>nul
del /a /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul
del /a /s /q "%userprofile%\Local Settings\Temp\*.*">nul
del /a /s /q "%userprofile%\recent\*.*">nul
del /a /s /q %systemdrive%\*.tmp>nul
del /a /s /q %systemdrive%\*._mp>nul
del /a /s /q %systemdrive%\*.log>nul
del /a /s /q %systemdrive%\*.gid>nul
del /a /s /q %systemdrive%\*.chk>nul
del /a /s /q %systemdrive%\*.old>nul
del /a /s /q %systemdrive%\recycled\*.*>nul
del /a /s /q %windir%\*.bak>nul
del /a /s /q %windir%\prefetch\*.*>nul
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q “%userprofile%\Local Settings\Temporary Internet Files\*.*”
del /f /s /q “%userprofile%\Local Settings\Temp\*.*”
del /f /s /q “%userprofile%\recent\*.*”
echo.
echo -----------------------
echo.
echo Cleaning up is complete!
echo.
echo.
echo.
timeout 5 /nobreak >nul
pause
goto menu

:options_make
(
echo 1
echo 1
echo 9f
)>%appdata%\.minecraft\minebatch\select.txt
goto:EOF


:loading
set /a load=%load% +3
cls
echo Loading... 
echo Please Wait...
echo.
echo Status: %progress_text%...
echo.
echo.
echo Progress: %load%%%%
echo.
echo.
echo.
if exist debug.log del debug.log
set/a loadnum=%loadnum% +3
if %loadnum% GEQ %finish% goto menu
if %ready%==1 set/a finish=70 & goto load
goto:EOF



:internet
set progress_text=Checking internet connection
call:loading
Ping www.google.nl -n 1 -w 1000 >nul
if errorlevel 1 (set internet=0) else (set internet=1)
if %internet%==1 set mode=Online
if %internet%==0 set mode=Offline
if %internet%==0 goto internet_error
cls
goto:EOF

:internet_error
cls
echo You are not connected to the internet... You can still run "Minebatch",
echo but you won't have the ability to download files and games from the internet
echo or auto update "Minebatch".
echo.
echo.
echo.
pause
cls
goto:EOF

:url
if exist "C:\Windows\System32\curl.exe" goto:EOF
cls
echo The file curl.exe isn't installed at you computer. If you don't install it
echo here: "C:\Windows\System32\curl.exe" you won't have the ability to download automatically
echo files and games to your computer or to upgrade "Minebatch". I you try to download
echo files using the auto downloader, you will recieve an error message! 
echo.
echo.
echo.
echo Press any key to download manually the file: curl.exe...
pause>nul
start http://www.mediafire.com/file/oohiofdtlvkmf7p/curl.exe/file
cls
goto:EOF

:exe
call:loading
if %internet%==0 goto need_web
call:loading
goto:EOF

:need_web
cls
echo I am sorry, but you need to have internet connection the first time you launch Minebatch.
echo.
echo.
echo.
pause
exit

:verion_updater
set progress_text=Checking for updates
call:loading
if %internet%==0 goto:EOF
if %update_start%==0 goto:EOF
if exist %appdata%\.minecraft\minebatch\version.txt del %appdata%\.minecraft\minebatch\version.txt
timeout 2 /nobreak >nul
curl -o %appdata%\.minecraft\minebatch\version.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/version.txt" -L -s
call:loading
timeout 2 /nobreak >nul
set /p new_version=<%appdata%\.minecraft\minebatch\version.txt
if %version%==%new_version% goto:EOF
call:loading
if exist %appdata%\.minecraft\minebatch\news.txt del %appdata%\.minecraft\minebatch\news.txt
timeout 2 /nobreak >nul
call:loading
curl -o %appdata%\.minecraft\minebatch\news.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/news.txt" -L -s
cls
echo A brand new version is available: %new_version%
echo.
echo Three versions changelog:
echo -----------------------------------------
echo.
type %appdata%\.minecraft\minebatch\news.txt
echo.
echo -----------------------------------------
echo.
echo 1) Update
echo 2) Don't update
echo.
echo.
echo.
choice /c 12 /n /m "Select: "
if %errorlevel%==1 (goto version_updater_update)
if %errorlevel%==2 (cls & goto:EOF)

:version_updater_update
cls
echo Auto updating...
echo.
echo.
echo.
curl --connect-timeout 3 --progress-bar -f -k -L "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/Minebatch.cmd" -o "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd"
if not exist %USERPROFILE%\Desktop\Minebatch mkdir %USERPROFILE%\Desktop\Minebatch
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Minebatch.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

start %appdata%\.minecraft\minebatch\Minebatch_%new_version%.cmd
(goto) 2>nul & del "%~f0"
exit

:daily_news
set progress_text=Downloading daily news
call:loading
if %internet%==0 goto:EOF
if %news_start%==0 goto:EOF
echo.
echo.
echo.
if exist %appdata%\.minecraft\minebatch\message.txt del %appdata%\.minecraft\minebatch\message.txt
call:loading
timeout 2 /nobreak >nul
call:loading
curl -o %appdata%\.minecraft\minebatch\message.txt "https://raw.githubusercontent.com/Kotsasmin/Minebatch/main/message.txt" -L -s
cls
echo ------------------ Minebatch news ------------------------
echo.
type %appdata%\.minecraft\minebatch\message.txt
echo.
echo ----------------------------------------------------------
echo.
echo.
echo.
pause
goto:EOF

:install
set progress_text=Installing Minebatch
call:loading
mkdir %appdata%\.minecraft\minebatch
call:options_make
call:loading
IF /I NOT DIR==minebatch if not exist Minebatch.lnk call:scr

goto:EOF


:scr
IF /I NOT "%~nx0"=="Minebatch.cmd" goto name_error

copy Minebatch.cmd %APPDATA%\.minecraft\minebatch>nul

:scr_start
(
echo @echo off
echo title Minebatch update
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -update
echo exit
)>%appdata%\.minecraft\minebatch\update.cmd

(
echo @echo off
echo title Minecraft folder
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -folder
echo exit
)>%appdata%\.minecraft\minebatch\folder.cmd

(
echo @echo off
echo title Minebatch uninstaller
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -unins
echo exit
)>%appdata%\.minecraft\minebatch\uninstall.cmd

(
echo @echo off
echo title E-mail
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -mail
echo exit
)>%appdata%\.minecraft\minebatch\e-mail.cmd

(
echo @echo off
echo title E-mail
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -minebatch_uninstall
echo exit
)>%appdata%\.minecraft\minebatch\minebatch_uninstall.cmd

(
echo @echo off
echo title Minebatch options
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -opt
echo exit
)>%appdata%\.minecraft\minebatch\options.cmd

(
echo @echo off
echo title Discord
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -discord
echo exit
)>%appdata%\.minecraft\minebatch\discord.cmd

(
echo @echo off
echo title News
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -news
echo exit
)>%appdata%\.minecraft\minebatch\news.cmd

(
echo @echo off
echo title Discord
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -clean
echo exit
)>%appdata%\.minecraft\minebatch\clean.cmd

(
echo @echo off
echo title Changelog
echo color f
echo start %appdata%\.minecraft\minebatch\Minebatch.cmd -change
echo exit
)>%appdata%\.minecraft\minebatch\change.cmd

mkdir %USERPROFILE%\Desktop\Minebatch\Tools
mkdir %USERPROFILE%\Desktop\Minebatch\Support
mkdir %USERPROFILE%\Desktop\Minebatch\News
timeout 0 /nobreak >nul

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Tools\System_clean_up.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\clean.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\News\Changelog.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\change.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Tools\Options.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\options.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\News\News.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\news.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%


set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Uninstaller.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\minebatch_uninstall.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Tools\Minecraft_folder.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\folder.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Update.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\update.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Support\e-mail.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\e-mail.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Support\Discord.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\discord.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Tools\Minecraft_folder_uninstaller.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\uninstall.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%


set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Minebatch\Minebatch.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%appdata%\.minecraft\minebatch\Minebatch.cmd" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
if scr==1 goto:EOF
start %USERPROFILE%\Desktop\Minebatch\Minebatch.lnk
del Minebatch.cmd
goto:EOF

:name_error
cls
echo Please rename the running file into: Minebatch.cmd
echo.
echo.
echo.
pause
exit

