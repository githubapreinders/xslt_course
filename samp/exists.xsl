<?xml version="1.0"?><!--exists.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY nl "&#xd;&#xa;"> ]>
<xsl:stylesheet version="1.0"
         xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
         xmlns:file="http://www.jclark.com/xt/java/java.io.File">

<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:if test="not( function-available('file:exists') and
                     function-available('file:new') )">
    <xsl:message terminate="yes">
      <xsl:text>Required Java file facilities </xsl:text>
      <xsl:text>are not available</xsl:text>
    </xsl:message>
  </xsl:if>
  <xsl:for-each select="//file">         <!--process each file-->
    <xsl:text>File </xsl:text><xsl:value-of select="."/>
    <xsl:text>: </xsl:text>              <!--display file name-->
    <xsl:choose>                          <!--report existence-->
      <xsl:when test="file:exists(file:new(string(.)))">
        <xsl:text>exists&nl;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>does not exist&nl;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
