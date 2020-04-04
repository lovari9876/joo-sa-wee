/*
 * change-view 
 * 보부상에서 버튼 누르면 masonry view에서 table list view로 바뀌게 하는 js
 */

$(document).ready(function(){
	
    //When page loads...
    $(".view--content").hide(); //Hide all content
    $("#view-btn").addClass("active").show(); //Activate first
    $(".view--content:first").show();
	
	$("#view-btn").click(function(){
		var list = 'fa fa-bars';
		var square = 'fas fa-th-large';
		  
		// 버튼 바꾸기
		// if문 없이도 toggleClass() 함수가 자동으로 바꿔준다..
		$("#view-btn i").toggleClass(square);
		
		$(".view--content").hide();
		
		if($("#view-btn i").attr('class')==list) {
			$("#view1").show(); // masonry 뷰 보여준다.
		}else {
			$("#view2").show(); // 테이블 뷰 보여준다.
		}	
		
        return false;
	});		  
});

/* 
// 1. 객체를 가져온다.

// 1-1. 클래스로 가져오기
var element = $(".elementClass");
// 1-2. 아이디로 가져오기
element = $("#elementId");
// 1-1. 이름으로 가져오기
element = $('input[name="elementName"]');
 
 
// 2. 객체에서 원하는걸 얻는다.
 
// 2-1. 아이디
var elementId = element.attr('id');
// 2-2. 이름
var elementName = element.attr('name');
// 2-3. 클래스 이름
var elementClass = element.attr('class');
*/
