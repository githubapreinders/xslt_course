<?xml version="1.0"?><!--hockey5.xsl-->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head>
      <title>Standings <xsl:value-of select="standings/@date"/></title>
    </head>
    <body>
      <h1>Game-oriented Standings - <xsl:value-of select="standings/@date"/>
      </h1>
      <xsl:for-each-group select="//team" group-by="g">
        <xsl:sort select="g" order="descending" data-type="number"/>
        <h2>Games: <xsl:value-of select="g"/></h2>
        <table border="1" summary="{g} Games">
          <tr valign="top" align="center">
            <th>City</th><th>&nbsp;Wins&nbsp;</th>
            <th>&nbsp;Losses&nbsp;</th><th>&nbsp;Ties&nbsp;</th>
            <th>&nbsp;OTL&nbsp;</th><th>&nbsp;Points&nbsp;</th>
          </tr>
          <xsl:for-each select="current-group()">
            <xsl:sort select="p" order="descending" data-type="number"/>
            <tr valign="top" align="center">
              <td align="left"><xsl:value-of select="name"/></td>
              <xsl:for-each select="w|l|t|o|p">
                <td><xsl:value-of select="."/></td>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:for-each-group>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>