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
<xsl:variable name="nums" select="/.."/>
<xsl:for-each select="/..">
Num:                   <xsl:value-of select="/.."/>
</xsl:for-each>
Count:                 <xsl:value-of select="/.."/>
Sum:                   <xsl:value-of select="/.."/>
Average:               <xsl:value-of select="/.."/>
Average rounded:       <xsl:value-of select="/.."/>
Average even-rounded:  <xsl:value-of select="/.."/>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>