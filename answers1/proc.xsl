<?xml version="1.0"?>
<!--
Exercise Worksheet - proc.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title>Procedures</title></head>
    <body><xsl:apply-templates/></body>
  </html>
</xsl:template>

<xsl:template match="task">         <!--indirect processing only-->
  <xsl:apply-templates select="title"/>
  <xsl:apply-templates select="@type"/>
  <xsl:apply-templates select="@ref"/>
  <xsl:apply-templates select="proc"/>
</xsl:template>

<xsl:template match="task/title">   <!--a title when in a task-->
  <center><h2><u><xsl:apply-templates/></u></h2></center>
</xsl:template>

<xsl:template match="@type">
  <center><b><xsl:value-of select="."/></b></center>
</xsl:template>

<xsl:template match="@ref">
  <center><xsl:value-of select="."/></center>
</xsl:template>

<xsl:template match="proc">         <!--a procedure-->
  <xsl:apply-templates select="title"/>
  <ol>
    <xsl:apply-templates select="step"/>
  </ol>
  <hr/>
</xsl:template>

<xsl:template match="proc/title">
  <h3><xsl:apply-templates/></h3>
</xsl:template>

<xsl:template match="step">         <!--a step in a procedure-->
  <li><xsl:apply-templates/></li>
</xsl:template>

</xsl:stylesheet>
