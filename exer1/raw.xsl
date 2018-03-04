<?xml version="1.0"?>
<!--
Exercise Worksheet - ???????.xsl
-->
<!DOCTYPE xsl:stylesheet [<!ENTITY nl "&#xd;&#xa;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="xml"/>

<xsl:template match="/">
  <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>
