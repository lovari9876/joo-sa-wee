
	function toList(){
		var bt_no = $("#bt_no").val();
		
		
		if(bt_no==1){
			location.href = "/board_story";
		}else if(bt_no ==2){
			location.href = "/board_open_review";
		}else if(bt_no ==3){
			location.href = "/board_meet";
		}else if(bt_no ==4){
			location.href = "/board_news";
		}else if(bt_no ==5){
			location.href = "/board_qna";
		}else if(bt_no ==6){
			location.href = "/board_creation";
		}
	}
