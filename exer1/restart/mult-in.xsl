<?xml version="1.0"?>
<!--
Exercise Worksheet - mult-in-start.xsl
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/control">
  <html>
    <head><title>Multiple File Tests</title></head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="get-data">
  <xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="banner"/>

<xsl:template match="info">
  <p>Information from: '<i></i>
  <xsl:text>': </xsl:text>
  </p>
</xsl:template>

</xsl:stylesheet>
