:: 切换目录
cd /d %~dp0

:: 转换文件
python caj2pdf/caj2pdf convert %*

:: 暂停方便看error log
pause
