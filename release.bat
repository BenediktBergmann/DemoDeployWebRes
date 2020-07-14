@echo off
set connection=%~1
set password=%~2
set package_root=..\..\..

For /R %package_root% %%G IN (spkl.exe) do (
	IF EXIST "%%G" (set spkl_path=%%G
	goto :continue)
)

:continue
@echo Deploying using %spkl_path%

%spkl_path% webresources ./ "%connection%%password%" /p:release


if errorlevel 1 (
	echo Error Code=%errorlevel%
	exit /b %errorlevel%
)

exit

Spkl file including a specified sub path
%spkl_path% webresources Webresources "%connection%%password%" /p:release