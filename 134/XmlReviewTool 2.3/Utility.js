function isThisCorrect (chosenAnswer, actualAnswer) {
  if (chosenAnswer == actualAnswer)
     loadRandomCorrectMessage();
  else {
	loadRandomWrongMessage();
//	alert(actualAnswer);
  };
}

function getDifferentQuestion (chapterNumber, questionNumber) {
  window.location="140ReviewTool.htm?Chapter=" + chapterNumber + "&Question=" + questionNumber + "";
}

// detect MSXML version
function sniff(){
	 var xml = "<?xml version=\"1.0\" encoding=\"UTF-16\"?><cjb></cjb>";
	 var xsl = "<?xml version=\"1.0\" encoding=\"UTF-16\"?><x:stylesheet version=\"1.0\" xmlns:x=\"http://www.w3.org/1999/XSL/Transform\" xmlns:m=	\"urn:schemas-microsoft-com:xslt\"><x:template match=\"/\"><x:value-of select=\"system-property('m:version')\" /></x:template></x:stylesheet>";
	 //var xsl = "<?xml version=\"1.0\" encoding=\"UTF-16\"?><x:stylesheet version=\"1.0\" xmlns:x=\"http://www.w3.org/TR/WD-xsl\"></x:stylesheet>";

	 var x = null;

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument");
	     x.async = false;
	     if (x.loadXML(xml)){
	      sniffer.msxml2.checked = true;
	     }
	 }catch(e){
	  document.getElementById("msxml2reason").innerText = e.description;
	 }

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument.2.6");
	     x.async = false;
	     if (x.loadXML(xml))
	        sniffer.msxml2v26.checked = true;
	 }catch(e){document.getElementById("msxml2v26reason").innerText = e.description}

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument.3.0");
	     x.async = false;
	     if (x.loadXML(xml))
	        sniffer.msxml2v30.checked = true;
	 }catch(e){document.getElementById("msxml2v30reason").innerText = e.description}

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument.4.0");
	     x.async = false;
	     if (x.loadXML(xml))
	        sniffer.msxml2v40.checked = true;
	 }catch(e){document.getElementById("msxml2v40reason").innerText = e.description}

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument.5.0");
	     x.async = false;
	     if (x.loadXML(xml))
	        sniffer.msxml2v50.checked = true;
	 }catch(e){document.getElementById("msxml2v50reason").innerText = e.description}

	 try{
	     x = new ActiveXObject("Msxml2.DOMDocument.6.0");
	     x.async = false;
	     if (x.loadXML(xml))
	        sniffer.msxml2v60.checked = true;
	 }catch(e){document.getElementById("msxml2v60reason").innerText = e.description}
}

function loadRandomCorrectMessage () {
  message = new makeArray(10);
  message[0] = "Correct! You are amazing!";
  message[1] = "Right-o! How did you get so smart!?!?";
  message[2] = "Yes!!!!!";
  message[3] = "Pure genius!!! 100% correct!";
  message[4] = "You are correct!";
  message[5] = "Right! You're the smartest person in this room!";
  message[6] = "Absolutely correct - you deserve a raise!";
  message[7] = "Yes! You know this stuff *cold*!";
  message[8] = "Yes! Bill Gates could sure use you at Microsoft!";
  message[9] = "Correct! You know your stuff!";
  alert(message[rand(message.length)])
}

function loadRandomWrongMessage () {
  message = new makeArray(10);
  message[0] = "Well.. not *exactly*... Wanna try again?";
  message[1] = "I'm sorry, that is not correct.";
  message[2] = "It's close - but not the right answer";
  message[3] = "Ummm... no?";
  message[4] = "What? Are you just guessing? Try again!";
  message[5] = "No - but keep trying!";
  message[6] = "If  dogs had wings you're answer would be correct!";
  message[7] = "Unfortunately that is an incorrect reply. Perhaps you're answer was influenced by one of the following reasons: you didn't have enough sleep last night, you're thinking of something else, you are hungry, you want to go to Starbucks, you need to have some chocolate, your sister/brother/mother/father/best-friend is mad at you, you're mad at your sister/brother/mother/father/best-friend, your left sock is pulled too far up cutting off the blood supply to your left pinky toe and it's impairing your abililty to concentrate, you wanted to go see a funny movie last night but your friend/girlfriend/boyfriend/voice-in-your-head made you go see a horror movie and now it's upset your physche, the other people in the room won't stop staring at you (that's right - they're looking at you *right now*) and it's a distraction. \n\n Of course - maybe you actually *know* the answer and are embarrassed by how smart you are!";
  message[8] = "Did your finger slip? I only ask because I *know* you know the correct answer...";
  message[9] = "Your answer is to 'wrong answer' just as 'apple' is to 'fruit'.";
  alert(message[rand(message.length)])
}

function makeArray(len) {
 // used by the random message functions
 for (var i = 0; i < len; i++)
  this[i] = null;
 this.length = len;
}

function rand(n) {
 // used by the random message functions
 var now = new Date()
 var seed = now.getTime() % 0xffffffff

 seed = (0x015a4e35 * seed) % 0x7fffffff;
 return (seed >> 16) % n;
}