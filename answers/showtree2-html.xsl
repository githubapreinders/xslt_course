<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:import href="showtree2.xsl"/>

<xsl:output method="html"/>

<xsl:template match="/">
  <html>
    <head>
      <title>SHOWTREE</title>
    </head>
    <body>
      <pre>
        <xsl:apply-imports/>
      </pre>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>