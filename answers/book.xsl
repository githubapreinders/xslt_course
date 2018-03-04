<?xml version="1.0"?>
<!--
Exercise Worksheet - book.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="doc/title"/></title></head>
    <body>
      <h1><xsl:value-of select="doc/title"/></h1>
      <xsl:for-each select="doc/chapter">
        <hr/>
        <h2><xsl:value-of select="title"/></h2>
        <xsl:apply-templates/>
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

<xsl:template match="title">
  <!--do nothing; already added to the tree-->
</xsl:template>

<xsl:template match="para">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="bold">
  <b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="italic">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="olist">
  <ol><xsl:apply-templates/></ol>
</xsl:template>

<xsl:template match="ulist">
  <ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="li">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="suppress"/> <!--suppress this!!!-->

<xsl:template match="para/fig" name="do-a-figure-for-Ken">
  <img src="{@filename}">
    <xsl:attribute name="alt">
      <xsl:value-of select="@filename"/>
    </xsl:attribute>
  </img>
</xsl:template>

<xsl:template match="fig">
 <center>
   <xsl:call-template name="do-a-figure-for-Ken"/>
 </center>
</xsl:template>

</xsl:stylesheet>
