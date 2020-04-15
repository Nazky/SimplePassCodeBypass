@echo off

title SimplePassCodeBypass

mkdir FileInfo\BypassPasscode\File\Ressource\

del %UserProfile%\.ssh\known_hosts

start cmd /k tcprelay.bat

echo make sur to have run tcprelay and python 2.7 and python 3 install !!!!

:home

color 02

echo *****************************
echo *   Simple Passcode Bypass  *
echo *           V0.2            *
echo *    Created by @NazkyYT    *
echo *     And @appletech752     *
echo *---------Passcode----------*
echo * 1 - Get File              *
echo * 2 - Send File             *
echo *----------Bypass-----------*
echo * 3 - IOS 13.x              *
echo * 4 - IOS 12.3/13.2.3       *
echo *---------Automatic---------*
echo * 5 - IOS 12.3/13.2.3       *
echo * 6 - IOS 13.x              *
echo *-----------Extra-----------*
echo * 7 - Get Sliver Files      *
echo *****************************

set /P number="Choose a number : "

if /I %number% == 1 goto :GF
if /I %number% == 3 goto :BP
if /I %number% == 2 goto :SF
if /I %number% == 4 goto :BP2
if /I %number% == 5 goto :A12
if /I %number% == 6 goto :A13
if /I %number% == 6 goto :A13
if /I %number% == 7 goto :ST

echo Choose right number
pause
cls
goto :home

:ST

color 08

set /P Folder="Drag and drop MagicFile Folder : "
xcopy "%Folder%/4/Library/activation_record.plist" FileInfo\BypassPasscode\File\Ressource\ /E
xcopy "%Folder%/4/Library/data_ark.plist" FileInfo\BypassPasscode\File\Ressource\ /E
xcopy "%Folder%/3/" FileInfo\BypassPasscode\File\Ressource\ /E
echo Copy finish you can now use the send file option
pause
cls
goto :home

:GF

color 05

echo.
echo Send script to device...

REM bin\Ressource\scp.exe -P2222 bin\Ressource\getfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 bin\Ressource\getfiles.sh root@localhost:/var/root
echo.
echo Run script...
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 getfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./getfiles.sh
echo.
echo Get File...
REM bin\Ressource\scp.exe -P2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\
echo.
echo.
echo Get file normally sucess 
pause
cls
goto :home

:SF

color 06
echo.
echo Send ressource to device...
REM bin\Ressource\scp.exe -P2222 -r FileInfo\BypassPasscode\File\Ressource\. root@localhost:/Ressource 
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r FileInfo\BypassPasscode\File\Ressource\. root@localhost:/Ressource 
echo.
echo Send script to device....
REM bin\Ressource\scp.exe -P2222 bin\Ressource\sendfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r bin\Ressource\sendfiles.sh root@localhost:/var/root
echo.
echo run script
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 sendfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./sendfiles.sh
echo.
echo.
echo File normally Upload 
pause
cls
goto :home

:BP

color 07

echo.
echo Start Bypass
REM bin\Ressource\ssh.exe root@localhost -p2222 mount -o rw,union,update /
REM bin\Ressource\scp.exe -P2222 bin\Bypass\13\I13B root@localhost:/usr/libexec/
REM bin\Ressource\ssh.exe root@localhost -p2222 mv /usr/libexec/mobileactivationd /usr/libexec/mobileactivationdbak
REM bin\Ressource\ssh.exe root@localhost -p2222 mv /usr/libexec/I13B /usr/libexec/mobileactivationd
REM bin\Ressource\ssh.exe root@localhost -p2222 launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
REM bin\Ressource\ssh.exe root@localhost -p2222 launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
bin\Ressource\ssh.exe root@localhost -p 2222 mount -o rw,union,update /
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 bin\Bypass\13\I13B root@localhost:/usr/libexec/
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost mv /usr/libexec/mobileactivationd /usr/libexec/mobileactivationdbak
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost mv /usr/libexec/I13B /usr/libexec/mobileactivationd
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
echo.
echo.
echo Bypass done
pause
cls
goto :home

:BP2

color 02

echo.
echo Start Bypass
REM bin\Ressource\ssh.exe root@localhost -p2222 mount -o rw,union,update /
REM bin\Ressource\ssh.exe root@localhost -p2222 rm -rf /Applications/Setup.app
REM bin\Ressource\ssh.exe root@localhost -p2222 uicache -p /Applications/Setup.app
REM bin\Ressource\ssh.exe root@localhost -p2222 killall backboardd
bin\Ressource\ssh.exe root@localhost -p 2222 mount -o rw,union,update /
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost rm -rf /Applications/Setup.app
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost uicache -p /Applications/Setup.app
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost killall backboardd
echo.
echo.
echo Bypass done
pause
cls
goto :home

