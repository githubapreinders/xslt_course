<?xml version="1.0"?>
<!--
Exercise Worksheet - book3.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:b="urn:x-Crane:book"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="b:doc/b:title"/></title></head>
    <body>
      <h1><xsl:value-of select="b:doc/b:title"/></h1>
      <xsl:for-each select="b:doc/b:chapter">
        <hr/>
        <h2><xsl:value-of select="b:title"/></h2>
        <xsl:apply-templates/>
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

<xsl:template match="b:title">
  <!--do nothing; already added to the tree-->
</xsl:template>

<xsl:template match="b:para">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="b:bold">
  <b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="b:italic">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="b:olist">
  <ol><xsl:apply-templates/></ol>
</xsl:template>

<xsl:template match="b:ulist">
  <ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="b:li">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="b:suppress"/> <!--suppress this!!!-->

<xsl:template match="b:para/b:fig" name="do-a-figure-for-Ken">
  <img src="{@filename}">
    <xsl:attribute name="alt">
      <xsl:value-of select="@filename"/>
    </xsl:attribute>
  </img>
</xsl:template>

<xsl:template match="b:fig">
 <center>
   <xsl:call-template name="do-a-figure-for-Ken"/>
 </center>
</xsl:template>

</xsl:stylesheet>
