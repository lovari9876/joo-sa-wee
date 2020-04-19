$(document).ready(function() {

	$("#pgt_detail").click(function() {

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
			url : "/admin/scrap",
			type: "post",
			cache : false,
			// 파라미터 넘기는 방법(key-value)
			data : {
				scrapArr : arr
			},
			dataType : "json",

			success : function(result) {
				if (result == 1){
					console.log('스크랩 성공 . . . ');
					alert('스크랩되었습니다.');
				}else {
					console.log('스크랩 안됨 ');
					alert('이미 스크랩 된 글입니다.');
				}
				
			},

			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}
		});
		
		
		
		

	});
});