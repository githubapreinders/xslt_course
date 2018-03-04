@echo off
REM xsltjavasaxon.bat
REM check arguments: %1=source XML, %2=script XSL, %3=result XML
if a%3 == a goto :noout

set sjardir=..\
if not a%sjardir% == a..\ goto :noenv
if not exist %sjardir%saxon9.jar goto :checkprog
goto :ready

:checkprog
set sjardir=..\prog\
if not a%sjardir% == a..\prog\ goto :noenv
if not exist %sjardir%saxon9.jar goto :checkprev
goto :ready

:checkprev
set sjardir=%saxon%
if not a%sjardir% == a%saxon% goto :noenv
if not exist %sjardir%saxon9.jar goto :nojar

:ready
echo Transforming %1 with %2 to %3 with XSLT 2.0...
java -cp "%sjardir%;%sjardir%saxon9.jar" net.sf.saxon.Transform -o %3 %1 %2
REM post-process results
goto :done

:nojar
if not exist ..\%sjardir%saxon9.jar echo "saxon9.jar" does not exist in "..\", "..\prog" or "%sjardir%"
goto :done

:noenv
echo Not enough environment space for SET variables:
echo   - see what set variables are in place using the command:  set
echo   - remove any not needed using the command:  set variablename=
echo   - rerun this batch file
goto :done

:noout
echo Saxon Args:  input stylesheet output
goto :done

:done
set sjardir=
