// This file shows how to load client side XML DOM and pass
// parameters to the XSLT so that you can sort on columns.
// keywords: xsl sort, xslt sorting, JavaScript sorting xml
function ApplyTransformation(strXMLFile, strXSLFile)
{
try {
 var xmlDoc = new ActiveXObject("MSXML2.DOMDocument.6.0");
 var xslDoc = new ActiveXObject("MSXML2.FreeThreadedDOMDocument.6.0");
 var template = new ActiveXObject("MSXML2.XSLTemplate.6.0");
 var processor;

 xslDoc.async = false;
 xslDoc.resolveExternals = true;
 xslDoc.setProperty("AllowDocumentFunction", true);
 xslDoc.setProperty("AllowXsltScript", true);

  xslDoc.load(strXSLFile);
 template.stylesheet = xslDoc;

 processor = template.createProcessor;
 // add parameters:
 var chapter = QueryString("Chapter")
 var question = QueryString("Question")

 if (chapter == null || chapter == "" || chapter == "0" || chapter == "NaN") { chapter = "1" }
 if (question == null || question == "" || question == "0" || question == "NaN") { question = "1"  }

 processor.addParameter("Chapter", chapter);
 processor.addParameter("Question", question);

 xmlDoc.async = false;
 xmlDoc.load(strXMLFile);

 processor.input = xmlDoc;
 processor.transform;
 // Depends on an ID tag (usually a <div> tag) named "TransformedXML"
 TransformedXML.innerHTML = processor.output;
  }

  catch(e) {
  	//window.location='WrongBrowserOrUnsupportedMSXML.htm'
  }
}

// These make it easier to parse/work with the query strings
// This is used on onLoad() to read which question/chapter to load
function QueryString(key)
{
 var value = null;
 for (var i=0;i<QueryString.keys.length;i++)
 {
  if (QueryString.keys[i]==key)
  {
   value = QueryString.values[i];
   break;
  }
 }
 return value;
}
QueryString.keys = new Array();
QueryString.values = new Array();

function QueryString_Parse()
{
 var query = window.location.search.substring(1);
 var pairs = query.split("&");

 for (var i=0;i<pairs.length;i++)
 {
  var pos = pairs[i].indexOf('=');
  if (pos >= 0)
  {
   var argname = pairs[i].substring(0,pos);
   var value = pairs[i].substring(pos+1);
   QueryString.keys[QueryString.keys.length] = argname;
   QueryString.values[QueryString.values.length] = value;
  }
 }
}

QueryString_Parse();