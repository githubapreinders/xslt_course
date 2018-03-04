<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:my="urn:x-Crane"
                exclude-result-prefixes="xsd my"
                version="2.0">

<xsl:template match="/">
  <html>
    <head>
      <title>Date test</title>
    </head>
    <body>
      <pre>
Today's date:  <xsl:value-of select="my:showdate(current-date())"/>
Input date:    <xsl:value-of select="my:showdate(date)"/>
<xsl:variable name="diff" select="current-date() - 
                                  (date cast as xsd:date)"/>
Days between:  <xsl:value-of select="days-from-duration($diff)"/>
Half-way date: <xsl:value-of select="xsd:date(date) +
                                     $diff div 2"/>
      </pre>
    </body>
  </html>
</xsl:template>

<xsl:function name="my:showdate">
  <xsl:param name="date"/>
  <xsl:value-of select="format-date($date,'[D01] [MNn] [Y1]',
                                    'en', (), () )"/>
</xsl:function>

</xsl:stylesheet>