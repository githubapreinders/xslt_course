<?xml version="1.0"?><!--sorttest.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [<!ENTITY nl "&#xd;&#xa;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:apply-templates select="/*/name"/>         <!--unsorted-->
  <xsl:text>---&nl;</xsl:text>
  <xsl:apply-templates select="/*/name"> <!--sort with one key-->
    <xsl:sort select="surname"/>
  </xsl:apply-templates>
  <xsl:text>---&nl;</xsl:text>
  <xsl:for-each select="/*/name">       <!--sort with two keys-->
    <xsl:sort select="surname"/>
    <xsl:sort select="given"/>
    <xsl:call-template name="name"/>         <!--show the name-->
  </xsl:for-each>
</xsl:template>

          <!--both direct and indirect application of template-->
<xsl:template name="name" match="name">
  <xsl:value-of select="surname"/>,<xsl:value-of select="given"/>
  <xsl:text>&nl;</xsl:text>
</xsl:template>

</xsl:stylesheet>
