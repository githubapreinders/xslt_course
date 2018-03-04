<?xml version="1.0"?>
<!--
Exercise Worksheet - bookalt2.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:import href="../answers/book.xsl"/>

<xsl:template match="bold | italic">
  <u><xsl:apply-imports/></u>
</xsl:template>

</xsl:stylesheet>
