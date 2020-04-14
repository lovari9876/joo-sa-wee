/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});*/
$(document).ready(function() {
	var category = $(this).val(); // 클릭한 .btn 클래스의 value를 받아와 변수에 담는다
	var list = [];
 	
	// json 데이터 가져오기
	$.ajax({
		url : "/rest/message",
		type : "post",
		cache : false,
		dataType : "json",

		success : function(data) {
			$.each(data, function(key, value) {
				// value 확인
				// console.log(value); 
				list.push([value.N_NO, value.M_NO, value.M_NO2, value.N_TITLE, value.N_CONTENT, value.N_WRITTEN_DATE, value.N_CHECK, value.M1_NICK, value.M2_NICK, value.WRITTEN_DATE])
			});
			// list 확인
			// console.log(list);
			// list.reverse();
			
			var tag = "";
			$.each(list, function(key, value) {
				
				// ajax 값 확인하기
				console.log(value[0,0], value[0,1], value[0,2], value[0,3], value[0,4], value[0,5], value[0,6], value[0,7], value[0,8], value[0,9]);
				
				if(category == value[0,1]){
					tag += '<div class="chat_list active_chat">';
					tag += '<div class="chat_people">';
					tag += '<div class="chat_img">';
					tag += '<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">';
					tag += '</div>';
//					tag += '<input id="n_no" type="hidden" value="' + value[0,0] + '" />';
					tag += '<div class="chat_ib">';
					tag += '<h5><input type="button" onclick="select_note()" value="'+ value[0,3]+'"/>';
					tag += '<input name="n_no" class="n_no" type="hidden" value="'+  value[0,0] + '" />';
					tag += '<span class="chat_date">' + value[0,9] + '</span></h5>';
					tag += '<p>' + value[0,8] + '</p>';
					tag += '</div>';
					tag += '</div>';
					tag += '</div>';
					
				}else if(category == ""){
					tag += '<div class="chat_list active_chat">';
					tag += '<div class="chat_people">';
					tag += '<div class="chat_img">';
					tag += '<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">';
					tag += '</div>';
//					tag += '<input id="n_no" type="hidden" value="' + value[0,0] + '" />';
					tag += '<div class="chat_ib">';
					tag += '<h5><input type="button" onclick="select_note()" value="'+ value[0,3]+'"/>';
					tag += '<input name="n_no" class="n_no" type="hidden" value="'+  value[0,0] + '" />';
					tag += '<span class="chat_date">' + value[0,9] + '</span></h5>';
					tag += '<p>' + value[0,8] + '</p>';
					tag += '</div>';
					tag += '</div>';
					tag += '</div>';
					
				}
				
//				if(category == value[0,1]){
//					tag += '<div class="chat_list active_chat">';
//					tag += '<div class="chat_people">';
//					tag += '<div class="chat_img">';
//					tag += '<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">';
//					tag += '</div>';
//					tag += '<input id="n_no" type="hidden" value="' + value[0,0] + '" />';
//					tag += '<div class="chat_ib">';
//					tag += '<h5><a href="#one_note" class="select_note">'+ value[0,3];
//					tag += '<input id="n_no" type="hidden" value="'+  value[0,0] + '" />';
//					tag += '</a> <p><span class="chat_date">' + value[0,9] + '" /></span></p></h5>';
//					tag += '<p>' + value[0,8] + '</p>';
//					tag += '</div>';
//					tag += '</div>';
//					tag += '</div>';
//					
//				}else if(category == ""){
//					tag += '<div class="chat_list active_chat">';
//					tag += '<div class="chat_people">';
//					tag += '<div class="chat_img">';
//					tag += '<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">';
//					tag += '</div>';
//					tag += '<input id="n_no" type="hidden" value="' + value[0,0] + '" />';
//					tag += '<div class="chat_ib">';
//					tag += '<h5><a class="select_note">'+ value[0,3];
//					tag += '<input id="n_no" type="hidden" value="'+  value[0,0] + '" />';
//					tag += '</a><span class="chat_date">' + value[0,9] + '</span></h5>';
//					tag += '<p>' + value[0,8] + '</p>';
//					tag += '</div>';
//					tag += '</div>';
//					tag += '</div>';
//				}

				$(".select_note").click(function(){
					console.log("select_note ");
					
					var n_no = value[0,0];
					// var n_no = $('.n_no').val();
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
								console.log(value);
						
								list.push([value.N_NO, value.M_NO, value.M_NO2, value.N_TITLE, value.N_CONTENT, value.N_WRITTEN_DATE, value.N_CHECK, value.M1_NICK, value.M2_NICK, value.WRITTEN_DATE]);
							});
										
							tag += '<div class="msg_history">';
							tag += '<div id="one_note">';
							tag += '<h5 class="text-center" id="one_n_title">'+ value[0,3] +'</h5>';
							tag += '<hr />';
							tag += '<p>'+ value[0,8];
							tag += '<span class="time_date" id="one_n_date">' + value[0,9] +'</span>';
							tag += '</p>';
							tag += '<hr />';
							tag += '<p id="one_n_content">'+ value[0,4] + '</p>';
							tag += '</div>';
							tag += '</div>';
							
							$("#ajax_content").empty().append(tag);
						},
						error : function(request, status, error) {
							console.log(request.responseText);
							console.log(error);
						}
					});
					
				});
			
				console.log(category);
				$("#ajax_test").empty().append(tag);
			});
		},
		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);
		}		 
		
	});
});

