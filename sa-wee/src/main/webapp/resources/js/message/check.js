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
$(".btn-receive").click(function() {
	$("#allCheck").prop("checked", false);										
});
$(".btn-send").click(function() {
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
				url : "/delete_receive_message",
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
