@ECHO OFF
mode con cols=58 lines=20
TITLE Hosts修改
color 2F
%Windir%\System32\FLTMC.exe >nul 2>&1 || (
    ECHO CreateObject^("Shell.Application"^).ShellExecute "%~f0", "%PAR1st%", "", "runas", 1 >
 "%TEMP%\AdminRun.vbs"
    ECHO CreateObject^("Scripting.filesystemobject"^).DeleteFile ^(WScript.ScriptFullName^) >>
 "%TEMP%\AdminRun.vbs"
    %Windir%\System32\CSCRIPT.exe //Nologo "%TEMP%\AdminRun.vbs"
    Exit /b
)
:Menu
Cls
@ echo.
@ echo.　　　　　 菜 单 选 项
@ echo.
@ echo.     打开Hosts文件 → 请输入1
@ echo.
@ echo.     访问亿破姐网站 → 请输入2
@ echo.
@ echo.     退出 → 请输入3
@ echo.
set /p xj= 输入数字，然后按回车：
if /i "%xj%"=="1" Goto Open
if /i "%xj%"=="2" Goto Visit
if /i "%xj%"=="3" Goto Exit
@ echo.
echo      选择无效，请重新输入
ping -n 2 127.1>nul
goto menu
:Open
@ echo.
ECHO 　　　hosts文件已经打开，您现在可以进行编辑，修改完成后别忘了保存！
notepad "%SystemRoot%\system32\drivers\etc\hosts"
goto menu
:Visit
mshta vbscript:createobject("wscript.shell").run("""iexplore""https://www.ypojie.com/",0)(window.close)
echo 已转到亿破姐欢迎光临！
goto menu
:Exit
exit