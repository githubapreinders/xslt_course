<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xsd"
                version="2.0">

<xsl:template match="/">
  <html>
    <head>
      <title>Date test</title>
    </head>
    <body>
      <pre>
Today's date:  <xsl:value-of select="/.."/>
Input date:    <xsl:value-of select="/.."/>
<xsl:variable name="diff" select="/.."/>
Days between:  <xsl:value-of select="/.."/>
Half-way date: <xsl:value-of select="/.."/>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>