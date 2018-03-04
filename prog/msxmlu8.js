//File:  msxmlu8.js - 2000-04-20 16:30
//Info:  http://www.CraneSoftwrights.com/links/msxml.htm
//Args:  input-file style-file output-file
var xml  = WScript.CreateObject("Microsoft.XMLDOM");          //input
xml.validateOnParse=false;
xml.load(WScript.Arguments(0));
var xsl  = WScript.CreateObject("Microsoft.XMLDOM");          //style
xsl.validateOnParse=false;
xsl.load(WScript.Arguments(1));
var out = WScript.CreateObject("Microsoft.XMLDOM");           //output
out.async = false;
out.validateOnParse=false;
xml.transformNodeToObject( xsl, out );
out.save(WScript.Arguments(2));
//eof