<?xml version="1.0"?><!--cardpush.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">    <!--process tree twice-->
 <html><xsl:apply-templates select="card"/>
       <xsl:apply-templates select="card" mode="postal"/></html>
</xsl:template>
                               <!--electronic info-->
<xsl:template match="card">
 <center><b><u>Electronic Contact Information</u></b></center>
 <xsl:apply-templates/></xsl:template>

<xsl:template match="name">
 <p>Name: <xsl:apply-templates/></p></xsl:template>

<xsl:template match="address"/> <!--suppress address-->

<xsl:template match="email">    <!--generate a mailto:-->
  <p><xsl:value-of select="@type"/>
     <xsl:text> Email: </xsl:text>
     <a href="mailto:{.}"><xsl:apply-templates/></a></p>
</xsl:template>
                                <!--postal info-->
<xsl:template match="card" mode="postal">
  <center><b><u>Postal Contact Information</u></b></center>
  <xsl:apply-templates select="name"/>
  <xsl:apply-templates select="address" mode="postal"/>
</xsl:template>

<xsl:template match="address" mode="postal">
  <p>Address: <xsl:apply-templates/></p></xsl:template>

</xsl:stylesheet>