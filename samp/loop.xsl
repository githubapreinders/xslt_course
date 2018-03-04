<?xml version="1.0"?><!--loop.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY nl "&#xd;&#xa;"> ]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>

<xsl:param name="count" select="3"/>       <!--allow override-->

<xsl:template match="/">
  <xsl:text>Dan:   "Say goodnight, Dick."&nl;</xsl:text>
  <xsl:call-template name="countdown">    <!--begin countdown-->
             <!--convert to number in case supplied as string-->
    <xsl:with-param name="counter" select="number($count)"/>
    <xsl:with-param name="content">  <!--what is to be copied-->
      <xsl:text>Dick:  "Goodnight Dick!"&nl;</xsl:text>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="countdown"> <!--recursive loop until done-->
  <xsl:param name="content"/>      <!--structure to be copied-->
  <xsl:param name="counter" select="0"/>   <!--remaining reps-->
  <xsl:if test="$counter > 0">  <!--count not zero; more work-->
    <xsl:copy-of select="$content"/>
    <xsl:call-template name="countdown">   <!--next; one less-->
      <xsl:with-param name="counter" select="$counter - 1"/>
      <xsl:with-param name="content" select="$content"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
