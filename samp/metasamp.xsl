<?xml version="1.0"?><!--metasamp.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY dark-green "#004400">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">                       <!-- root rule -->
  <html>
    <head>
      <title><xsl:value-of select="//banner"/></title>
    </head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="banner">
  <div style="font-size:15pt;color=red;text-align:center">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="para">
  <div style="font-size:15pt;color=&dark-green;">
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>
