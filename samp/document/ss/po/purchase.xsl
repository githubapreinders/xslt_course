<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="../common/addr.xsl"/>

<xsl:template match="/doc">
  Four combinations:
  <xsl:apply-templates select="//city"/>
  String from base stylesheet directory:
  Argument as a node:   <xsl:value-of select="document(@file)"/>
  Argument as a string: <xsl:value-of select="document(string(@file))"/>
</xsl:template>

<xsl:template name="abc">
  <xsl:value-of select="document('data.xml')"/>
</xsl:template>

</xsl:stylesheet>
