@echo off
::接收脚本参数
set _arv1=%1%
set _arv2=%2%
set _arv3=%3%
echo %_arv1%
::echo %arv2%
::echo %arv3%

::调用dockerInit函数，传递一个参数
::call:dockerInit 9999 
echo %__arv1%

call:run

::----定义一个dockerInit函数start----
exit /b 0 
:dockerInit 
	set __arv1=%1%
	::判断文件是否存在
	if exist "D:\data\xxx.txt" (
		echo 文件已经存在
	) else (
		mkdir data-path
	)
	::echo %__arv1%
goto:eof
::----定义一个dockerInit函数end----

exit /b 0
:run 
	docker run -p 9001:9056 --name php5.6.01 -v D:\wwwroot:/data -p 0.0.0.0:8001:80 -d php:5.6-fpm
goto:eof