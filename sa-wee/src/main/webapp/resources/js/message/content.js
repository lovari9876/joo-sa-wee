/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});*/

$(".select_note").click(function(){
	var n_no = $(this).attr("id");
	console.log("n_no " + n_no);
	select_note(n_no);
});

$(document).ready(function() {

	$(".btn-receive").click(function() {
		var category = $(this).val(); // 클릭한 .btn 클래스의 value를 받아와 변수에 담는다

		// json 데이터 가져오기
		$.ajax({
			url : "/rest/message",
			type : "POST",
			cache : false,
			dataType : "json",
	
			success : function(data) {
				
				var tag = "";
				$.each(data, function(key, value) {
					
					if((category == value['M_NO']) && (value['N_BLIND'] != 2)){
						tag += '<div class="checkBox">';
						tag += '<input type="checkbox" name="chBox" class="chBox"';
						tag += 'data-NN="'+value['N_NO'] +'" />';
						tag += '</div>';
						tag += '<script>';
						tag += '$(".chBox").click(function() {';
						tag += '$("#allCheck").prop("checked", false);';
						tag += '});';
						tag += '</script>';
						tag += '<div class="chat_list active_chat">';
						tag += '<div class="chat_people">';
						tag += '<div class="chat_img">';
						tag += '<img src="images/bl_share/icons/login/wolf_logo.png">';
						tag += '</div>';
						tag += '<div class="chat_ib">';
						tag += '<h5>';
						tag += '<input class="select_note" type="button" id="' +value['N_NO'] + '" value="'+ value['N_TITLE'] +'"/>';
						tag += '<input name="n_no" class="n_no" type="hidden" value="'+  value['N_NO'] + '" />';
						tag += '<span class="chat_date">' + value['WRITTEN_DATE'] + '</span></h5>';
						tag += '<p>' + value['M2_NICK'] + '</p>';
						tag += '</div>';
						tag += '</div>';
						tag += '</div>';
						console.log("==");
					}
					
					$("#ajax_test").empty().append(tag);
				});
				
				$(".select_note").click(function(){
					var n_no = $(this).attr("id");
					console.log("n_no " + n_no);
					select_note(n_no);
				});
				// $(".select_note").click(function() 이 바깥 아래에 있으면 작동 x
				// ajax 비동기식이라 작동하면서 아래 코드와 함께 작동해서..!
				
			},
			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}		 
		});
	});
	
	$(".btn-send").click(function() {
		var category = $(this).val(); // 클릭한 .btn 클래스의 value를 받아와 변수에 담는다
	 	
		// json 데이터 가져오기
		$.ajax({
			url : "/rest/message",
			type : "POST",
			cache : false,
			dataType : "json",
	
			success : function(data) {
				
				// list 확인
				// console.log(list);
				// list.reverse();
				var tag = "";
				$.each(data, function(key, value) {
		
					if(category != value['M_NO'] && value['N_BLIND'] != 3){
						tag += '<div class="checkBox">';
						tag += '<input type="checkbox" name="chBox" class="chBox"';
						tag += 'data-NN="'+value['N_NO'] +'" />';
						tag += '</div>';
						tag += '<script>';
						tag += '$(".chBox").click(function() {';
						tag += '$("#allCheck").prop("checked", false);';
						tag += '});';
						tag += '</script>';
						tag += '<div class="chat_list active_chat">';
						tag += '<div class="chat_people">';
						tag += '<div class="chat_img">';
						tag += '<img src="images/bl_share/icons/login/wolf_logo.png">';
						tag += '</div>';
						tag += '<div class="chat_ib">';
						tag += '<h5>';
						tag += '<input class="select_note" type="button" id="' +value['N_NO'] + '" value="'+ value['N_TITLE'] +'"/>';
						tag += '<input name="n_no" class="n_no" type="hidden" value="'+  value['N_NO'] + '" />';
						tag += '<span class="chat_date">' + value['WRITTEN_DATE'] + '</span></h5>';
						tag += '<p>' + value['M1_NICK'] + '</p>';
						tag += '</div>';
						tag += '</div>';
						tag += '</div>';
						
						
						console.log("!=");
						
					}	
					
					$("#ajax_test").empty().append(tag);
				});
				
				$(".select_note").click(function(){
					var n_no = $(this).attr("id");
					console.log("n_no " + n_no);
					select_send_note(n_no);
				});
				// $(".select_note").click(function() 이 바깥 아래에 있으면 작동 x
				// ajax 비동기식이라 작동하면서 아래 코드와 함께 작동해서..!
				
				
			},
			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}		 
		});
	});
});


function select_note(n_no) {
	console.log("select_note");
	
	//var n_no = $(this).attr("id");
	// var n_no = $('[name="n_no"]').attr('class');
	//var n_no = $('.n_no').val();
	//console.log("n_no " + n_no);
			
	// json 데이터 가져오기
	$.ajax({
		url : "/rest/select_message?n_no="+n_no,
		type : "post",
		cache : false,
		data : {n_no : n_no},
		success : function(data) {
			
			var tag = '';
			
			tag += '<div class="msg_history tab_content">';
			tag += '<h5 class="text-center" id="one_n_title">'+ data['N_TITLE'] +'</h5>';
			tag += '<hr />';
			tag += '<p> 보낸 이 : '+ data['M2_NICK'];
			tag += '<span class="time_date" id="one_n_date">' + data['WRITTEN_DATE'] +'</span>';
			tag += '</p>';
			tag += '<hr />';
			tag += '<p id="one_n_content">'+ data['N_CONTENT'] + '</p>';
			tag += '</div>';
			
			$("#ajax_content").empty().append(tag);
			
		},
		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);
		}
	});
}

function select_send_note(n_no) {
	console.log("select_note");
	
	//var n_no = $(this).attr("id");
	// var n_no = $('[name="n_no"]').attr('class');
	//var n_no = $('.n_no').val();
	//console.log("n_no " + n_no);
			
	// json 데이터 가져오기
	$.ajax({
		url : "/rest/select_message?n_no="+n_no,
		type : "post",
		cache : false,
		data : {n_no : n_no},
		success : function(data) {
			
			var tag = '';
			
			tag += '<div class="msg_history tab_content">';
			tag += '<h5 class="text-center" id="one_n_title">'+ data['N_TITLE'] +'</h5>';
			tag += '<hr />';
			tag += '<p> 받은 이 : '+ data['M1_NICK'];
			tag += '<span class="time_date" id="one_n_date">' + data['WRITTEN_DATE'] +'</span>';
			tag += '</p>';
			tag += '<hr />';
			tag += '<p id="one_n_content">'+ data['N_CONTENT'] + '</p>';
			tag += '</div>';
			
			$("#ajax_content").empty().append(tag);
			
		},
		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);
		}
	});
}