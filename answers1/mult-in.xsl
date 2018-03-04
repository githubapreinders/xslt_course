<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/control">
  <html>
    <head><title>Multiple File Tests</title></head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="get-data">
  <xsl:apply-templates select="document( unparsed-entity-uri( @ref ) )"/>
</xsl:template>

<xsl:template match="banner"/>

<xsl:template match="info">
  <p>Information from: '<i><xsl:value-of select="../banner"/></i>
  <xsl:text>': </xsl:text><xsl:value-of select="."/>
  </p>
</xsl:template>

</xsl:stylesheet>
