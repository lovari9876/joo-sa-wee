$(document).ready(function(){
	
	$('.write-btn').click(function(){
		var title = $('#title').val();
		var content = myEditor.getData();
		
		
		
		if(title == ""){
			alert("제목을 입력하세요");
			return false;
		}
		

		if(content == ""){
			alert("내용을 입력하세요");
			return false;
		}
		
		document.form.submit();
	})
});