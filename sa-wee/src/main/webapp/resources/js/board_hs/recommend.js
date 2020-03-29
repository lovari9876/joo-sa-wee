$(document).ready(function(){
	
	
	
	$("#btn").click(function(){
		
		var category = $(this).val();
		console.log(category);
		
		
		$.ajax({
			url : "http://localhost:8282/cafe_rec",
			type : "get",
			cache : false,
			//파라미터 넘기는 방법.(key : value 형태)
			data : {cr_no : category},
			dataType : "json",
			
			success : function(data){
				
				$(".rec").empty().append(data);
			},
			
			error : function(request, status, error){
				console.log(request.responseText);
				console.log(error);
			}
		});
	});
});