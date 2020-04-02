$(document).ready(function(){

	$("#secret_box").on( "change", function() {
		
		var secret_box = $("#secret_box").prop("checked");
		
		if(secret_box == true){
			$("#secret_box").val("y")
			console.log("체크함");
			console.log($("#secret_box").val());
		}else{
			$("#secret_box").val("n");
			console.log("체크안함");
			console.log($("#secret_box").val());
		}
	});
	
	
	
});