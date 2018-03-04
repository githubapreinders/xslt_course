<?xml version="1.0"?>
<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="2.0">
  <head><title>Procedures</title></head>
  <body>
    <xsl:for-each select="procs/task">
      <center><h2><u><xsl:value-of select="title"/></u></h2></center>
      <center><b><xsl:value-of select="@type"/></b></center>
      <center><xsl:value-of select="@ref"/></center>
      <xsl:for-each select="proc">
        <h3><xsl:value-of select="title"/></h3>
        <ol>
          <xsl:for-each select="step">
            <li><xsl:value-of select="."/></li>
          </xsl:for-each>
        </ol>
        <hr/>
      </xsl:for-each>
    </xsl:for-each>
  </body>
</html>
