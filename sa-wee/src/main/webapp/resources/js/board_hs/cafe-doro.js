$(document).ready(function(){
	
	
	"use strict"
	
	$(".mymenu li a").on('click', function(event){
		if(this.hash != ""){
			event.preventDefault();
			var hash = this.hash;
			$('html, body').animate({
				scrollTop : $(hash).offset().top - (-10)
			}, 600, function(){
				window.location.hash = hash;
			});
		}
	});
	
});