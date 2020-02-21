@echo off

md C:\BACKUP\

set /a %p = 1

:start
if exist "C:\BACKUP\%p%\" goto loop
if not exist "C:\BACKUP\%p%\" goto cp
exit

:loop
echo %p%
set /a %p += 1
goto start

:cp

rem 保存备份数
if %p% GTR 30 set /a %p = 1
echo "C:\BACKUP\%p%\"
if exist "C:\BACKUP\%p%\" rd /Q /S "C:\BACKUP\%p%\"
md "C:\BACKUP\%p%\"

rem 需要备份的目录、备份到的目录
xcopy /S /Y "C:\Users\Administrator\Documents\" "C:\BACKUP\%p%\"
set /a %p += 1
echo "C:\BACKUP\%p%\"

rem 延时s
timeout 1800
goto cp