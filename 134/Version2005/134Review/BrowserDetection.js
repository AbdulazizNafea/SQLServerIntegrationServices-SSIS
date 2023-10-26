function getBrowserVersion() {
  try {
   var browser = "";
   if (navigator.appVersion.indexOf('MSIE 5')>0) {browser='MSIE5';}
   if (navigator.appVersion.indexOf('MSIE 6')>0) {browser='MSIE6';}
   if (navigator.appVersion.indexOf('MSIE 7')>0) {browser='MSIE7';}

   // Good browsers:
   if (browser=='MSIE5' || browser=='MSIE6' || browser=='MSIE7') { }
   else {window.location='WrongBrowserOrUnsupportedMSXML.htm'}
  }

  catch(e) {
     alert ("An unknown browser was encountered; please review the following page for more info");
     window.location='WrongBrowserOrUnsupportedMSXML.htm'
  }
}