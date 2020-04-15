$(document).ready(function(){
	
	$('.write-btn').click(function(){
		var title = $('#title').val();
		var content = $("#editor").val();
		
		if(title == ""){
			alert("제목을 입력하세요");
			return false;
		}
		

		if(content == "" || content.length() == 0){
			alert("내용을 입력하세요");
			return false;
		}
		
		document.form.submit();
	})
});