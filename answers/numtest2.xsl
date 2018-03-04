<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="urn:x-Crane"
                exclude-result-prefixes="c"
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
Sum:                   <xsl:value-of select="
  format-number(sum($nums),'# ###,00','euro-formatting')"/>
Average:               <xsl:value-of 
select="c:show-number(sum($nums) div count($nums))"/>
Average rounded:       <xsl:value-of 
select="c:show-number(sum( for $each in $nums 
                               return round($each) )
                      div count($nums))"/>
Average even-rounded:  <xsl:value-of 
select="c:show-number(sum( for $each in $nums 
                               return round-half-to-even($each) )
                      div count($nums))"/>
      </pre>
    </body>
  </html>
</xsl:template>

<xsl:function name="c:show-number">
  <xsl:param name="num"/>
  <xsl:value-of select="format-number($num,'#,###.00')"/>
</xsl:function>

<xsl:decimal-format name="euro-formatting"
                    decimal-separator=","
                    grouping-separator=" "/>

</xsl:stylesheet>