$("#m_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var m_id = $('#m_id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/idCheck?userId=' + m_id,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : " + data);

			if (data == 1) {
				// 1 : 아이디가 중복되는 문구
				$("#m_id").text("사용중인 아이디입니다 :p");
				$("#m_id").css("color", "red");
				$("#reg_submit").attr("disabled", true);
			} else {

				if (idJ.test(m_id)) {
					// 0 : 아이디 길이 / 문자열 검사
					$("#m_id").text("");
					$("#reg_submit").attr("disabled", false); 

				} else if (m_id == "") {

					$('#m_id').text('아이디를 입력해주세요 :)');
					$('#m_id').css('color', 'red');
					$("#reg_submit").attr("disabled", true);

				} else {

					$('#m_id').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
					$('#m_id').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
				}

			}
		},
		error : function() {
			console.log("실패");
		}
	});
});

