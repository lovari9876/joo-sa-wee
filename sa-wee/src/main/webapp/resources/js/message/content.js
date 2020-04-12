/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});*/
$(document).ready(function() {
	var category = $(this).val(); // 클릭한 .btn 클래스의 value를 받아와 변수에 담는다
 	
	// json 데이터 가져오기
	$.ajax({
		url : "/rest/message",
		type : "get",
		cache : false,
		dataType : "json",

		success : function(data) {
			
			// list 확인
			// console.log(list);
			// list.reverse();
			var tag = "";
			$.each(data, function(key, value) {
				
				tag += '<div class="chat_list active_chat">';
				tag += '<div class="chat_people">';
				tag += '<div class="chat_img">';
				tag += '<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">';
				tag += '</div>';
//				tag += '<input id="n_no" type="hidden" value="' + value['N_NO'] + '" />';
				tag += '<div class="chat_ib">';
				tag += '<h5><a href="/rest/message?n_no='+value['N_NO'] +'">'+ value['N_TITLE'];
				tag += '</a><span class="chat_date">' + value['WRITTEN_DATE'] + '</span></h5>';
				tag += '<p>' + value['M2_NICK'] + '</p>';
				tag += '</div>';
				tag += '</div>';
				tag += '</div>';
				
				$("#ajax_test").empty().append(tag);
				console.log(value['N_NO']);
			});
			console.log(category);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);
		}		 
	});
});

function select_note() {
	console.log("select_note ");
	
	var n_no = $('.n_no').attr('name');
	// var n_no = $('[name="n_no"]').attr('class');
	// var n_no = $('.n_no').val();
	// var n_no = '<%=n_no%>'
	console.log("n_no " + n_no);
		
	var list = [];
	
	// json 데이터 가져오기
	$.ajax({
		url : "/select_message",
		type : "post",
		cache : false,
		data : {n_no : select_n_no},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		success : function(data) {
			
			$.each(data, function(key, value) {
						
				tag += '<div class="msg_history">';
				tag += '<div id="one_note">';
				tag += '<h5 class="text-center" id="one_n_title">'+ value['N_TITLE'] +'</h5>';
				tag += '<hr />';
				tag += '<p>'+ value['M2_NICK'];
				tag += '<span class="time_date" id="one_n_date">' + value['WRITTEN_DATE'] +'</span>';
				tag += '</p>';
				tag += '<hr />';
				tag += '<p id="one_n_content">'+ value['N_CONTENT'] + '</p>';
				tag += '</div>';
				tag += '</div>';
				
				$("#ajax_content").empty().append(tag);
			});
		},
		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);
		}
	});
}	