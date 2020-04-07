$(document).ready(function(){
	
	$("#delete_btn").click(function(){
		
		var count = "${count}";
		
		if(count > 0){
			alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
			return;
		}
	})
});