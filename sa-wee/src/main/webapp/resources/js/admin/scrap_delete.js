$(document).ready(function() {

	$(".scrap_delete").click(function() {

		//게시판 타입 이름과 게시글 번호를 받는다 
		var type = $(this).attr('data-bt');
		var no = $(this).attr('data-no');

		console.log('type : ' + type);
		console.log('no : ' + no);
		
		//값을 넘기기 위해 배열에 넣는다 
		var arr = new Array();
		
		arr.push(type);
		arr.push(no);
		
		console.log('arr : ' + arr);
		
		
		$.ajax({
			url : "/admin/scrapDelete",
			type: "post",
			cache : false,
			// 파라미터 넘기는 방법(key-value)
			data : {
				scrapArr : arr
			},
			dataType : "json",

			success : function(result) {
				if (result == 0){
					console.log('삭제 성공 . . . ');
					alert('스크랩이 삭제되었습니다.');
					location.href = "/mypage";
				}
				
			},

			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}
		});
		
		
		
		

	});
});