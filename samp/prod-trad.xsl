<?xml version="1.0"?><!--prod-trad.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">                         <!--root rule-->
  <html><head><title>Record of Sales</title></head>
    <body><h2>Record of Sales</h2>
      <xsl:apply-templates select="/sales/record"/>
    </body></html></xsl:template>

<xsl:template match="record">   <!--processing for each record-->
  <ul><xsl:apply-templates/></ul></xsl:template>

<xsl:template match="prodsale">   <!--processing for each sale-->
  <li><xsl:value-of select="../@num"/>   <!--use parent's attr-->
      <xsl:text> - </xsl:text>
      <xsl:value-of select="id(@idref)"/>      <!--go indirect-->
      <xsl:text> - </xsl:text>
      <xsl:value-of select="."/></li></xsl:template>

</xsl:stylesheet>
