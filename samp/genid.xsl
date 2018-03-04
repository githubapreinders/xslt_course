<?xml version="1.0"?><!--genid.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">
  <html>
    <h2>Table of Contents</h2>
    <xsl:for-each select="//section/title">
      <a href="#{generate-id(.)}"><xsl:value-of select="."/>
      </a><br/>
    </xsl:for-each>
    <xsl:apply-templates/>
  </html>
</xsl:template>

<xsl:template match="title">
  <h2><a name="{generate-id(.)}"><xsl:value-of select="."/>
      </a></h2>
</xsl:template>

<xsl:template match="para">
  <p><xsl:apply-templates/></p>
</xsl:template>

</xsl:stylesheet>
