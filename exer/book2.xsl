<?xml version="1.0"?>
<!--
Exercise Worksheet - book.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title></title></head>
    <body>
      <h1></h1>
        <hr/>
        <h2></h2>
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

</xsl:stylesheet>
