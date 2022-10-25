@echo off
echo Last Update --> 10:18 PM 07/27/2021 Paul Stryer<--
set pod_min=1
set pod_max=20
set templatedir=C:\Users\user\Desktop\sandbox\templates

:setpodnum
echo Pod number must be an integer from %pod_min% to %pod_max%.
echo
echo This script will only import templates for pods 1-20.
echo
set /p pod="Enter Pod Number [%pod_min%-%pod_max%]: "
if %pod% LSS %pod_min% (
    goto :setpodnum
)
if %pod% GTR %pod_max% (
    goto :setpodnum
)

set /p verify="You selected pod %pod%.  Is that correct (y/n)? "
if not %verify% == y (
    echo(
    goto :setpodnum
)

set /p password="Enter your pods vManage netadmin user password: "

set ip=64.102.247.128
if %pod%==1 (set ip=64.102.247.160)
if %pod%==2 (set ip=64.102.247.157)
if %pod%==3 (set ip=64.102.247.154)
if %pod%==4 (set ip=64.102.247.151)
if %pod%==5 (set ip=64.102.247.148)
if %pod%==6 (set ip=64.102.247.145)
if %pod%==7 (set ip=64.102.247.142)
if %pod%==8 (set ip=64.102.247.139)
if %pod%==9 (set ip=64.102.247.136)
if %pod%==10 (set ip=64.102.247.133)
if %pod%==11 (set ip=64.102.247.188)
if %pod%==12 (set ip=64.102.247.185)
if %pod%==13 (set ip=64.102.247.182)
if %pod%==14 (set ip=64.102.247.179)
if %pod%==15 (set ip=64.102.247.176)
if %pod%==16 (set ip=64.102.247.173)
if %pod%==17 (set ip=64.102.247.170)
if %pod%==18 (set ip=64.102.247.167)
if %pod%==19 (set ip=64.102.247.164)
if %pod%==20 (set ip=64.102.247.161)

@echo on
sdwan -a %ip% -u netadmin -p %password% --verbose restore --workdir %templatedir%  template_feature
sdwan -a %ip% -u netadmin -p %password% --verbose restore --workdir %templatedir%  template_device
@echo off

pause
