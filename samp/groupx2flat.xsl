<?xml version="1.0"?><!--groupx2flat.xsl-->
<!--XSLT 2.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
<!ENTITY pad "          ">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
<xsl:output method="text"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:for-each-group select="/*/*" 
                      group-starting-with="generation">
    <xsl:value-of select="."/>
    <xsl:text/>(<xsl:value-of select="count(current-group())-1"/>
    <xsl:text>):&nl;</xsl:text>
              <!--reselect only nodes with current primary key-->
    <xsl:for-each select="current-group()[self::name]">
      <xsl:sort select="surname"/>          <!--by primary key-->
      <xsl:sort select="given"/>          <!--by secondary key-->
      <xsl:value-of select="'  ',given,surname"/>
      <xsl:text>&nl;</xsl:text>
    </xsl:for-each>
  </xsl:for-each-group>
</xsl:template>

</xsl:stylesheet>
