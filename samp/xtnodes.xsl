<?xml version="1.0"?><!--xtnodes.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nl "&#xd;&#xa;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xt="http://www.jclark.com/xt"
                version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">                         <!--root rule-->
  <xsl:variable name="data">    <!--a fragment with 4 elements-->
     <a>The A element</a><b>The B element</b>
     <c>The C element</c><d>The D element</d>
  </xsl:variable>
     <!--process children of the node returned by the function-->
  <xsl:for-each select="xt:node-set($data)/*">
    <xsl:value-of select="."/><xsl:text>&nl;</xsl:text>
  </xsl:for-each>
  <!--determine intersection and difference using two children-->
  <xsl:text>Intersection:</xsl:text><xsl:text>&nl;</xsl:text>
  <xsl:for-each select="xt:intersection(xt:node-set($data)/*,
                                        xt:node-set($data)/b|
                                        xt:node-set($data)/c)">
    <xsl:value-of select="."/><xsl:text>&nl;</xsl:text>
  </xsl:for-each>
  <xsl:text>Difference:</xsl:text><xsl:text>&nl;</xsl:text>
  <xsl:for-each select="xt:difference(xt:node-set($data)/*,
                                      xt:node-set($data)/b|
                                      xt:node-set($data)/c)">
    <xsl:value-of select="."/><xsl:text>&nl;</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
