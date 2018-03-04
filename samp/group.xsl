<?xml version="1.0"?><!--group.xsl-->
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

  <xsl:for-each select="/*/name">             <!--group sorted-->
    <xsl:sort select="surname"/>            <!--by primary key-->

     <!--the following test is only true once for each primary 
     key, even though all elements are visited by the for-each-->
    <xsl:if test="not( preceding-sibling::name
                                  [surname=current()/surname] )">
      <xsl:value-of select="surname"/>
      <xsl:text>:&nl;</xsl:text>
              <!--reselect only nodes with current primary key-->
      <xsl:for-each select="/*/name[surname=current()/surname]">
        <xsl:sort select="given"/>        <!--by secondary key-->
        <xsl:text>&pad;</xsl:text>
        <xsl:value-of select="given"/>
        <xsl:text>&nl;</xsl:text>
      </xsl:for-each>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
