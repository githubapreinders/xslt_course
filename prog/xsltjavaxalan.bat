@echo off
REM xsltjavaxalan.bat
REM check arguments: %1=source XML, %2=script XSL, %3=result XML
if a%3 == a goto :noout

set xjardir=..\
if not a%xjardir% == a..\ goto :noenv
if not exist %xjardir%xalan.jar goto :checkprog
if not exist %xjardir%xml-apis.jar goto :checkprog
if not exist %xjardir%xercesImpl.jar goto :checkprog
goto :ready

:checkprog
set xjardir=..\prog\
if not a%xjardir% == a..\prog\ goto :noenv
if not exist %xjardir%xalan.jar goto :checkprev
if not exist %xjardir%xml-apis.jar goto :checkprev
if not exist %xjardir%xercesImpl.jar goto :checkprev
goto :ready

:checkprev
set xjardir=%apache%
if not a%xjardir% == a%apache% goto :noenv
if not exist %xjardir%xalan.jar goto :nojar
if not exist %xjardir%xml-apis.jar goto :nojar
if not exist %xjardir%xercesImpl.jar goto :nojar

:ready
echo Invoking Xalan/Xerces jar: "%1" with "%2" to "%3"
java -cp "%xjardir%xalan.jar;%xjardir%xml-apis.jar;%xjardir%xercesImpl.jar" org.apache.xalan.xslt.Process -in %1 -xsl %2 -out %3
goto :done

:nojar
if not exist ..\%xjardir%xalan.jar echo "xalan.jar" does not exist in "..\", "..\prog" or "%xjardir%"
if not exist ..\%xjardir%xml-apis.jar echo "xml-apis.jar" does not exist in "..\", "..\prog" or "%xjardir%"
if not exist ..\%xjardir%xercesImpl.jar echo "xercesImpl.jar" does not exist in "..\", "..\prog" or "%xjardir%"
goto :done

:noenv
echo Not enough environment space for SET variables:
echo   - see what set variables are in place using the command:  set
echo   - remove any not needed using the command:  set variablename=
echo   - rerun this batch file
goto :done

:noout
echo Xalan Args:  input stylesheet output
goto :done

:done
