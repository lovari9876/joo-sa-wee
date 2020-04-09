var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});

$(function() {
	$("#m_nick").blur(
			function() {
				var m_nick = $('#m_nick').val();
				$.ajax({
					url : '/nickCheck?m_nick=' + m_nick,
					type : 'post',
					success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : " + data);

						if (data > 0) {
							$("#m_nick_check").text("사용중인 닉네임입니다.");

						} else {
							var reg_m_nick = /^[A-Za-zㄱ-ㅎㅏ-ㅣ가-힣0-9_\-]{1,10}$/;

							if (m_nick == "") {
								$('#m_nick_check').text('닉네임을 입력해주세요.');

							} else if (reg_m_nick.test(m_nick)) {
								$("#m_nick_check").text(" ");

							} else if (!reg_m_nick.test(m_nick)) {
								$('#m_nick_check').text(
										"특수문자와 공백을 제외한 10자리 이하로 입력해주세요");

							}
						}
					}
				});
			});
	$("#m_pw")
			.blur(
					function() {
						var m_pw = $('#m_pw').val();
						var reg_m_pw = /^[A-Za-z0-9!@#$%^&*_~\-]{8,20}$/;

						if (m_pw == "") {
							$('#m_pw_check').text('비밀번호를 입력해주세요.');

						} else if (reg_m_pw.test(m_pw)) {
							$("#m_pw_check").text(" ");

						} else if (!reg_m_pw.test(m_pw)) {
							$('#m_pw_check')
									.text(
											"비밀번호는 영문, 숫자, 특수문자 !@#$%^&*_~- 를 사용한 8~20자리만 가능합니다.");
						}
						if ($('#comfirm_password_check').val != "") {
							if ($('#m_pw').val() != $('#comfirm_password')
									.val()) {
								$('#comfirm_password_check').text(
										'비밀번호가 일치하지 않습니다.');
								$("#comfirm_password_check")
										.css("color", "red");
							}
						}
					});

	$('#comfirm_password').blur(function() {
		if ($('#comfirm_password').val() == '') {
			$('#comfirm_password_check').text('비밀번호를 입력해주세요.');
		} else if ($('#m_pw').val() == $('#comfirm_password').val()) {
			$('#comfirm_password_check').text('');
		} else {
			$('#comfirm_password_check').text('비밀번호가 일치하지 않습니다.');
			$("#comfirm_password_check").css("color", "red");

		}
	});

	$("#m_email")
			.blur(
					function() {

						var m_email = $('#m_email').val();
						var reg_m_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

						if (m_email == "") {
							$('#m_email_check').text('이메일을 입력해주세요.');

						} else if (reg_m_email.test(m_email)) {
							$("#m_email_check").text(" ");

						} else if (!reg_m_email.test(m_email)) {
							$('#m_email_check').text("이메일 형식으로 입력해주세요.");
						}
					});
	
	function m_update() {

		if ($("#m_nick").val() == "") {
			alert("닉네임을 입력해주세요.");
			$("#m_nick").focus();
			return false;
		}
		if ($("#m_nick_check").val() != "") {
			alert("닉네임을 확인해주세요.");
			$("#m_nick").focus();
			return false;
		}

		if ($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#m_pw").focus();
			return false;
		}
		if ($("#m_pw_check").val() != "") {
			alert("비밀번호를 확인해주세요.");
			$("#m_pw").focus();
			return false;
		}

		if ($("#comfirm_password").val() == "") {
			alert("비밀번호를 확인해주세요.");
			$("#comfirm_password").focus();
			return false;
		}
		if ($("#comfirm_password_check").val() != "") {
			alert("비밀번호를 확인해주세요.");
			$("#comfirm_password").focus();
			return false;
		}

		if ($("#m_phone").val() == "") {
			alert("핸드폰 번호를 입력해주세요.");
			$("#m_phone").focus();
			return false;
		}
		if ($("#m_phone_check").val() != "") {
			alert("핸드폰 번호를 확인해주세요.");
			$("#m_phone").focus();
			return false;
		}
		if ($("#m_email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#m_email").focus();
			return false;
		}
		if ($("#m_email_check").val() != "") {
			alert("이메일을 확인해주세요.");
			$("#m_email").focus();
			return false;
		}
		if ($("#m_post").val() == "") {
			alert("우편번호를 입력해주세요.");
			$("#m_post").focus();
			return false;
		}
		if ($("#m_addr1").val() == "") {
			alert("주소를 입력해주세요.");
			$("#m_addr1").focus();
			return false;
		}
		if ($("#m_addr2").val() == "") {
			alert("상세주소를 입력해주세요.");
			$("#m_addr2").focus();
			return false;
		}
		var modify = document.getElementById("viewForm");
		modify.action = "<c:url value='/mypage_modify'/>";
		modify.submit();
		console.log("modify");
	}
	
});
