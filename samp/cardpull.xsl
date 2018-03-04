<?xml version="1.0"?><!--cardpull.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="1.0">
  <center><b><u>Electronic Contact Information</u></b></center>
  <p>Name: <xsl:value-of select="/card/name"/></p>
  <xsl:for-each select="/card/email">
    <p><xsl:value-of select="@type"/>
       <xsl:text> Email: </xsl:text>
       <a href="mailto:{.}"><xsl:value-of select="."/></a></p>
  </xsl:for-each>
  <center><b><u>Postal Contact Information</u></b></center>
  <p>Name: <xsl:value-of select="/card/name"/></p>
  <p>Address: <xsl:value-of select="/card/address"/></p>
</html>
