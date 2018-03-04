<?xml version="1.0"?><!--hellodoc.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="1.0" exclude-result-prefixes="mydoc"
               xmlns:mydoc="http://www.mycompany.com/mydoc">

<xsl:output method="html"/>

<mydoc:para>
The following construct is the root template.
</mydoc:para>

<xsl:template match="/">                         <!--root rule-->
    <b><i><u><xsl:value-of select="greeting"/></u></i></b>
    <?test a processing instruction here?>
</xsl:template>

</xsl:transform>
