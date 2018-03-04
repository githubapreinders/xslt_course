<?xml version="1.0"?>
<!--
Exercise Worksheet - book.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:my="urn:x-Crane"
                version="2.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="/doc/title"/></title></head>
    <body>
      <h1><xsl:value-of select="/doc/title"/></h1>
      <xsl:for-each select="doc/chapter">   <!--do each chapter-->
        <hr/>
        <h2>
          <xsl:value-of select="title"/>
        </h2>
        <xsl:apply-templates/>              <!--unknown order, so apply-->
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

<xsl:template match="para/fig">
  <xsl:copy-of select="my:do-a-figure(.)"/>
</xsl:template>

<xsl:template match="fig">
  <center>
   <xsl:copy-of select="my:do-a-figure(.)"/>
  </center>
</xsl:template>

<xsl:function name="my:do-a-figure">
  <xsl:param name="fig"/>
  <img src="{$fig/@filename}" 
       alt="{$fig/ancestor::doc/title} - {$fig/@filename}"/>  
</xsl:function>

</xsl:stylesheet>
