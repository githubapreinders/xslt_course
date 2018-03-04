<?xml version="1.0"?><!--prod-wml.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-system="http://CRANE/wml13.dtd"/>

<xsl:template match="/">              <!--root rule-->
  <wml><card title="Record of Sales"> <!--index card-->
        <p><em>Record of Sales</em></p>
        <p><select name="cards">
             <xsl:apply-templates mode="head" 
                  select="/sales/record/cust"/>
           </select></p></card>
   <xsl:apply-templates select="/sales/record/cust"/>
  </wml></xsl:template>

<xsl:template match="cust" mode="head"><!--index entry-->
  <option onpick="#{@num}">
    <xsl:text/>Customer <xsl:value-of select="@num"/>
  </option></xsl:template>

<xsl:template match="cust"><!--customer's card in deck-->
 <card id="{@num}" title="Customer {@num}">
  <p><em><xsl:value-of select="@num"/></em></p>
  <p>Items: <xsl:value-of select="count(prodsale)"/></p>
  <p>Total: <xsl:value-of select="sum(prodsale)"/></p>
  <xsl:apply-templates/></card></xsl:template>

<xsl:template match="prodsale"><!--proc for each sale-->
  <p><xsl:value-of select="id(@idref)"/> <!--indirect-->
     <xsl:text> - </xsl:text>
     <xsl:value-of select="."/></p></xsl:template>

</xsl:stylesheet>
