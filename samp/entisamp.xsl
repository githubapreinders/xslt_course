<?xml version="1.0"?><!--entisamp.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY Module-word "Module"> <!--teach=module, book=chapter-->
<!ENTITY Lesson-word "Lesson"> <!--teach=lesson, book=section-->
<!ENTITY nbsp "&#160;"> <!--known for HTML output, not in XML-->
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="html"/><!--use hardwired browser entities-->
<xsl:template match="/">                      <!-- root rule -->
  <xsl:for-each select="/course/module">
    <p>
      <xsl:text>&Module-word;:&nbsp;</xsl:text>
      <xsl:value-of select="title"/>
      <xsl:apply-templates select="lesson"/>
    </p>
  </xsl:for-each>
</xsl:template>
<!-- ... -->
<xsl:template match="lesson">
  <p>
    <xsl:text>&Lesson-word;:&nbsp;</xsl:text>
    <xsl:value-of select="title"/>
    <xsl:text> - &Module-word;:&nbsp;</xsl:text>
    <xsl:value-of select="../title"/>
  </p>
</xsl:template>
</xsl:stylesheet>
