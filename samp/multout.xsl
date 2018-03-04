<?xml version="1.0"?><!--multout.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!--XT (see http://www.jclark.com/xml/xt.html)-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:xt="http://www.jclark.com/xt"
                extension-element-prefixes="xt">

<xsl:template match="/*/*">   <!--children of document element-->
  <xsl:choose>
    <xsl:when test="@method='xml'">
      <xt:document method="xml" href="{@file}" indent="yes">
        <xsl:copy>
          <xsl:copy-of select="*
                              |processing-instruction()|comment()"/>
        </xsl:copy>
      </xt:document>
    </xsl:when>
    <xsl:when test="@method='html'">
      <xt:document method="html" href="{@file}">
        <xsl:copy>
          <xsl:copy-of select="*
                              |processing-instruction()|comment()"/>
        </xsl:copy>
      </xt:document>
    </xsl:when>
    <xsl:when test="@method='text'">
      <xt:document method="text" href="{@file}">
        <xsl:copy>
          <xsl:copy-of select="*|text()"/>
        </xsl:copy>
      </xt:document>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="text()"/>     <!--eat all unexpected text-->

</xsl:stylesheet>
