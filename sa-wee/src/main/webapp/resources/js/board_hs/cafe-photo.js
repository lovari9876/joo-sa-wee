$(document).ready(function(){
	
	
	"use strict"
	
	$(".carousel").each(function(i) {
	    var $this = $(this);
	    $this.find(" div.carousel-item").each(function(i) {
	        var $self = $(this);
	        $self.css("background-image", 'url("' + $self.data("img") + '")');
	    });
	    $this.carousel();
	});

});