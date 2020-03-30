$(document).ready(function() {

	 //On Click Event
    $(".btn").click(function() {

    	var category = $(this).val();
    	//클릭한 .btn 클래스의 value를 받아와 변수에 담는다 
    	
    	var list = [];
    	
    	
    	// json 데이터 가져오기
    	$.ajax({
    		url : "http://localhost:8282/rest/report_list",
    		type : "post",
    		cache : false,
    		dataType : "json",
    		/* data: "", */

    		success : function(data) {
    			$.each(data, function(key, value) {
    				list.push([value.r_no, value.r_type, value.r_content, value.r_report_date])
    			});
    			
    			console.log(list);
    			list.reverse();
    			
    			var tag = "";
    			$.each(list, function(key, value) {
    				
    				//ajax 값 확인하기  : r_no, r_type, r_content, r_report_date
    				console.log(category, value[0,0], value[0,1], value[0,2], value[0,3]);
    				
    				if(category == value[0,1]){
    					tag += "<tr class='trow'>";
        				tag += "<tr class='trow'> <td class='cell'>" + value[0,0] + "</td>";
        				tag += "<td class='cell'>" +  value[0,1] + "</a></td>";
        				tag += "<td class='cell title'><a href='report_view?r_no=" + value[0,0] + "&r_type=" + value[0,1] + "'>" + value[0,2] + "</td>";
        				tag += "<td class='cell'>" + value[0,3] + "</td></tr>";
    				}else if(category == ""){
    					tag += "<tr class='trow'>";
        				tag += "<tr class='trow'> <td class='cell'>" + value[0,0] + "</td>";
        				tag += "<td class='cell'>" +  value[0,1] + "</a></td>";
        				tag += "<td class='cell title'><a href='report_view?r_no=" + value[0,0] + "&r_type=" + value[0,1] + "'>" + value[0,2] + "</td>";
        				tag += "<td class='cell'>" + value[0,3] + "</td></tr>";
    				}
    				
    			});
    			console.log(category);
    			$("#ajax_test").empty().append(tag);
    		},

    		error : function(request, status, error) {
    			console.log(request.responseText);
    			console.log(error);

    		}

    	});
    	
    });

});

