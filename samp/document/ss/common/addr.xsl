<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="city" xml:space='preserve'>
  <xsl:call-template name="abc"/>
  <xsl:value-of select="document('data.xml')"/>
  <xsl:value-of select="document('data.xml',/)"/>
  <xsl:value-of select="document('data.xml',.)"/>
</xsl:template>

</xsl:stylesheet>
