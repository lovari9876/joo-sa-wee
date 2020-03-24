$(document).ready(function() {

	
	 //On Click Event
    $(".__member").click(function() {

    	
    	
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
    				
    				console.log(value.st_no, value.st_trade_num);
    				
    				
    				tag += "<tr class='trow'>"
    				tag += "<tr class='trow'> <td class='cell'>" + value.st_no + "</td>"
    				tag += "<td class='cell'><a href='report_view?st_no=" + value.st_no + "'>" + value.st_comment_num + "</a></td>"
    				tag += "<td class='cell'>" + value.st_trade_num + "</td>"
    				tag += "<td class='cell'>" + value.st_date + "</td></tr>"
    				

        			
    				
    			});
    			$("#ajax_test").empty().append(tag);
    		},

    		error : function(request, status, error) {
    			console.log(request.responseText);
    			console.log(error);

    		}

    	});
    	
    });

});

