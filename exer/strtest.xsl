<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xsd"
                version="2.0">

<xsl:template match="/">
  <html>
    <head>
      <title>String test</title>
    </head>
    <body>
      <pre>
<xsl:variable name="strs" select="/.."/>
<xsl:for-each select="/..">
Str: <xsl:value-of select="/..,/.."/>
</xsl:for-each>
<xsl:for-each select="/..">
CamelCase: <xsl:value-of select="/.."/>
</xsl:for-each>
<xsl:for-each select="/..">
  <xsl:text>
Analyze: </xsl:text>
  <xsl:analyze-string select="." regex=".">
    <xsl:matching-substring>
    </xsl:matching-substring>
    <xsl:non-matching-substring>
    </xsl:non-matching-substring>
  </xsl:analyze-string>
</xsl:for-each>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>