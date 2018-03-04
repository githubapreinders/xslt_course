<?xml version="1.0"?><!--multhtm.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:xt="http://www.jclark.com/xt"
                extension-element-prefixes="xt">

<xsl:template match="/">
  <xsl:for-each select="//doc"> <!--copy documents out as HTML-->
    <xt:document method="html" href="{@file}">
      <html>
        <xsl:apply-templates select="*"/>
      </html>
    </xt:document>
  </xsl:for-each>
</xsl:template>

<xsl:template match="link">  <!--create link to other document-->
  <a href="{id(@idref)/ancestor::doc/@file}#{@idref}">
    <xsl:value-of select="@idref"/>
  </a>
</xsl:template>

<xsl:template match="linkend">     <!--create anchor for links-->
  <a name="{@id}"/>
</xsl:template>
                            <!--all other elements just copied-->
<xsl:template match="*|@*">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
