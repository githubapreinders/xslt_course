<?xml version="1.0"?><!--minmax.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:variable name="itemnodes" select="//item"/>
  <xsl:text>Minimum nodes:&nl;</xsl:text>       <!--get nodes-->
  <xsl:for-each
        select="$itemnodes[ not( $itemnodes/@val &lt; @val ) ]">
    <xsl:value-of select="."/><xsl:text>&nl;</xsl:text>
  </xsl:for-each>

  <xsl:text>Maximum value: </xsl:text>   <!--get single value-->
  <xsl:for-each select="$itemnodes">    <!--sort all in order-->
    <xsl:sort data-type="number" order="descending"
              select="@val"/>
    <xsl:if test="position() = 1">   <!--first in list is max-->
      <xsl:value-of select="@val"/>
    </xsl:if>
  </xsl:for-each>
  <xsl:text>&nl;</xsl:text>
</xsl:template>

</xsl:stylesheet>
