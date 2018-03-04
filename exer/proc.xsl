<?xml version="1.0"?>
<!--
Exercise Worksheet - proc.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title>Procedures</title></head>
    <body><xsl:apply-templates/></body>
  </html>
</xsl:template>

<xsl:template match="task">         <!--indirect processing only-->
</xsl:template>

<xsl:template match="task/title">   <!--a title when in a task-->
  <center><h2><u></u></h2></center>
</xsl:template>

<xsl:template match="@type">
  <center><b></b></center>
</xsl:template>

<xsl:template match="@ref">
  <center></center>
</xsl:template>

<xsl:template match="proc">         <!--a procedure-->
  <ol>
  </ol>
  <hr/>
</xsl:template>

<xsl:template match="proc/title">
  <h3></h3>
</xsl:template>

<xsl:template match="step">         <!--a step in a procedure-->
  <li></li>
</xsl:template>

</xsl:stylesheet>
