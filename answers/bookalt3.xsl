<?xml version="1.0"?>
<!--
Exercise Worksheet - bookalt3.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:import href="../answers/book.xsl"/>

<xsl:template match="bold | italic">
  <u><xsl:apply-imports/></u>
</xsl:template>

<xsl:template match="italic//bold | bold//italic">
  <xsl:apply-imports/>
</xsl:template>

</xsl:stylesheet>
