$(document).ready(function(){
	
	//var preurl = decodeURI(decodeURIComponent(document.location.href));
	var preurl = document.referrer;
	console.log(preurl);
	
	var para = preurl.split("/");
	console.log(para);
});