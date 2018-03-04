<?xml version="1.0"?><!--groupx2flat2.xsl-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           xpath-default-namespace="http://www.w3.org/1999/xhtml"
           version="2.0">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">                         <!--root rule-->
  <result>
    <xsl:for-each-group select="/*/body/*"
                        group-starting-with="h1">
      <xsl:choose>   <!--check first member to see if in an h1-->
        <xsl:when test="not(self::h1)">        <!--not grouped-->
          <xsl:apply-templates select="current-group()"/>
        </xsl:when>
        <xsl:otherwise>                  <!--found an h1 group-->
          <group><title><xsl:apply-templates/></title>
            <xsl:for-each-group group-starting-with="h2"
                          select="current-group()[position()>1]">
              <xsl:choose>        <!--check to see if in an h2-->
                <xsl:when test="not(self::h2)"><!--not grouped-->
                  <xsl:apply-templates select="current-group()"/>
                </xsl:when>
                <xsl:otherwise>          <!--found an h2 group-->
                  <group><title><xsl:apply-templates/></title>
                    <xsl:apply-templates 
                         select="current-group()[position()>1]"/>
                  </group>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each-group>
          </group>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>
  </result>
</xsl:template>

<xsl:template match="*">    <!--strip namespaces from elements-->
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>