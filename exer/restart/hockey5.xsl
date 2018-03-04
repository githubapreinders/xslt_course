<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<!--
Exercise Worksheet - hockey3.xsl
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head>
      <title>Standings <xsl:value-of select="standings/@date"/></title>
    </head>
    <body>

      <!--part 1 is a report of the division-wide groupings-->
      <h1>Division Standings - <xsl:value-of select="standings/@date"/></h1>
      <xsl:for-each select="/standings/conference">
        <h2><xsl:value-of select="name"/> Conference</h2>
        <xsl:for-each select="division">
          <h3><xsl:value-of select="name"/> Division</h3>
          <xsl:for-each select=".//team">
	      <h4>Games: <xsl:value-of select="g"/></h4>
	      <table border="1" summary="{name} Division">
		<tr valign="top" align="center">
		  <td>City</td><td>&nbsp;Wins&nbsp;</td>
		  <td>&nbsp;Losses&nbsp;</td><td>&nbsp;Ties&nbsp;</td>
		  <td>&nbsp;OTL&nbsp;</td><td>&nbsp;Points&nbsp;</td>
                </tr>
		  <tr valign="top" align="center">
		    <td align="left"><xsl:value-of select="name"/></td>
		    <xsl:for-each select="w|l|t|o|p">
		      <td><xsl:value-of select="."/></td>
		    </xsl:for-each>
		  </tr>
	      </table>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>

      <!--part 2 is a report of the conference-wide groupings-->
      <h1>Conference Standings</h1>
      <xsl:for-each select="/standings/conference">
        <xsl:variable name="conf-id" select="generate-id(.)"/>
        <h2><xsl:value-of select="name"/> Conference</h2>
        <xsl:for-each select=".//team">
            <!--a table for each unique value of number of games played-->
            <h4>Games: <xsl:value-of select="g"/></h4>
	    <table border="1" summary="{name} Conference">
	      <tr valign="top" align="center">
		<td>City</td><td>&nbsp;Division&nbsp;</td>
		<td>&nbsp;Wins&nbsp;</td><td>&nbsp;Losses&nbsp;</td>
		<td>&nbsp;Ties&nbsp;</td><td>&nbsp;OTL&nbsp;</td>
		<td>&nbsp;Points&nbsp;</td>
              </tr>
		<!--a row for each team with the given number of games-->
		<tr valign="top" align="center">
		  <td align="left"><xsl:value-of select="name"/></td>
		  <td align="left">
		    <xsl:value-of select="ancestor::division/name"/></td>
		  <xsl:for-each select="w|l|t|o|p">
		    <td><xsl:value-of select="."/></td>
		  </xsl:for-each>
		</tr>
	    </table>
        </xsl:for-each>
      </xsl:for-each>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>