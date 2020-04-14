$(document).ready(function(){
	
	var url = decodeURI(decodeURIComponent(document.location.href));
	console.log(url);
	var para = url.split("?");
	console.log(para[1]);	//s_content = 어쩌구 뜸
	var check = para[1];
	//var current = $('.tab li).val('잡담');
	
	
	if(check == 's_content=잡담'){
		$('.tab li').removeClass('current');
		$('#잡담').addClass('current');
	}else if(check == 's_content=노하우'){
		$('.tab li').removeClass('current');
		$('#노하우').addClass('current');
	}else if(check == 's_content=토론'){
		$('.tab li').removeClass('current');
		$('#토론').addClass('current');
	}else if(check == 's_content=개봉기'){
		$('.tab li').removeClass('current');
		$('#개봉기').addClass('current');
	}else if(check == 's_content=일 리뷰'){
		$('.tab li').removeClass('current');
		$('#일리뷰').addClass('current');
	}else if(check == 's_content=다 리뷰'){
		$('.tab li').removeClass('current');
		$('#다리뷰').addClass('current');
	}else if(check == 's_content=모집'){
		$('.tab li').removeClass('current');
		$('#모집').addClass('current');
	}else if(check == 's_content=모임후기'){
		$('.tab li').removeClass('current');
		$('#모임후기').addClass('current');
	}else if(check == 's_content=이벤트'){
		$('.tab li').removeClass('current');
		$('#이벤트').addClass('current');
	}else if(check == 's_content=대회'){
		$('.tab li').removeClass('current');
		$('#대회').addClass('current');
	}else if(check == 's_content=신작 소식'){
		$('.tab li').removeClass('current');
		$('#신작소식').addClass('current');
	}else if(check == 's_content=세일'){
		$('.tab li').removeClass('current');
		$('#세일').addClass('current');
	}else if(check == 's_content=기타'){
		$('.tab li').removeClass('current');
		$('#기타').addClass('current');
	}else if(check == 's_content=룰'){
		$('.tab li').removeClass('current');
		$('#룰').addClass('current');
	}else if(check == 's_content=추천'){
		$('.tab li').removeClass('current');
		$('#추천').addClass('current');
	}else if(check == 's_content=계획'){
		$('.tab li').removeClass('current');
		$('#계획').addClass('current');
	}else if(check == 's_content=디자인'){
		$('.tab li').removeClass('current');
		$('#디자인').addClass('current');
	}else if(check == 's_content=완성'){
		$('.tab li').removeClass('current');
		$('#완성').addClass('current');
	}else if(check == 's_content=공유'){
		$('.tab li').removeClass('current');
		$('#공유').addClass('current');
	}else if(check == 's_content=테스트플레이'){
		$('.tab li').removeClass('current');
		$('#테스트플레이').addClass('current');
	}else if(check == 's_content=27'){
		$('.tab li').removeClass('current');
		$('#27').addClass('current');
	}else if(check == 's_content=28'){
		$('.tab li').removeClass('current');
		$('#28').addClass('current');
	}else if(check == 's_content=29'){
		$('.tab li').removeClass('current');
		$('#29').addClass('current');
	}else if(check == 's_content=30'){
		$('.tab li').removeClass('current');
		$('#30').addClass('current');
	}else if(check == 's_content=31'){
		$('.tab li').removeClass('current');
		$('#31').addClass('current');
	}
	
	
	
	/*
	$('.tab li').click(function(){
		var activeTab = $(this).attr('data-tab');
		$('.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	
	})*/
});