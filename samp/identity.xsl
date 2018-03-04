<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="@*|node()">  <!--identity transform-->
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!--specializations-->

<xsl:template match="a">  <!--change the a element; ignore attrs-->
  <new-A-here>
    <xsl:apply-templates/>
  </new-A-here>
</xsl:template>

<xsl:template match="@b"/> <!--remove b attributes-->

</xsl:stylesheet>
