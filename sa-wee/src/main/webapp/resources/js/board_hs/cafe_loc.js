$(document).ready(function(){
	
	$(".select").click(function(){
		//버튼 눌렀을때 그 버튼의 value 값을 category 에 넣기.
		var category = $(this).val();
		
		console.log(category);
		
		$.ajax({
			url : "http://192.168.6.13:8282/list_sub",
			type : "get",
			cache : false,
			dataType : "json",
			
			success : function(data){
				var tag = "";
				
				$.each(data, function(key,value){
					
					//button 의 value 값이랑 board_no2 의 값이 같을 경우.
					if(category == value.s_no){
						
						console.log(value.s_no, value.bw_written_date);
						tag += "<tr class = 'row'>"
						tag += "<td class = 'cell'>"+value.bw_no+"</td>";
						tag += "<td class = 'cell'><a href = 'content_view?bw_no="+value.bw_no+"'>"+value.bw_title+"</td>";
						tag += "<td class = 'cell'>"+value.m_no+"</td>";
						tag += "<td class = 'cell'>"+value.bw_written_date+"</td>";
						tag += "<td class = 'cell'>"+value.bw_hit+"</td>";
						tag += "<td class = 'cell'>"+value.bw_recommend_num+"</td>";
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