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
<xsl:variable name="strs" select="strs/str"/>
<xsl:for-each select="$strs">
Str: <xsl:value-of select=".,concat('(',count(tokenize(.,'\s+')),')')"/>
</xsl:for-each>
<xsl:for-each select="$strs[matches(.,'[a-z][A-Z]')]">
CamelCase: <xsl:value-of select="replace(.,'([a-z])([A-Z])','$1 $2')"/>
</xsl:for-each>
<xsl:for-each select="$strs">
  <xsl:text>
Analyze: </xsl:text>
  <xsl:analyze-string select="." regex="\S+">
    <xsl:matching-substring>
      <xsl:choose>
        <xsl:when test="matches(.,'[a-z][A-Z]')">
          <xsl:value-of select="concat('(',.,')')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:matching-substring>
    <xsl:non-matching-substring>
      <xsl:value-of select="."/>
    </xsl:non-matching-substring>
  </xsl:analyze-string>
</xsl:for-each>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>