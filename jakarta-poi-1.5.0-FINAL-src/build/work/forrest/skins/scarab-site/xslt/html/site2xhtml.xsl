<?xml version="1.0"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:NetUtils="org.apache.cocoon.util.NetUtils"
    version="1.0">

<xsl:template match="/">
  <html>
    <head>
      <title><xsl:value-of select="/site/document/title"/></title>
      <style type="text/css">
      @import url("skin/ns4_toxins.css");
      </style>
      <link rel="stylesheet" type="text/css" href="$relativePath/style/main.css" />
      <link rel="stylesheet" type="text/css" href="$relativePath/style/print.css" media="print" />

      #foreach( $n in $node.properties.selectNodes("author") )
        <meta name="author" value="$n"/>
        <meta name="email" value="$n.attribute("email")" />
      #end

    </head>


<html>
 <head>
 
  <title><xsl:value-of select="/site/document/title"/></title>

  <link rel="stylesheet" type="text/css" href="skin/ns4_toxins.css" />
  <link rel="stylesheet" type="text/css" href="skin/main.css" />
  <link rel="stylesheet" type="text/css" href="skin/print.css" media="print" />
  <link rel="alternate stylesheet" title="compact" type="text/css" href="skin/compact.css" />
  
 </head>


  <body marginwidth="0" marginheight="0">

  <div id="banner">
    <table border="0" cellspacing="0" cellpadding="8" width="100%">
      <tr>
       <td>
         <a href="http://jakarta.apache.org"><img src="images/group-logo.gif" border="0" vspace="0" hspace="0"/></a>
       </td>
  
       <td>
         <div align="right"><a href="http://jakarta.apache.org/poi/"><img src="images/project-logo.gif" border="0" vspace="0" hspace="0"/></a></div>

       </td>
      </tr>
    </table>
   </div>

   <div class="modbar">
     <small><strong>
      <a href="http://www.apache.org/" class="black">apache &#160;&gt;&#160;</a>
      <a href="http://jakarta.apache.org/" class="black">jakarta &#160;&gt;&#160;</a>
      <a href="http://jakarta.apache.org/poi/" class="black">POI</a>            
      </strong></small>
   </div>



<table border="0" cellspacing="0" cellpadding="8" width="98%" id="main">
 <tr valign="top">
 
 

  <td id="leftcol" width="20%">
     <xsl:copy-of select="/site/menu/node()|@*"/>
  </td>

<td width="100%" id="bodycol">

<div id="topmodule">

  <table border="0" cellspacing="0" cellpadding="3" width="100%">
  <tr>
   <td nowrap="nowrap">
   
    <form onsubmit="q.value = query.value + ' site:jakarta.apache.org'" action="http://www.google.com/search" method="get">
      <input name="q" type="hidden"/>
      <input type="text" id="query" name="id" size="35" maxlength="255" />&#160;&#160;
      <input name="Search" value="Search" type="button"/>&#160;
        <img src="skin/images/seperator2.gif" width="2" height="15" alt="" border="0" />&#160;
      <input value="web" name="web" type="radio"/>web site&#160;<input value="mail" name="mail" type="radio"/>mail lists        
    </form>

   </td>
  </tr>
  </table>
</div>


          <xsl:copy-of select="/site/body/node()|@*"/>
</td>
</tr>
</table>


<div id="footer">
  <table border="0" cellspacing="0" cellpadding="4">
   <tr><td>
     <a href="http://www.apache.org/">Copyright &#x00A9; 2022 Apache Software Foundation. All Rights Reserved.</a>
   </td></tr>
        <tr>
          <td width="100%" align="right">
            <a href="http://krysalis.org/"><img src="skin/images/krysalis-compatible.jpg" border="0" alt="Krysalis Logo"/></a> 
            <a href="http://xml.apache.org/cocoon/"><img src="skin/images/built-with-cocoon.gif" border="0" alt="Cocoon Logo"/></a> 
            <a href="http://jakarta.apache.org/ant/"><img src="skin/images/ant_logo_medium.gif" border="0" alt="Ant Logo"/></a> 
          </td>
        </tr>   
  </table>
</div>

 </body>
</html>

</xsl:template>
</xsl:stylesheet>

