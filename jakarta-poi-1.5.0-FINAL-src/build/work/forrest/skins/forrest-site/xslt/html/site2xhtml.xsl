<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="site">
      <html>
         <head>
            <title>
               <xsl:value-of select="td/table/tr/td/h2" />
            </title>

            <link rel="stylesheet" href="skin/page.css" type="text/css" />
         </head>

         <body>
            <div class="path">
               <a href="#">path not implemented yet</a>
            </div>

            <table class="top" cellspacing="0" cellpadding="0" summary="top bar">
               <tr>
                  <td>
                     <a href="http://jakarta.apache.org">
                        <img src="images/group-logo.gif"/>
                     </a>
                  </td>

                  <td valign="middle" align="center" width="100%">
                     <a href="http://jakarta.apache.org/poi/">
                        <img src="images/project-logo.gif"/>
                     </a>
                  </td>

                  <td valign="top" height="69" nowrap="nowrap">
                     <div class="search">
                        <form method="get" action="http://www.google.com/search" onsubmit="q.value = query.value + ' site:xml.apache.org'">
                        <input type="hidden" name="q" />

                        <input type="text" id="query" size="15" />&#160;
                        <input type="button" value="Search" name="Search" />
                        <br />
                        <input type="radio" name="web" value="web">web site&#160;</input>&#160;
                        <input type="radio" name="mail" value="mail">mail lists</input>
                        </form>
                     </div>
                  </td>
               </tr>
            </table>

            <div class="tabs">
               <span class="tab">
                  <a href="#">tabs</a>
               </span>

               <span class="tab">
                  <a href="#">not</a>
               </span>

               <span class="tab">
                  <a href="#">implemented</a>
               </span>

               <span class="tab">
                  <a href="#">yet</a>
               </span>
            </div>
           
            <div class="topline">&#160;</div>

            <table cellspacing="0" cellpadding="0" summary="content pane">
               <tr>
                  <td width="5" class="navbar">&#160;</td>

                  <td rowspan="2" valign="top" nowrap="nowrap">
                     <xsl:apply-templates select="div[@class='menu']" />
                  </td>

                  <td valign="top" class="navbar" align="left">no chunking yet</td>

                  <td width="*" valign="top" class="navbar" align="right">
                     <a href="#">&lt;&lt; prev</a>

                     <strong>[x]</strong>

                     <a href="#">next &gt;&gt;</a>
                  </td>
               </tr>

               <tr>
                  <td>&#160;</td>

                  <xsl:apply-templates select="td[@class='content']" />
               </tr>

               <tr>
                  <td>&#160;</td>

                  <td>&#160;</td>
               </tr>
            </table>

            <div class="copyright">Copyright 2022 Apache Software Foundation. All Rights Reserved.</div>

            <a href="http://krysalis.org/">
               <img src="skin/images/krysalis-compatible.jpg" alt="Krysalis Logo" />
            </a>

            <a href="http://xml.apache.org/cocoon/">
               <img src="skin/images/built-with-cocoon.gif" alt="Cocoon Logo" />
            </a>

            <a href="http://jakarta.apache.org/ant/">
               <img src="skin/images/ant_logo_medium.gif" alt="Ant Logo" />
            </a>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="node()|@*" priority="-1">
      <xsl:copy>
         <xsl:apply-templates select="@*" />

         <xsl:apply-templates />
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>

