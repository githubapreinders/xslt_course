<?xml version="1.0"?><!--hellohtm.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="1.0">
 <head><title>Greeting</title></head>
 <body><p>Words of greeting:<br/>
   <b><i><u><xsl:value-of select="greeting"/></u></i></b>
   </p></body>
</html>
