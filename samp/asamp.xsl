<?xml version="1.0"?><!--asamp.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY dark-green "#004400"> ]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="html"
         doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">                    <!-- root rule -->
  <html>
    <head><title>Anchor Example</title></head>
    <body><xsl:apply-templates/></body></html></xsl:template>

<xsl:template match="section/title">
  <a name="{../@id}">
     <p style="font-size:15pt;color=red;text-align:center">
       <xsl:apply-templates/>
     </p></a></xsl:template>

<xsl:template match="para">
  <p style="font-size:15pt;color=#004400">
    <xsl:apply-templates/></p></xsl:template>

<xsl:template match="sectref">
  <a href="#{@idref}">
     <xsl:value-of select="id(@idref)/title"/></a></xsl:template>

</xsl:stylesheet>
