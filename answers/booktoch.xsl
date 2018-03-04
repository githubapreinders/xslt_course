<?xml version="1.0"?>
<!--
Exercise Worksheet - bookn.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="/doc/title"/></title></head>
    <body>
      <h1><xsl:value-of select="/doc/title"/></h1>

      <h3>Table of contents</h3>
      <table>
        <xsl:for-each select="doc/chapter">
          <tr>
            <td align="right">
              <a href="#{generate-id(.)}"><xsl:number format="I"/></a>
            </td>
            <td>
              <a href="#{generate-id(.)}">
                <xsl:value-of select="title"/>
              </a>
            </td>
          </tr>
        </xsl:for-each>
      </table>

      <xsl:for-each select="doc/chapter">   <!--do each chapter-->
        <hr/>
        <h2>
          <a name="{generate-id(.)}"/>
        <xsl:choose>                        <!--prefix title-->
          <xsl:when test="position()=1">
            <xsl:text>First </xsl:text>
          </xsl:when>
          <xsl:when test="position()=last()">
            <xsl:text>Last </xsl:text>
          </xsl:when>
          <xsl:otherwise>Middle </xsl:otherwise>
        </xsl:choose>
        <xsl:text>Chapter </xsl:text>
        <xsl:number format="I"/>: <xsl:value-of select="title"/></h2>
        <xsl:apply-templates/>       <!--unknown order, so apply-->
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

<xsl:template match="title"/>              <!--already displayed-->

<xsl:template match="para">                <!--unordered elements-->
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="bold">
  <b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="italic">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="ulist">
  <ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="olist">
  <ol><xsl:apply-templates/></ol>
</xsl:template>

<xsl:template match="li">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="suppress"/>

<xsl:template match="para/fig" name="do-a-figure">
  <img src="{@filename}" alt="{@filename}"/>
</xsl:template>

<xsl:template match="fig">
  <center><xsl:call-template name="do-a-figure"/></center>
</xsl:template>

</xsl:stylesheet>
