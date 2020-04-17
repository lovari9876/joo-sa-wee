$(function(){
	$("#find_id").click(function(){
		var m_email = $("#m_email").val();
		var m_name = $("#m_name").val();
		
		console.log("m_email " + m_email);
		console.log("m_name " + m_name);

		$.ajax({
			url : '/forgot_id?m_email='+m_email+'&m_name='+m_name,
			type : 'get',
			success : function(data) {
				console.log("data : " + data);

				var check = data;				
				if (check =="x") {
					$("#id_check").text("등록된 정보가 없습니다.");

				} else {
					$("#id_check").text("ID는 "+data+"입니다.");

				}
			}
		});
	});
})