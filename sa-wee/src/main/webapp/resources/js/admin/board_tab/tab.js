$(document).ready(function() {

	 //On Click Event
    $(".btn").click(function() {

    	var category = $(this).val();
    	//클릭한 .btn 클래스의 value를 받아와 변수에 담는다 
    	
    	// json 데이터 가져오기
    	$.ajax({
    		url : "http://localhost:8282/rest/report_list",
    		type : "post",
    		cache : false,
    		dataType : "json",
    		/* data: "", */

    		success : function(data) {
    			
    			var tag = "";
    			$.each(data, function(key, value) {
    				
    				//ajax 값 확인하기 
    				console.log(category, value.r_no, value.r_type, value.r_content, value.r_report_date);
    				
    				if(category == value.r_type){
    					tag += "<tr class='trow'>";
        				tag += "<tr class='trow'> <td class='cell'>" + value.r_no + "</td>";
        				tag += "<td class='cell'>" + value.r_type + "</a></td>";
        				tag += "<td class='cell title'><a href='report_view?r_no=" + value.r_no + "&r_type=" + value.r_type + "'>" + value.r_content + "</td>";
        				
        				tag += "<td class='cell'>" + value.r_report_date + "</td></tr>";
    				}else if(category == ""){
    					tag += "<tr class='trow'>";
        				tag += "<tr class='trow'> <td class='cell'>" + value.r_no + "</td>";
        				tag += "<td class='cell'>" + value.r_type + "</a></td>";
        				tag += "<td class='cell title'><a href='report_view?r_no=" + value.r_no + "&r_type=" + value.r_type + "'>" + value.r_content + "</td>";
        				tag += "<td class='cell'>" + value.r_report_date + "</td></tr>";
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

