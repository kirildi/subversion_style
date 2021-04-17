<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" doctype-system="about:legacy-compat" />

  <xsl:template match="*" />

  <xsl:template match="svn">
    <html>
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/svnstyle.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <title>SVN</title>
      </head>
      <body>
        <div class="svn-wrapper">
          <xsl:apply-templates select="index" />
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="index">
    <div class="header">
      <div class="rev">
        <xsl:if test="string-length(@name) != 0">
          <xsl:value-of select="@name" />
          <xsl:if test="string-length(@rev) != 0">
            <xsl:text></xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:if test="string-length(@rev) != 0">
          <xsl:text>Revision </xsl:text>
          <xsl:value-of select="@rev" />
        </xsl:if>
      </div>
      <div class="credits">
        <xsl:text>Powered by </xsl:text>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="@href" />
          </xsl:attribute>
          <xsl:text>Subversion</xsl:text>
        </xsl:element>
        <xsl:text></xsl:text>
        <xsl:value-of select="@version" />
      </div>
    </div>
    <div class="path">
      <xsl:text>Path: </xsl:text>
      <xsl:value-of select="@path" />
    </div>

    <div class="svn-content">
      <xsl:apply-templates select="updir" />
      <xsl:apply-templates select="dir" />
      <xsl:apply-templates select="file" />
    </div>

  </xsl:template>

  <xsl:template match="updir">
    <div class="updir">
      <xsl:text>[</xsl:text>
      <xsl:element name="a">
        <xsl:attribute name="href">..</xsl:attribute>
        <xsl:text>Go Back -> parent dir </xsl:text>
      </xsl:element>
      <xsl:text>]</xsl:text>
    </div>
    <!-- xsl:apply-templates/ -->
  </xsl:template>
  <xsl:template match="dir">
    <div class="dir">
      <span class="material-icons-outlined icons">folder </span>
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="@href" />
        </xsl:attribute>
        <xsl:value-of select="@name" />
        <xsl:text>/</xsl:text>
      </xsl:element>
    </div>
    <!-- <xsl:apply-templates/ -->
  </xsl:template>
  <xsl:template match="file">
    <div class="file">
      <span class="material-icons-outlined icons">description </span>
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="@href" />
        </xsl:attribute>
        <xsl:value-of select="@name" />
      </xsl:element>
    </div>
    <!-- xsl:apply-templates/ -->
  </xsl:template>

</xsl:stylesheet>
