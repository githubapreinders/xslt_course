<?xml version="1.0"?><!--copyofall.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">          <!--entire copy of root node-->
  <xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>