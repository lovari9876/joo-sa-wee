$(function() {
	/*
	 * 이메일 인증 버튼 클릭시 발생하는 이벤트
	 */
	
	$(document).on(
			"click",
			"#phoneBtn",			
			function() {
				/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
				$.ajax({
					beforeSend : function() {
						loadingBarStart();
					},
					type : "get",
					url : "/sendSMS",
					data : "userPhoneNumber=" + $("#m_phone").val(),
				
					success : function(data) {
						var m_phone = $('#m_phone').val();
						console.log(m_phone);
						var reg_m_phone =  /^\d{10,11}$/;
	
						if (m_phone == "") {
							alert("핸드폰 번호를 입력해주세요.");
							return false;
						}
						if (!reg_m_phone.test(m_phone)) {
							alert("핸드폰 번호는 -없이 01011110000 형식으로 입력해주세요 입력해주세요.");
							return false;						
						} 
						$.ajax({
							url : '/phoneCheck?m_phone=' + m_phone,
							type : 'post',
							success : function(data) {
								console.log("1 = 중복o / 0 = 중복x : " + data);

								if (data > 0) {
									alert("등록된 핸드폰 번호입니다.");
									return false

								} else {
									alert("입력하신 핸드폰으로 인증번호가 발송되었습니다. \n시간이 소요될 수 있으니 잠시 기다려주세요.");
								}
							}
						});
					},
					error : function(data) {
						alert("에러가 발생했습니다. 핸드폰 번호를 다시 확인해주세요.");
						return false;
					}

				});
			});
	/*
	 * 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	 */
	$(document).on(
			"click",
			"#smsBtn",
			function() {
				$.ajax({
					beforeSend : function() {
						loadingBarStart();
					},
					type : "get",
					url : "/smsCheck",
					data :"&randomSMS=" + $("#randomSMS").val(),

					success : function(data) {
						if (data == "complete") {
							alert("인증이 완료되었습니다.");
							$('#phone_pass').attr("value","Y");
							
						} else if (data == "false") {
							alert("인증번호를 잘못 입력하셨습니다.");
							
						}
					},

					complete : function() {
						loadingBarEnd();
					},

					error : function(data) {
						alert("에러가 발생했습니다.");
					}
				});
			});
	
});