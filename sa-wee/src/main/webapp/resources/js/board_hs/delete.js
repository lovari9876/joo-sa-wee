

function commentDelete(){
	var count = $(".countComment").val();
	var bw_no = $(".bw_no").val();
	
	console.log(bw_no);
	
	if(count > 0){
		alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
		return false;
	}
	
	if(confirm("삭제하시겠습니까?")){
		location.href = "question_delete?bw_no="+bw_no;
	}
}