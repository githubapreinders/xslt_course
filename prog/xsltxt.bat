@echo off
REM xslxt.bat
REM arguments: %1=source XML, %2=script XSL, %3=result XML
echo Invoking XT executable....

REM do preprocessing here

if exist ..\prog\xt.exe goto :usepdirect
if exist ..\xt.exe goto :usedirect

:usepath
xt %1 %2 %3
goto :done

:usedirect
..\xt %1 %2 %3
goto :done

:usepdirect
..\prog\xt %1 %2 %3
goto :done

:done

REM do postprocessing here
