<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:b="http://www.topografix.com/GPX/1/0" >
<xsl:output method="text" encoding="iso-8859-1" />
<xsl:template match="/">

  <xsl:comment>
  
  GPX é um padrão XML para troca de dados de GPS especificado em 
  "http://www.topografix.com/gpx.asp"
  
  Esta folha de estilo extrai WayPoints de um arquivo GPX, criando um arquivo texto
  com um WayPoint por linha separados por "|", forma para ser usada pelo TabWin para
  adicionar registros em um DBF criado com a estrutura abaixo:
  
  CREATE TABLE WAYPOINTS (
     NOME       CHAR(20),
     LATITUDE   NUMERIC(10,6),
     LONGITUDE  NUMERIC(10,6),
     COMENTARIO CHAR(40));
     
  </xsl:comment>
    
  <xsl:for-each select="b:gpx/b:wpt">
    <xsl:value-of select="b:name" /><xsl:text>|</xsl:text>
    <xsl:value-of select="@lat"   /><xsl:text>|</xsl:text>
    <xsl:value-of select="@lon"   /><xsl:text>|</xsl:text>
    <xsl:value-of select="b:cmt"  /><xsl:text>&#13;&#10;</xsl:text>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
