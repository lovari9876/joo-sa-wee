$(function(){	
	$("#find_pw").click(function(){
		var m_email = $("#m_email").val();
		var m_id = $("#m_id").val();
		
		console.log("m_email " + m_email);
		console.log("m_id " + m_id);

		$.ajax({
			url : '/forgot_pw_email?m_email='+m_email+'&m_id='+m_id,
			type : 'get',
			success : function(data) {
				console.log("data : " + data);

				if (!data) {
					console.log("m_email " + m_email);

					$("#id_check").text("등록된 정보가 없습니다.");

				} else {
					console.log("m_email " + m_email);
					$("#id_check").html("이메일로 임시비밀번호가 <br> 발송되었습니다.");

				}
			}
		});
	});
})