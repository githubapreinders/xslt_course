<?xml version="1.0"?><!--xsl.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xslo="any-URI" version="1.0">

<xsl:output indent="yes"/>

<xsl:namespace-alias stylesheet-prefix="xslo" 
                     result-prefix="xsl"/>

<xsl:template match="/">                         <!--root rule-->
  <xslo:stylesheet version="1.0">
    <xslo:template match="/">
      <html>
        <p>
          Stylesheet <xsl:value-of select="."/>:
          <xslo:value-of select="."/>
        </p>
      </html>
    </xslo:template>
  </xslo:stylesheet>
</xsl:template>

</xsl:stylesheet>
