<?xml version="1.0"?><!--invert-parm.xsl-->
<!--XSLT 1.0 - http://www.CraneSoftwrights.com/training -->
<!DOCTYPE xsl:stylesheet [<!ENTITY nl "&#xA;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output omit-xml-declaration="yes"/>

<xsl:template match="/">
  <result>
  <xsl:text>&nl;Non-inverted Structure (translated):</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&nl;Inverted Structure:&nl;</xsl:text>
            <!-- start from the test node that has no children-->
  <xsl:apply-templates mode="walk-up" select="//test[not(test)]">
                             <!--illustrate difference between
                           result tree fragments and node sets-->
    <xsl:with-param name="middle-rtf">
      <xsl:apply-templates select="//test[not(test)]/*"/>
    </xsl:with-param>
    <xsl:with-param name="middle-node" 
                    select="//test[not(test)]/*"/>
  </xsl:apply-templates>
  <xsl:text>&nl;</xsl:text>
  </result></xsl:template>

<xsl:template match="test">          <!--walking down the tree-->
  <xsl:text>&nl;{test</xsl:text>
  <xsl:call-template name="showattrs"/>         <!--echo attrs-->
  <xsl:text>}</xsl:text>
  <xsl:apply-templates select="*"/>  <!--walk down to children-->
  <xsl:text>{/test</xsl:text>
  <xsl:call-template name="showattrs"/>         <!--echo attrs-->
  <xsl:text>}&nl;</xsl:text></xsl:template>

<xsl:template match="greeting">         <!--transform greeting-->
  <hello><xsl:apply-templates/></hello></xsl:template>


<xsl:template mode="walk-up" match="*"><!--walking up the tree-->
  <xsl:param name="middle-rtf"/>        <!--"called" variables-->
  <xsl:param name="middle-node"/>
                   <!--processing before the "subroutine call"-->
  <xsl:text>{/test</xsl:text>
  <xsl:call-template name="showattrs"/>         <!--echo attrs-->
  <xsl:text>}&nl;</xsl:text>
  <xsl:choose>
    <xsl:when test="parent::*">
                       <!--the pseudo "subroutine call" itself-->
     <xsl:apply-templates mode="walk-up" select="parent::*">
                                            <!--"calling" vars-->
       <xsl:with-param name="middle-rtf" select="$middle-rtf"/>
       <xsl:with-param name="middle-node" select="$middle-node"/>
     </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>     <!--illustrate both types of variables-->
     <xsl:copy-of select="$middle-rtf"/>     <!--tree fragment-->
     <xsl:text>&nl;</xsl:text>
     <xsl:copy-of select="$middle-node"/>         <!--node set-->
    </xsl:otherwise>
  </xsl:choose>
                    <!--processing after the "subroutine call"-->
  <xsl:text>&nl;{test</xsl:text>
  <xsl:call-template name="showattrs"/>         <!--echo attrs-->
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template name="showattrs">     <!--display the attributes-->
  <xsl:for-each select="@*">
    <xsl:text> </xsl:text>
    <xsl:value-of select="name(.)"/>="<xsl:value-of 
                  select="."/>"</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
