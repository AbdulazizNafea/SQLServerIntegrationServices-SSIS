<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" indent="yes" />
 <!-- caller passes in which chapter and which question -->
 <xsl:template name="buildChapterQuestions">
  <xsl:param name="chapterNumber"/>
  <xsl:param name="questionNumber"/>
  <xsl:choose>
   <!-- if there is text in the node, we want to process this chapter otherwise it means
     we want to display the Welcome message -->
   <xsl:when test="number($chapterNumber)">
   <!-- if this is a number, we want to process it; if it isn't a valid chapter number, we want to show the START text -->
    <table border="0" class="color1" align="center" width="80%" cellpadding="10" cellspacing="10">
     <tbody valign="top">
     
      <!-- Write out the Chapter number -->
      <tr valign="top" align="left">
       <td>
			<table width="100%" align="left">
					<tr>
						<td width="30%">
						  <span style="font-weight: bold; font-size: x-large;">Chapter: <xsl:value-of select="$chapterNumber"/></span>
						</td>
						<td width="70%">
						  <span style="font-weight: normal; font-size:x-small;">Questions: </span>
						  <!-- write out nav bar of this chapter's questions -->	
						    <xsl:for-each select="//Chapter[@number = $chapterNumber]/Questions/Question">
						    	<xsl:sort order="ascending" select="@questionNumber" data-type="number"/>
								<a class="color1" style="font-size: x-small;">
						           <xsl:attribute name="href">
						               <xsl:text>140ReviewTool.htm?Chapter=</xsl:text>
						               <xsl:value-of select="$chapterNumber"/>
						               <xsl:text>&amp;Question=</xsl:text>
						               <xsl:value-of select="@questionNumber"/>
						             </xsl:attribute>
						            <xsl:value-of select="@questionNumber"/>
						         </a><xsl:if test="not(position() = last())"> · </xsl:if><!-- don't display a dot after last question -->
					        </xsl:for-each>
						</td>
					</tr>
			</table>
        <hr/>
       </td>
      </tr>
      
      <!-- Put the question in -->
      <tr align="left" valign="middle">
       <td>
        <h3><xsl:value-of select="$questionNumber"/>: <xsl:value-of select="//Chapter[@number = $chapterNumber]/Questions/Question[@questionNumber = $questionNumber]/@questionText"/></h3>
       </td>
      </tr>
      
      <tr bgcolor="#DDDDDD">
       <td>
        <!-- We use a nested table here for formatting -->
        <table width="90%" cellpadding="5" border="1" cellspacing="2">
         <tbody>
          <!-- Loop through and display each answer -->
          <xsl:for-each select="//Chapter[@number = $chapterNumber]/Questions/Question[@questionNumber=$questionNumber]/Answers/Answer">
          <xsl:sort select="." data-type="text" order="ascending" /><!-- Sorts the Answers in ABCD format -->
          
          <tr valign="middle">
          
           <!-- The answer letter -->
           <td bgcolor="#EEEEEE" width="1%" >
            <font style="font-weight: bold;"><xsl:value-of select='@letter'/></font>
           </td>
           
           <!-- Checkboxes for answer -->
           <td bgcolor="#EEEEEE" width="1%">
            <!-- we have to put in the test now since we can't pass the value-of as parameters; XML doesn't allow for nested elements -->
            <form action="">
             <input type="radio">
              <xsl:attribute name="onclick">
                 <xsl:text>javascript:isThisCorrect('</xsl:text>
                 <xsl:value-of select="@letter"/>
                 <xsl:text>', '</xsl:text> 
                 <xsl:value-of select="../../@correctAnswer"/>
                 <xsl:text>');</xsl:text>
              </xsl:attribute>
             </input>
            </form>
           </td>
           
           <!-- Display answers -->
           <td bgcolor="#EEEEEE" width="80%">
            <xsl:value-of select="@textAnswer"/>
           </td>    
          </tr>
          </xsl:for-each>
        
         </tbody>
        </table>        

      </td>
     </tr>
     
     <!-- Build NEXT, etc buttons -->
     <!-- We need to find the max questionNumber -->
	    <!--
	    | assign variable based on picked the first item in
	    | the numerically-sorted-descending list of items.
	    -->
		<xsl:variable name="the_max">
		  <xsl:for-each select="//Chapter[@number = $chapterNumber]/Questions/Question[@questionNumber]">
		    <xsl:sort data-type="number" order="descending" select="@questionNumber"/>
		    <xsl:if test="position()=1"><xsl:value-of select="@questionNumber"/></xsl:if>
		  </xsl:for-each>
		</xsl:variable>	
        
     <tr>
      <td align="center">
       <form action="">
		   <xsl:choose>
			   <xsl:when test="$questionNumber&gt;1">
				   <input type="button" value="Previous" style="width: 75;" >
					   <xsl:attribute name="onclick">
						   <xsl:text>javascript:getDifferentQuestion('</xsl:text>
						   <xsl:value-of select="$chapterNumber"/>
						   <xsl:text>', '</xsl:text>
						   <xsl:choose>
							   <!-- start with question 1 -->
							   <xsl:when test="$questionNumber &lt;= 1">
								   <xsl:text>1</xsl:text>
							   </xsl:when>
							   <xsl:otherwise>
								   <xsl:value-of select="$questionNumber - 1"/>
							   </xsl:otherwise>
						   </xsl:choose>
						   <xsl:text>');</xsl:text>
					   </xsl:attribute>
				   </input>
			   </xsl:when>
		   </xsl:choose>

		   <b style="color:white;"> - </b>
		   <!-- cannot use &nbsp; here; disallowed entity-->
		   
			<xsl:choose>
			   <xsl:when test="$questionNumber &lt; $the_max">
				   <input type="button" value="Next" style="width: 75;">
					   <xsl:attribute name="onclick">
						   <xsl:text>javascript:getDifferentQuestion('</xsl:text>
						   <xsl:value-of select="$chapterNumber"/>
						   <xsl:text>', '</xsl:text>
						   <xsl:choose>
							   <!-- we don't want to go past the last questionNumber -->
							   <xsl:when test="$questionNumber >= $the_max">
								   <xsl:value-of select="$the_max"/>
								   <!-- end of the chapter -->
							   </xsl:when>
							   <xsl:otherwise>
								   <xsl:value-of select="$questionNumber + 1"/>
							   </xsl:otherwise>
						   </xsl:choose>
						   <xsl:text>');</xsl:text>
					   </xsl:attribute>
				   </input>
			   </xsl:when>
		   </xsl:choose>
       </form>
      </td>
     </tr>
     </tbody>
    </table>
   </xsl:when>
   
   <xsl:otherwise><!-- START text -->
    <br /><br />
    <p align="center">
      <font class="medium" style="font-weight: bold;">To get started, click on a chapter number on the left</font>
    </p>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>
