<?xml version="1.0"?><!--imgsamp-ent.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY dark-green "#004400">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           version="1.0"
           xmlns="http://www.w3.org/TR/REC-html40">

<xsl:output method="html"
         doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">                    <!-- root rule -->
  <html>
    <head><title>Image Sample</title></head>
    <body><xsl:apply-templates/></body>
  </html>
</xsl:template>

<xsl:template match="fig">
  <div style="font-size:10pt;text-align:center">
    <img src="{unparsed-entity-uri(@file)}" alt="{.}"/>
    <div>
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>

<xsl:template match="para">
  <div style="font-size:15pt;color=&dark-green;">
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>
