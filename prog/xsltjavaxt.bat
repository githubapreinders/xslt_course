@echo off
REM xsljavaxt.bat
REM check arguments: %1=source XML, %2=script XSL, %3=result XML
if a%3 == a goto :noout

set xjardir=..\
if not a%xjardir% == a..\ goto :noenv
if not exist %xjardir%xt.jar goto :checkprog
if not exist %xjardir%sax.jar goto :checkprog
if not exist %xjardir%xp.jar goto :checkprog
goto :ready

:checkprog 
set xjardir=..\prog\
if not a%xjardir% == a..\prog\ goto :noenv
if not exist %xjardir%xt.jar goto :checkprev
if not exist %xjardir%sax.jar goto :checkprev
if not exist %xjardir%xp.jar goto :checkprev
goto :ready

:checkprev
set xjardir=%xt%
if not a%xjardir% == a%xt% goto :noenv
if not exist %xjardir%xt.jar goto :nojar
if not exist %xjardir%sax.jar goto :nojar
if not exist %xjardir%xp.jar goto :nojar

:ready
echo Invoking xt jar....
java -cp "%xjardir%xt.jar;%xjardir%sax.jar;%xjardir%xp.jar" com.jclark.xsl.sax.Driver %1 %2 %3
REM post-process results
goto :done

:nojar
if not exist ..\%xjardir%xt.jar echo "xt.jar" does not exist in "..\", "..\prog" or "%xjardir%"
if not exist ..\%xjardir%sax.jar echo "sax.jar" does not exist in "..\", "..\prog" or "%xjardir%"
if not exist ..\%xjardir%xp.jar echo "x.jar" does not exist in "..\", "..\prog" or "%xjardir%"
goto :done

:noenv
echo Not enough environment space for SET variables:
echo   - see what set variables are in place using the command:  set
echo   - remove any not needed using the command:  set variablename=
echo   - rerun this batch file
goto :done

:noout
echo xt Args:  input stylesheet output
goto :done

:done
set xjardir=
