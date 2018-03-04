<?xml version="1.0"?>
<!--
Exercise Worksheet - book.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="/doc/title"/></title></head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="doc/title">
  <h1><xsl:apply-templates/></h1>
</xsl:template>

<xsl:template match="chapter">
  <hr/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chapter/title">
  <h2>
    <xsl:choose>
      <xsl:when test="count(../../chapter)=1">Only</xsl:when>
      <xsl:when test="not(../following-sibling::chapter)">Last</xsl:when>
      <xsl:when test="not(../preceding-sibling::chapter)">First</xsl:when>
      <xsl:otherwise>Middle</xsl:otherwise>
    </xsl:choose>
    Chapter
    <xsl:number count="chapter" format="I"/>:
    <xsl:apply-templates/>
  </h2>
</xsl:template>

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

<xsl:template match="para/fig">
  <img src="{@filename}" alt="{@filename}"/>
</xsl:template>

<xsl:template match="fig">
  <center><img src="{@filename}" alt="{@filename}"/></center>
</xsl:template>

</xsl:stylesheet>
