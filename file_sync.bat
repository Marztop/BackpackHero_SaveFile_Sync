@echo off
chcp 65001
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

:START

rmdir "%cd%\assets\WinRAR" /S /Q
rmdir "%cd%\assets\WinRAR 5.80 (64-bit)" /S /Q

cls
echo "1: 导入"
echo "2: 导出"
echo "q: 退出"


set /p arg="输入数字并回车:"
if %arg%==1 (
if EXIST "%cd%\Backpack Hero.rar" (
rmdir "%cd%\Backpack Hero" /S /Q
if %OS%==64BIT "%cd%\assets\WinRAR64.exe" x -inul -y -r -ibck "%cd%\Backpack Hero.rar" "%cd%\"
if %OS%==32BIT "%cd%\assets\WinRAR.exe" x -inul -y -r -ibck "%cd%\Backpack Hero.rar" "%cd%\"
rmdir "%userprofile%\AppData\LocalLow\TheJaspel\Backpack Hero"
md "%userprofile%\AppData\LocalLow\TheJaspel\Backpack Hero"
copy "%cd%\Backpack Hero" "%userprofile%\AppData\LocalLow\TheJaspel\Backpack Hero"
rmdir "%cd%\Backpack Hero" /S /Q
del "%cd%\Backpack Hero.rar"
rmdir "%cd%\assets\WinRAR" /S /Q
rmdir "%cd%\assets\WinRAR 5.80 (64-bit)" /S /Q
) ELSE (
echo "Backpack Hero.rar does not EXIST"
PAUSE
goto START
)
) ELSE if %arg%==2 (
rmdir "%cd%\Backpack Hero" /S /Q
del "%cd%\Backpack Hero.rar"
md "%cd%\Backpack Hero"
copy "%userprofile%\AppData\LocalLow\TheJaspel\Backpack Hero" "%cd%\Backpack Hero"
if %OS%==64BIT "%cd%\assets\WinRAR64.exe" a -ep1 -o+ -inul -r -ibck "%cd%\Backpack Hero.rar" "%cd%\Backpack Hero"
if %OS%==32BIT "%cd%\assets\WinRAR.exe" a -ep1 -o+ -inul -r -ibck "%cd%\Backpack Hero.rar" "%cd%\Backpack Hero"
rmdir "%cd%\Backpack Hero" /S /Q
rmdir "%cd%\assets\WinRAR" /S /Q
rmdir "%cd%\assets\WinRAR 5.80 (64-bit)" /S /Q
) ELSE if %arg%==q (
exit
) ELSE (
goto START
)