$(document).ready(function() {
	
	$(".rec_cm_btn_or").click(function() {
		
		var category = $(this).val();
		console.log(category);
		
		$.ajax({
			url: "http://localhost:8282/rec_cm_or",
			type: "get",
			cache: false,
			//파라미터 넘기는 방법(key-value 형택)
			data: {cm_no : category},
			dataType : "json",
			
			success : function(data) {
				$(".rec_cm_or").empty().append(data);
				location.reload(true);
			},
			
			error : function(request, status, error) {
				console.log(request.responseText);
				console.log(error);
			}
		});
	});
});