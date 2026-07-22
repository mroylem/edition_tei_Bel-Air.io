<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//teiHeader/fileDesc/titleStmt/title"/></title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <header class="main-header">
                    <div style="text-align: left; margin-bottom: 10px;">
                        <a href="index.html" style="text-decoration: none; font-weight: bold; color: #333; border: 1px solid #333; padding: 5px 12px; border-radius: 4px; background: #fff;">← Accueil</a>
                    </div>
                    <h1>Procès-verbaux de la Commission Administrative de Bel-Air</h1>
                </header>
                <main>
                    
                    <xsl:for-each-group select="//body/*" group-starting-with="pb">
                        <div class="page-container">
                            
                            <div class="facsimile">
                                <div class="page-number">Page <xsl:value-of select="current-group()[self::pb]/@n"/></div>
                                <img src="Transcription_Bel_Air_1907-1916_p183-185/{current-group()[self::pb]/@facs}" alt="Page {current-group()[self::pb]/@n}"/>
                            </div>
                            
                            
                            <div class="transcription">
                                <xsl:apply-templates select="current-group()[not(self::pb)]"/>
                            </div>
                        </div>
                    </xsl:for-each-group>
                </main>
            </body>
        </html>
    </xsl:template>
    
   
    <xsl:template match="div">
        <div class="session-block">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="head">
        <h2 class="session-title"><xsl:apply-templates/></h2>
    </xsl:template>
    
    
    <xsl:template match="p">
        <div class="para"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="label">
        <span class="margin-left"><xsl:apply-templates/></span>
    </xsl:template>
    
   
    <xsl:template match="lb">
        <xsl:choose>
            
            <xsl:when test="ancestor::table"/>
            
            <xsl:when test="preceding-sibling::*[1][self::label]"/>
           
            <xsl:otherwise>
                <br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
  
    <xsl:template match="milestone">
        <hr class="{@rend}"/>
    </xsl:template>
    
  
    <xsl:template match="hi[@rend='underline']">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <!-- Tableaux de calcul -->
    <xsl:template match="table">
        <table class="{@rend}">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="row">
        <tr class="{@rend}"><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="cell">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    
   
    <xsl:template match="closer">
        <div class="closer"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="persName | placeName">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>