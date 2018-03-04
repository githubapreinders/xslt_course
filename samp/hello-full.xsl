<?xml version="1.0"?><!--hello-full.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="1.0">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
    <b><i><u><xsl:value-of select="greeting"/></u></i></b>
</xsl:template>

</xsl:transform>
