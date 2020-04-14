$("#allCheck").click(function() {
	var chk = $("#allCheck").prop("checked");
	if (chk) {
		$(".chBox").prop("checked", true);
	} else {
		$(".chBox").prop("checked", false);
	}
});

$(".chBox").click(function() {
	$("#allCheck").prop("checked", false);
});
		
$(".selectDelete_btn").click(function() {
	var checkArr = new Array();
	// var cate = $(this).val();
	
	$("input[class='chBox']:checked").each(function() {
		checkArr.push($(this).attr("data-NN"));
		
	});

	if (checkArr == "") {
		alert("게시글을 하나 이상 선택해주세요");
	}else{
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		if (confirm_val) {
			
			$.ajax({
				url : "/rest/delete_receive_message",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					if(result == 1) {          
						alert("삭제되었습니다.");
						location.href = "/message";
					} else {
					   alert("삭제 실패");
					}
				},
				error : function(request, status, error) {
					console.log(request.responseText);
					console.log(error);
				}
			});//ajax
		}
	}
});

$(".btn-receive").click(function() {
	$("#allCheck").prop("checked", false);
	
	$(".btn-receive.active").removeClass("active");
	$(".btn-send").addClass("active");
});

$(".btn-send").click(function() {
	$("#allCheck").prop("checked", false);										
	
	$(".btn-send.active").removeClass("active");
	$(".btn-receive").addClass("active");
	
});

// 첫번째 쪽지 보이게 하기, 다른 쪽지 누르면 없어지게 하기
$(document).ready(function() {

    $(".tab_content").hide(); //Hide all content
    $(".chat_ib .select_note_content:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content

    //On Click Event
    $(".chat_ib .select_note").click(function() {

        $(".chat_ib .select_note_content").removeClass("active"); //Remove any "active" class
/*       $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content
*/
    });

});
// null, 잘못된 값 체크
$(document).ready(function() {
	var pass = true;
	$(".check").click(function() {		
		if ($("#m_nick").val() == "") {
			//alert("닉네임을 입력해주세요.");
			$('#m_nick_check').text('닉네임을 입력해주세요.');	
			return false;
		}
		if ($("#n_title").val() == "") {
			//alert("제목을 입력해주세요.");
			$('#n_title_check').text('제목을 입력해주세요.');			
			return false;
		}
		if ($("#n_content").val() == "") {
			//alert("내용을 입력해주세요.");
			$('#n_title_check').text('내용을 입력해주세요.');
			return false;
		}
		if(!pass){
			console.log("실패");
		}
		if(pass){			
			$("#send_message-form").submit();
		}
		
	});
	
	$("#m_nick").blur(
			function() {
				var m_nick = $('#m_nick').val();
				$.ajax({
					url : '/nickCheck?m_nick=' + m_nick,
					type : 'post',
					success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : " + data);

						if (data == 0) {
							$("#m_nick_check").text("존재하지 않는 닉네임입니다.");
							pass = false;
						} else  {
							$("#m_nick_check").text(" ");
							pass = true;
						}					
					}
				});
			});
	$("#n_title").blur(function() {
		var n_title = $('#n_title').val();
		if (n_title != "") {
			$("#n_title_check").text(" ");
		}		
	});
	$("#n_content").blur(function() {
		var n_content = $('#n_content').val();
		if (n_content != "") {
			$("#n_content_check").text(" ");
		}
	});	
});
