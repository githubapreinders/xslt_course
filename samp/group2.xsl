<?xml version="1.0"?><!--group2.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
<!ENTITY pad "          ">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">                          <!--root rule-->
  <xsl:for-each select="/*/name">                  <!--unsorted-->
    <xsl:value-of select="concat(surname,', ',given)"/>
    <xsl:text>&nl;</xsl:text></xsl:for-each>
  <xsl:text>---&nl;</xsl:text>
                                               <!--group sorted-->
  <xsl:variable name="names" select="/*/name"/>
  <xsl:for-each select="$names">          <!--look at all names-->
    <xsl:sort select="surname"/>             <!--by primary key-->

       <!--only act if this is the first node with this surname-->
    <xsl:if test="generate-id(.)=
               generate-id($names[surname=current()/surname][1])">
      <xsl:value-of select="surname"/>
      <xsl:text>:&nl;</xsl:text>
                        <!--get all nodes for the given surname-->
      <xsl:for-each select="$names[surname=current()/surname]">
        <xsl:sort select="given"/>         <!--by secondary key-->
        <xsl:text>&pad;</xsl:text>
        <xsl:value-of select="given"/>
        <xsl:text>&nl;</xsl:text>
      </xsl:for-each>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
