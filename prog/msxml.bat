@echo off
REM msxml.bat
REM check arguments: %1=source XML, %2=script MSXML, %3=result HTML
REM Use MSXMLJSDIR environment variable
if a%MSXMLJSDIR% == a set MSXMLJSDIR=..\prog\
echo Invoking MSXML....
cscript //nologo %MSXMLJSDIR%msxml.js %1 %2 %3
REM post-process results
