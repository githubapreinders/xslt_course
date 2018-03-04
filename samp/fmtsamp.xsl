<?xml version="1.0"?><!--fmtsamp.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/XSL/Format"
                version="1.0">
<xsl:output method="xml"/>

<xsl:param name="font-size" select="'20pt'"/>

<xsl:template match="/">   <!--put all on in one page sequence-->
  <root><layout-master-set>
    <simple-page-master master-name="crane"
                        margin-top=".5in" margin-bottom=".5in"
                        margin-left=".75in" margin-right=".75in"
                        page-width="8.5in" page-height="11in">
     <region-body region-name="crane-content"/>
    </simple-page-master></layout-master-set>
    <page-sequence master-reference="crane">
     <flow flow-name="crane-content" font-size="{$font-size}">
       <xsl:apply-templates/>
     </flow></page-sequence></root></xsl:template>

<xsl:template match="para">           <!--a standard paragraph-->
  <block space-before.optimum="{$font-size}">
    <xsl:apply-templates/></block></xsl:template>

<xsl:template match="emph">     <!--emphasize some information-->
  <inline font-weight="bold">
    <xsl:apply-templates/></inline></xsl:template>

</xsl:stylesheet>