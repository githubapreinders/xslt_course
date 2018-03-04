<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:output method="html" version="4.01" indent="yes" encoding="UTF-8"/>
<xsl:output doctype-public="-//W3C//DTD HTML 4.01//EN"/>
<xsl:output doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>


<xsl:template match="/">                        
  <html><head><title>Record of Sales</title></head>
    <body><h2>Record of Sales</h2><br/>
    <table style="border: 1px solid orange">
    	<tr>
    		<th/>
    		<xsl:apply-templates select="/sales/products"/>	
    		<th>TOTAL</th>
    	</tr>
   		<xsl:apply-templates select="/sales/record"/>	
    </table>	
    </body>
  </html>
</xsl:template>


<xsl:template match="sales/products">
	<th style="border: 1px solid orange">
		<xsl:value-of select="product"/>
	</th>
</xsl:template>	



<xsl:template match="/sales/record">
	<xsl:for-each select="cust">
    	<tr>
    		<td><xsl:value-of select="@num"/></td>
    		<td>a</td>
    		<td>b</td>
    		<td>
    			c
    		</td>
    	</tr>
  		</xsl:for-each>
</xsl:template>


<xsl:template match="sales/record/prodsale">
	<xsl:for-each select=".">
    	<xsl:value-of select="sum(current())"/>
	</xsl:for-each>
</xsl:template>


















</xsl:stylesheet>
