<?xml version="1.0"?><!--group3.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
<!ENTITY pad "          ">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:key name="names" match="name" use="surname"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:for-each select="/*/name">                 <!--unsorted-->
    <xsl:value-of select="concat(surname,', ',given)"/>
    <xsl:text>&nl;</xsl:text></xsl:for-each>
  <xsl:text>---&nl;</xsl:text>
                                              <!--group sorted-->
                        <!--get the first node of each surname-->
  <xsl:for-each select="/*/name
          [generate-id(.)=generate-id(key('names',surname)[1])]">
    <xsl:sort select="surname"/>            <!--by primary key-->
    <xsl:value-of select="surname"/>
    <xsl:text>:&nl;</xsl:text>
                       <!--get all nodes for the given surname-->
    <xsl:for-each select="key('names',surname)">
      <xsl:sort select="given"/>          <!--by secondary key-->
      <xsl:text>&pad;</xsl:text>
      <xsl:value-of select="given"/>
      <xsl:text>&nl;</xsl:text>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
