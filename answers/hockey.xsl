<!DOCTYPE html [
<!ENTITY nbsp "&#160;">
]>
<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="2.0">
<!--
Exercise Worksheet - hockey.xsl
-->
  <head>
    <title>Standings <xsl:value-of select="standings/@date"/></title>
  </head>
  <body>
    <!--part 1 is a report of the given information in the order given-->
    <h1>Division Standings</h1>
    <xsl:for-each select="standings/conference">
      <h2><xsl:value-of select="name"/> Conference</h2>
      <xsl:for-each select="division">
        <h3><xsl:value-of select="name"/> Division</h3>
        <!--one table for every division in the conference-->
        <table border="1" summary="{name} Division">
          <tr valign="top" align="center">
            <td>City</td><td>&nbsp;Games&nbsp;</td><td>&nbsp;Wins&nbsp;</td>
            <td>&nbsp;Losses&nbsp;</td><td>&nbsp;Ties&nbsp;</td>
            <td>&nbsp;OTL&nbsp;</td><td>&nbsp;Points&nbsp;</td>
          </tr>
          <xsl:for-each select="team">
            <!--a row for every team in the division-->
            <tr valign="top" align="center">
              <td align="left"><xsl:value-of select="name"/></td>
              <xsl:for-each select="g|w|l|t|o|p">
                <td><xsl:value-of select="."/></td>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:for-each>
    </xsl:for-each>

    <!--part 2 is a report of the conference-wide standings-->
    <h1>Conference Standings</h1>
    <xsl:for-each select="standings/conference">
      <h2><xsl:value-of select="name"/> Conference</h2>
      <!--table of teams in conference each indicating respective division-->
      <table border="1" summary="{name} Conference">
        <tr valign="top" align="center">
          <td>City</td><td>&nbsp;Division&nbsp;</td><td>&nbsp;Games&nbsp;</td>
          <td>&nbsp;Wins&nbsp;</td><td>&nbsp;Losses&nbsp;</td>
          <td>&nbsp;Ties&nbsp;</td><td>&nbsp;OTL&nbsp;</td>
          <td>&nbsp;Points&nbsp;</td>
        </tr>
        <xsl:for-each select=".//team">
          <xsl:sort order="descending" select="p"
                    data-type="number"/>
          <!--a row for every team in the conference-->
          <tr valign="top" align="center">
            <td align="left"><xsl:value-of select="name"/></td>
            <td align="left"><xsl:value-of select="../name"/></td>
            <xsl:for-each select="g|w|l|t|o|p">
              <td><xsl:value-of select="."/></td>
            </xsl:for-each>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:for-each>
  </body>
</html>




