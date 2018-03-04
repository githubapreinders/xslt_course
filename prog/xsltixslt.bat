@echo off
REM xslixslt.bat
REM check arguments: %1=source XML, %2=script XSL, %3=result XML
echo Invoking iXSLT executable....
ixslt -g -G -i:%1 -o:%3 %2
REM post-process results