:A12

color 03
echo.
set /P Name="Choose name for you backup : "

echo.
echo Send script to device...

REM bin\Ressource\scp.exe -P2222 bin\Ressource\getfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 bin\Ressource\getfiles.sh root@localhost:/var/root
echo.
echo Run script...
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 getfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./getfiles.sh
echo.
echo Get File...
REM bin\Ressource\scp.exe -P2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\%Name%
echo.
echo.
echo Get file normally sucess 
bin\Ressource\idevicerestore.exe -l
echo Device Restored now jailbreak you'r iphone
pause
echo.
echo Start Bypass
REM bin\Ressource\ssh.exe root@localhost -p2222 mount -o rw,union,update /
REM bin\Ressource\ssh.exe root@localhost -p2222 rm -rf /Applications/Setup.app
REM bin\Ressource\ssh.exe root@localhost -p2222 uicache -p /Applications/Setup.app
REM bin\Ressource\ssh.exe root@localhost -p2222 killall backboardd
bin\Ressource\ssh.exe root@localhost -p 2222 mount -o rw,union,update /
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost rm -rf /Applications/Setup.app
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost uicache -p /Applications/Setup.app
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost killall backboardd
echo.
echo.
echo Bypass done
echo.
echo Send ressource to device...
REM bin\Ressource\scp.exe -P2222 -r FileInfo\BypassPasscode\File\Ressource\. root@localhost:/Ressource 
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r FileInfo\BypassPasscode\File\%Name%\Ressource\. root@localhost:/Ressource 
echo.
echo Send script to device....
REM bin\Ressource\scp.exe -P2222 bin\Ressource\sendfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r bin\Ressource\sendfiles.sh root@localhost:/var/root
echo.
echo run script
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 sendfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./sendfiles.sh
echo.
echo.
echo File normally Upload 
echo.
echo.
echo Bypass auto normally sucess if you have problem contact me on twitter
pause
cls
goto :home

:A13
echo.
set /P Name="Choose name for you backup : "

color 01

echo Send script to device...

REM bin\Ressource\scp.exe -P2222 bin\Ressource\getfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 bin\Ressource\getfiles.sh root@localhost:/var/root
echo.
echo Run script...
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 getfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 getfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./getfiles.sh
echo.
echo Get File...
REM bin\Ressource\scp.exe -P2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r root@localhost:/var/root/Ressource FileInfo\BypassPasscode\File\%Name%
echo.
echo Get file normally sucess 
bin\Ressource\idevicerestore.exe -l
echo.
echo Device Restored now jailbreak you'r iphone
pause 
echo.
echo Start Bypass
REM bin\Ressource\ssh.exe root@localhost -p2222 mount -o rw,union,update /
REM bin\Ressource\scp.exe -P2222 bin\Bypass\13\I13B root@localhost:/usr/libexec/
REM bin\Ressource\ssh.exe root@localhost -p2222 mv /usr/libexec/mobileactivationd /usr/libexec/mobileactivationdbak
REM bin\Ressource\ssh.exe root@localhost -p2222 mv /usr/libexec/I13B /usr/libexec/mobileactivationd
REM bin\Ressource\ssh.exe root@localhost -p2222 launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
REM bin\Ressource\ssh.exe root@localhost -p2222 launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
bin\Ressource\ssh.exe root@localhost -p 2222 mount -o rw,union,update /
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 bin\Bypass\13\I13B root@localhost:/usr/libexec/
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost mv /usr/libexec/mobileactivationd /usr/libexec/mobileactivationdbak
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost mv /usr/libexec/I13B /usr/libexec/mobileactivationd
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
echo.
echo Bypass done
echo.
echo Send ressource to device...
REM bin\Ressource\scp.exe -P2222 -r FileInfo\BypassPasscode\File\Ressource\. root@localhost:/Ressource 
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r FileInfo\BypassPasscode\File\%Name%\Ressource\. root@localhost:/Ressource 
echo.
echo Send script to device....
REM bin\Ressource\scp.exe -P2222 bin\Ressource\sendfiles.sh root@localhost:/var/root
bin\Ressource\pscp.exe -scp -pw alpine -P 2222 -r bin\Ressource\sendfiles.sh root@localhost:/var/root
echo.
echo run script
REM bin\Ressource\ssh.exe root@localhost -p2222 chmod 755 sendfiles.sh
REM bin\Ressource\ssh.exe root@localhost -p2222 ./sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost chmod 755 sendfiles.sh
bin\Ressource\plink.exe -ssh -pw alpine -P 2222 root@localhost ./sendfiles.sh
echo.
echo File normally Upload 
echo.
echo.
echo Bypass auto normally sucess if you have problem contact me on twitter
pause
cls
goto :home
