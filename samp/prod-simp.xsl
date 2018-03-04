<?xml version="1.0"?><!--prod-simp.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="1.0">
 <head><title>Product Sales Summary</title></head>
 <body><h2>Product Sales Summary</h2>
  <table summary="Product Sales Summary" border="1">
                                       <!--list products-->
   <tr align="center"><th/>
    <xsl:for-each select="//product">
     <th><b><xsl:value-of select="."/></b></th>
    </xsl:for-each></tr>
                                      <!--list customers-->
   <xsl:for-each select="/sales/record/cust">
    <xsl:variable name="customer" select="."/>
    <tr align="right">
     <td><xsl:value-of select="@num"/></td>
     <xsl:for-each select="//product">  <!--each product-->
      <td><xsl:value-of select="$customer/prodsale
                                [@idref=current()/@id]"/>
      </td></xsl:for-each>
    </tr></xsl:for-each>
                                           <!--summarize-->
   <tr align="right"><td><b>Totals:</b></td>
    <xsl:for-each select="//product">
     <xsl:variable name="pid" select="@id"/>
     <td><i><xsl:value-of
                select="sum(//prodsale[@idref=$pid])"/></i>
     </td></xsl:for-each></tr>
  </table>
 </body></html>
