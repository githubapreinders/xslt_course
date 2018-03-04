@echo off
REM xsljavaoracle.bat
REM check arguments: %1=source XML, %2=script XSL, %3=result XML
REM environment: SET oracleXSLT=p:\oracle\xsltcurr\bin\
echo Invoking Oracle XML parser jar....
java -cp "%oracleXSLT%xmlparserv2.jar" oracle.xml.parser.v2.oraxsl %1 %2 %3
REM post-process results
