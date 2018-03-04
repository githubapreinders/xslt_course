<?xml version="1.0"?>
<!--
Exercise Worksheet - booknbr2.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">                    <!--root rule-->
  <html>
    <head><title><xsl:value-of select="/doc/title"/></title></head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="doc/title">        <!--title of the entire document-->
  <h1><xsl:apply-templates/></h1>
  <h3>Table of Contents</h3>
  <table summary="Table of Contents">
    <xsl:apply-templates select="/doc/chapter/title" mode="do-toc"/>
  </table>
</xsl:template>

<xsl:template match="chapter">          <!--each chapter separated with rule-->
  <hr/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chapter/title" mode="do-toc"><!--a chapter entry in toc-->
  <tr>
    <td align="right">
      <a href="#{generate-id(.)}"><xsl:number count="chapter" format="I"/></a>
    </td>
    <td align="left">
      <a href="#{generate-id(.)}"><xsl:apply-templates/></a>
    </td>
  </tr>
</xsl:template>

<xsl:template match="chapter/title">    <!--display of chapter's title-->
  <h2>
   <a name="{generate-id(.)}">
    <xsl:choose>                        <!--prefix title-->
      <xsl:when test="count(../preceding-sibling::chapter)=0">
        <xsl:text>First </xsl:text>
      </xsl:when>
      <xsl:when test="count(../following-sibling::chapter)=0">
        <xsl:text>Last </xsl:text>
      </xsl:when>
      <xsl:otherwise>Middle </xsl:otherwise>
    </xsl:choose>
    <xsl:text>Chapter </xsl:text>
    <xsl:number count="chapter" format="I"/>: <xsl:apply-templates/>
   </a>
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

<xsl:template match="para/fig" name="do-a-figure">
  <img src="{@filename}" alt="{@filename}"/>
</xsl:template>

<xsl:template match="fig">
  <center><xsl:call-template name="do-a-figure"/></center>
</xsl:template>

</xsl:stylesheet>
