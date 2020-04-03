// confirm을 이용해 무인도행 여부를 확인하고, 개별 선택된 체크박스들을 배열 변수 checkArr에 저장한 뒤 컨트롤러로 전송
// 전송이 이상없이 되었다면 현재 페이지를 새로고침
$(".selectIsland_btn").click(function() {
	var checkArr = new Array();

	$("input[class='chBox']:checked").each(function() {
		checkArr.push($(this).attr("data-BW"));
	});

	if (checkArr == "") {
		alert("게시글을 하나 이상 선택해주세요");
	}else{s
		var confirm_val = confirm("정말 무인도로 보내시겠습니까?");

		if (confirm_val) {
			$.ajax({
				url : "http://localhost:8282/admin/updateIsland",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					alert("무인도로 이동되었습니다.");
					if(result == 1) {
						location.href = "http://localhost:8282/admin/board_list";
					}else if(result == 2) {
						location.href = "http://localhost:8282/admin/board_list_cafe";
					}else if(result == 3) {
						location.href = "http://localhost:8282/admin/board_list_trade";
					} else {
						alert("실패");
					}
				}
			});
		}
	}
	
	
	
	
});
