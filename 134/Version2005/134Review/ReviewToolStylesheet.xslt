<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- xmlns:xsl="http://www.w3.org/1999/XSL/Transform" for IE6+ -->
  <!-- xmlns:xsl="http://www.w3.org/TR/WD-xsl" for IE5.x -->
 <xsl:import href="InsertChapterQuestions.xslt"/>
 <xsl:output method="html" indent="yes"/>
 <xsl:param name="Chapter"/>
 <xsl:param name="Question"/>
 <xsl:template match="/">
  <table cellpadding="0" cellspacing="0">
   <tbody>
    <tr align="center">
     <td class="color3" colspan="99">
      <br/>
      <xsl:apply-templates select="/ReviewTool" mode="buildWelcomeString"/>
     </td>
    </tr>
    <tr>
     <td bgcolor="#3E458B" height="1px" colspan="99">
      <hr size="1px" width="100%" style="color:white;"/>
     </td>
    </tr>
   </tbody>
  </table>
  <!-- end of top table -->
  <table width="100%" bgcolor="white" cellpadding="0" cellspacing="0" style="border: 2px solid #3E458B;">
   <!-- dotted, groove, dashed or solid -->
   <!-- master content table -->
   <tbody>
    <tr style="border-top: hidden;" valign="top">
     <td class="color3" width="200px" colspan="1" height="500px">
      <!-- Navigation bar -->
      <xsl:apply-templates select="/ReviewTool" mode="buildLeftNavBar"/>
     </td>
     <!-- Content -->
     <td bgcolor="white" colspan="99" height="500px" rowspan="99" valign="top" width="85%" >
      <xsl:call-template name="buildChapterQuestions">
       <xsl:with-param name="chapterNumber" select="/ReviewTool/Chapter[@number = $Chapter]/@number"/>
       <xsl:with-param name="questionNumber" select="/ReviewTool/Chapter/Questions/Question[@questionNumber = $Question]/@questionNumber"/>
      </xsl:call-template>
     </td>
    </tr>
   </tbody>
  </table>
  <table bgcolor="white" width="100%">
   <!-- closing table -->
   <tbody>
    <tr>
     <td align="center">
      <br/>
      <i class="color1">Written by Scott Whigham, July, 2006, Version 2.0</i>
     </td>
    </tr>
   </tbody>
  </table>
 </xsl:template>
 
 
 <xsl:template match="/ReviewTool" mode="buildWelcomeString">
    <span class="color2" style="font-size: large; font-weight: bold;">Welcome to the <xsl:value-of select="@courseNumber"/>  
    - &quot;<xsl:value-of select="@courseTitle"/>&quot; Review Tool!</span>
    <br></br>
    N.B. - Many questions may seem to have more than one correct answer; please choose the most correct answer!
 <br></br><br></br>
 </xsl:template> 
 
 <xsl:template match="/ReviewTool" mode="buildLeftNavBar">
   <!-- Left Navigation Bar -->
   <table width="100px" cellpadding="3" cellspacing="5" align="left" class="color3">
    <tbody>
     <xsl:for-each select="Chapter">
      <tr>
       <td width="100%" height="40px">
         <a class="color3" style="font-weight: bold;">
           <xsl:attribute name="href">
               <xsl:text>134Review.htm?Chapter=</xsl:text>
               <xsl:value-of select="@number"/>
               <xsl:text>&amp;Question=1</xsl:text>
             </xsl:attribute>
             Chapter <xsl:value-of select="@number"/>
         </a>
       </td>
      </tr>
     </xsl:for-each>
    </tbody>
   </table>
 </xsl:template>
</xsl:stylesheet>
