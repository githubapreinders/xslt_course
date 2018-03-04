@echo off
REM xslsaxon.bat
REM arguments: %1=source XML, %2=script XSL, %3=result XML
echo Invoking Saxon executable....

REM do preprocessing here

if exist ..\prog\saxon.exe goto :usepdirect
if exist ..\saxon.exe goto :usedirect
if exist ..\saxon\saxon.exe goto :usesdirect
if exist ..\prog\saxon\saxon.exe goto :usepsdirect

:usepath
saxon -o %3 %1 %2
goto :done

:usedirect
..\saxon -o %3 %1 %2
goto :done

:usepdirect
..\prog\saxon -o %3 %1 %2
goto :done

:usesdirect
..\saxon\saxon -o %3 %1 %2
goto :done

:usepsdirect
..\prog\saxon\saxon -o %3 %1 %2
goto :done

:done

REM do postprocessing here