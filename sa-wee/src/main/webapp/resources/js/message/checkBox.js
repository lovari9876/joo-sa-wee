/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});*/

//맨위의 모두선택 체크박스에 체크하면, 모든 개별 체크박스(.chBox)에 체크가 됨
//$("#allCheck").click(function() {
//	var chk = $("#allCheck").prop("checked");
//	if (chk) {
//		$(".chBox").prop("checked", true);
//	} else {
//		$(".chBox").prop("checked", false);
//	}
//});
//
//// 개별 체크박스가 선택되거나 선택해제되면, 모두 선택 체크박스가 해제됨
//$(".chBox").click(function() {
//	$("#allCheck").prop("checked", false);
//});

// confirm을 이용해 삭제 여부를 확인하고, 개별 선택된 체크박스들을 배열 변수 checkArr에 저장한 뒤 컨트롤러로 전송
// 전송이 이상없이 되었다면 현재 페이지(board_list)를 새로고침
$(".selectDelete_btn").click(function() {
	var checkArr = new Array();
	var cate = $(this).val();
	
	$("input[class='chBox']:checked").each(function() {
		checkArr.push($(this).attr("data-NN"));
		
	});

	if (checkArr == "") {
		alert("게시글을 하나 이상 선택해주세요");
	}else{
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		if (confirm_val) {
			
			$.ajax({
				url : "/rest/delete_message",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					alert("삭제되었습니다.");
					if(cate == 'island'){
						location.href = "http://localhost:8282/admin/island_list";
					}else {
						if(result == 1) {
							location.href = "http://localhost:8282/admin/board_list";
						}else if(result == 2) {
							location.href = "http://localhost:8282/admin/board_list_cafe";
						}else if(result == 3) {
							location.href = "http://localhost:8282/admin/board_list_trade";
						} else {
							alert("삭제 실패");
						}
					}

				}
			});//ajax
			
		}
	}
	
});