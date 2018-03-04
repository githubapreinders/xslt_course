<?xml version="1.0"?>
<!--
Exercise Worksheet - book3.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:b="urn:x-Crane:book"
                exclude-result-prefixes="b"
                version="1.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="/b:doc/b:title"/></title></head>
    <body>
      <h1><xsl:value-of select="/b:doc/b:title"/></h1>
      <xsl:for-each select="b:doc/b:chapter">   <!--do each chapter-->
        <hr/>
        <h2>
          <xsl:value-of select="b:title"/>
        </h2>
        <xsl:apply-templates/>              <!--unknown order, so apply-->
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

<xsl:template match="b:title"/>              <!--already displayed-->

<xsl:template match="b:para">                <!--unordered elements-->
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="b:bold">
  <b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="b:italic">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="b:ulist">
  <ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="b:olist">
  <ol><xsl:apply-templates/></ol>
</xsl:template>

<xsl:template match="b:li">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="b:suppress"/>

<xsl:template match="b:para/b:fig">
  <img src="{@filename}" alt="{@filename}"/>
</xsl:template>

<xsl:template match="b:fig">
  <center><img src="{@filename}" alt="{@filename}"/></center>
</xsl:template>

</xsl:stylesheet>