//function select_note() {
//	
//	console.log("select_note ");
//	
//	var n_no = $('.n_no').val();
//	// var n_no = $('[name="n_no"]').attr('class');
//	// var n_no = $('.n_no').val();
//	// var n_no = '<%=n_no%>'
//	console.log("n_no " + n_no);
//		
//	var list = [];
//	
//	// json 데이터 가져오기
//	$.ajax({
//		url : "/select_message",
//		type : "post",
//		cache : false,
//		data : {n_no : select_n_no},
//		contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
//		success : function(data) {
//			
//			$.each(data, function(key, value) {
//				console.log(value);
//		
//				list.push([value.N_NO, value.M_NO, value.M_NO2, value.N_TITLE, value.N_CONTENT, value.N_WRITTEN_DATE, value.N_CHECK, value.M1_NICK, value.M2_NICK, value.WRITTEN_DATE]);
//			});
//						
//			tag += '<div class="msg_history">';
//			tag += '<div id="one_note">';
//			tag += '<h5 class="text-center" id="one_n_title">'+ value[0,3] +'</h5>';
//			tag += '<hr />';
//			tag += '<p>'+ value[0,8];
//			tag += '<span class="time_date" id="one_n_date">' + value[0,9] +'</span>';
//			tag += '</p>';
//			tag += '<hr />';
//			tag += '<p id="one_n_content">'+ value[0,4] + '</p>';
//			tag += '</div>';
//			tag += '</div>';
//			
//			$("#ajax_content").empty().append(tag);
//		},
//		error : function(request, status, error) {
//			console.log(request.responseText);
//			console.log(error);
//		}
//	});
//}	

/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});*/
$(document).ready(function() {

	$(".btn-receive").click(function() {
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
					if(category == value['M_NO']){
						tag += '<div class="checkBox">';
						tag += '<input type="checkbox" name="chBox" class="chBox"';
						tag += 'data-cartNum="'+value['N_NO'] +'" />';
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
						tag += '<a href="/rest/message?n_no='+value['N_NO'] +'">'+ value['N_TITLE'];
						tag += '</a><span class="chat_date">' + value['WRITTEN_DATE'] + '</span></h5>';
						tag += '<p>' + value['M2_NICK'] + '</p>';
						tag += '</div>';
						tag += '</div>';
						tag += '</div>';
						console.log("==");
					}	
					$("#ajax_test").empty().append(tag);
				});
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
			type : "get",
			cache : false,
			dataType : "json",
	
			success : function(data) {
				
				// list 확인
				// console.log(list);
				// list.reverse();
				var tag = "";
				$.each(data, function(key, value) {
					
					if(category != value['M_NO']){
						tag += '<div class="checkBox">';
						tag += '<input type="checkbox" name="chBox" class="chBox"';
						tag += 'data-cartNum="'+value['N_NO'] +'" />';
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
						tag += '<a href="/rest/message?n_no='+value['N_NO'] +'">'+ value['N_TITLE'];
						tag += '</a><span class="chat_date">' + value['WRITTEN_DATE'] + '</span></h5>';
						tag += '<p>' + value['M2_NICK'] + '</p>';
						tag += '</div>';
						tag += '</div>';
						tag += '</div>';
						console.log("!=");
						
					}			
					
					
					
					$("#ajax_test").empty().append(tag);
				});
			},
			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}		 
		});
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