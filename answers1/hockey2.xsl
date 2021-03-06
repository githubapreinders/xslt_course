<?xml version="1.0"?><!--hockey2.xsl-->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:key name="teams-by-games" match="team" use="g"/>

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head>
      <title>Standings <xsl:value-of select="standings/@date"/></title>
    </head>
    <body>
      <h1>Game-oriented Standings - <xsl:value-of select="standings/@date"/>
      </h1>
      <xsl:for-each select="//team[generate-id(.)=
                            generate-id(key('teams-by-games',g)[1])]">
        <xsl:sort select="g" order="descending" data-type="number"/>
          <h2>Games: <xsl:value-of select="g"/></h2>
          <table border="1" summary="{g} Games">
            <tr valign="top" align="center">
              <td>City</td><td>&nbsp;Wins&nbsp;</td>
              <td>&nbsp;Losses&nbsp;</td><td>&nbsp;Ties&nbsp;</td>
              <td>&nbsp;OTL&nbsp;</td><td>&nbsp;Points&nbsp;</td>
            </tr>
            <xsl:for-each select="key('teams-by-games',g)">
              <xsl:sort select="p" order="descending" data-type="number"/>
              <tr valign="top" align="center">
                <td align="left"><xsl:value-of select="name"/></td>
                <xsl:for-each select="w|l|t|o|p">
                  <td><xsl:value-of select="."/></td>
                </xsl:for-each>
              </tr>
            </xsl:for-each>
          </table>
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>