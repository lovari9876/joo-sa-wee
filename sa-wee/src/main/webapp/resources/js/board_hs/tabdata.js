$(document).ready(function(){
	
	$(".select").click(function(){
		//버튼 눌렀을때 그 버튼의 value 값을 category 에 넣기.
		var category = $(this).val();
		
		console.log(category);
		
		$.ajax({
			url : "http://localhost:8282/ex/list_sub",
			type : "get",
			cache : false,
			dataType : "json",
			
			success : function(data){
				var tag = "";
				
				$.each(data, function(key,value){
					
					//button 의 value 값이랑 board_no2 의 값이 같을 경우.
					if(category == value.board_no2){
						
						console.log(value.board_no2, value.bDate);
						tag += "<tr class = 'row'>"
						tag += "<td class = 'cell'>"+value.bId+"</td>";
						tag += "<td class = 'cell'><a href = 'content_view?bId="+value.bId+"'>"+value.bTitle+"</td>";
						tag += "<td class = 'cell'>"+value.bName+"</td>";
						tag += "<td class = 'cell'>"+value.bDate+"</td>";
						tag += "<td class = 'cell'>"+value.bHit+"</td>";
						tag += "<td class = 'cell'>"+value.bCo+"</td>";
						tag += "</tr>";
						/*console.log(tag);*/
					}
				});
				console.log(category);
				$(".test").empty().append(tag);
			},
			
			error : function(request, status, error){
				console.log(request.responseText);
				console.log(error);
			}
		});
	});
});