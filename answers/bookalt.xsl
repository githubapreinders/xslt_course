<?xml version="1.0"?>
<!--
Exercise Worksheet - bookalt.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:import href="../answers/book.xsl"/>

<xsl:template match="bold">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="italic">
  <b><xsl:apply-templates/></b>
</xsl:template>

</xsl:stylesheet>
