$(document).ready(function() {
	
	$("#rec_btn_t").click(function() {
		
		var category = $(this).val();
		console.log(category);
		
		$.ajax({
			url: "/rec_t",
			type: "get",
			cache: false,
			//파라미터 넘기는 방법(key-value 형택)
			data: {t_no : category},
			dataType : "json",
			
			success : function(data) {
				$(".rec_t").empty().append(data);
			},
			
			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}
		});
	});
});