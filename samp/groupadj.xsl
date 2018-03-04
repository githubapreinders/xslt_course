<?xml version="1.0"?><!--groupadj.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
<!ENTITY pad "          ">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:for-each select="/*/name">                 <!--unsorted-->
    <xsl:value-of select="concat(surname,', ',given)"/>
    <xsl:text>&nl;</xsl:text></xsl:for-each>
  <xsl:text>---&nl;</xsl:text>

  <xsl:for-each select="/*/name">           <!--group adjacent-->
    <xsl:choose>
      <xsl:when test="not( preceding-sibling::name[1]
                                  [surname=current()/surname] )">
        <xsl:value-of select="surname"/>
        <xsl:value-of select="substring( '&pad;',
                                string-length( surname ) + 1 )"/>
      </xsl:when>
      <xsl:otherwise><xsl:text>&pad;</xsl:text></xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="given"/>
    <xsl:text>&nl;</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
