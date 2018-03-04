<?xml version="1.0"?><!--nxml.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!--XT (see http://www.jclark.com/xml/xt.html)-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

 <!--encoding attribute from suffix of sun.io.ByteToCharLatin1-->
<xsl:output method="xt:nxml" 
            encoding="Latin1"
            xmlns:xt="http://www.jclark.com/xt"/>

<xsl:template match="/">       <!--kind of text being produced-->
  <nxml>
    <escape char="\">\\</escape>   <!--escape any back slashes-->
    <data><xsl:apply-templates/></data>   <!--translate <data>-->
  </nxml>
</xsl:template>

<xsl:template match="Name|Address">     <!--prefix information-->
  <xsl:value-of select="name(.)"/>: <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="charValue"> <!--don't translate <control>-->
  <control><xsl:text>\</xsl:text>
           <xsl:value-of select="@val"/>-<char number="{@val}"/>
           <xsl:text>\</xsl:text>
  </control>
</xsl:template>

</xsl:stylesheet>