<?xml version="1.0"?><!--groupx2by.xsl-->
<!--XSLT 2.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
<!ENTITY pad "          ">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
<xsl:output method="text"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:for-each select="/*/name">                 <!--unsorted-->
    <xsl:value-of select="concat(surname,', ',given)"/>
    <xsl:text>&nl;</xsl:text></xsl:for-each>
  <xsl:text>---&nl;</xsl:text>

  <xsl:for-each-group select="/*/name" 
                      group-by="surname">     <!--group sorted-->
    <xsl:sort select="surname"/>            <!--by primary key-->

    <xsl:value-of select="current-grouping-key()"/>
    <xsl:text>:&nl;</xsl:text>
              <!--reselect only nodes with current primary key-->
    <xsl:for-each select="current-group()">
      <xsl:sort select="given"/>        <!--by secondary key-->
      <xsl:text>&pad;</xsl:text>
      <xsl:value-of select="given"/>
      <xsl:text>&nl;</xsl:text>
    </xsl:for-each>
  </xsl:for-each-group>
</xsl:template>

</xsl:stylesheet>
