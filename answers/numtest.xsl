<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xsd"
                version="2.0">

<xsl:template match="/">
  <html>
    <head>
      <title>Number test</title>
    </head>
    <body>
      <pre>
        <xsl:variable name="nums" select="nums/num"/>
<xsl:for-each select="$nums">
Num:                   <xsl:value-of select="."/>
</xsl:for-each>
Count:                 <xsl:value-of select="count($nums)"/>
Sum:                   <xsl:value-of select="sum($nums)"/>
Average:               <xsl:value-of select="round-half-to-even(
                                             sum($nums) div
                                             count($nums),2 )"/>
Average rounded:       <xsl:value-of select="sum(for $each in $nums
                                              return round($each) ) div
                                             count($nums)"/>
Average even-rounded:  <xsl:value-of select="sum(for $each in $nums
                                 return round-half-to-even($each) ) div
                                             count($nums)"/>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>