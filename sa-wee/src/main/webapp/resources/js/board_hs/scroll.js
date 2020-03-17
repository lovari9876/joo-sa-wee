$(document).ready(function(){
	
	$(window).scroll(function(){
		
		var scroll = $(window).scrollTop();
		
		if(scroll >= 1){
			$(".header-warp").addClass("header-wrap-style");
		}else{
			$(".header-warp").removeClass("header-wrap-style");
		}
	})
})