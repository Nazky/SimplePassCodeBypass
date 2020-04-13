@echo off

title SimplePassCodeBypass

mkdir FileInfo\BypassPasscode\File

del %UserProfile%\.ssh\known_hosts

start cmd /k tcprelay.bat

echo make sur to have run tcprelay and python 2.7 and python 3 install !!!!

:home

color 02

echo *****************************
echo *   Simple Passcode Bypass  *
echo *    Created by @NazkyYT    *
echo *     And @appletech752     *
echo *---------------------------*
echo * 1 - Get File              *
echo * 2 - Bypass IOS 13.x       *
echo * 3 - Send File             *
echo *****************************

set /P number="Choose a number : "

if /I %number% == 1 goto :GF
if /I %number% == 2 goto :BP
if /I %number% == 3 goto :SF

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
goto :Home

:BP
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
goto :Home