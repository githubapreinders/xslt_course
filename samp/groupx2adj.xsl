<?xml version="1.0"?><!--groupx2adj.xsl-->
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
    <xsl:text>&nl;</xsl:text>
  </xsl:for-each>
  <xsl:text>---&nl;</xsl:text>

  <xsl:for-each-group select="/*/name" 
                      group-adjacent="surname"> <!--by surname-->
   <xsl:for-each select="current-group()">
     <!--omit surname if not the first in adjacent group-->
     <xsl:value-of select="if( position()=1 ) 
            then ( surname, substring('&pad;',
                                      string-length(surname)+2) )
            else '&pad;'"/>
     <xsl:value-of select="given"/>
     <xsl:text>&nl;</xsl:text>
   </xsl:for-each>
  </xsl:for-each-group>
</xsl:template>

</xsl:stylesheet>
