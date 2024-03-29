/*var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});*/

$(function() {
	var pass = true;
	$("#form-total")
			.steps(
					{
						headerTag : "h2",
						bodyTag : "section",
						transitionEffect : "fade",
						enableAllSteps : true,
						autoFocus : true,
						transitionEffectSpeed : 500,
						titleTemplate : '<div class="title">#title#</div>',
						labels : {
							previous : 'Previous',
							next : 'Next Step',
							finish : 'Submit',
							current : ''
						},

						onStepChanging : function(event, currentIndex, newIndex) {
							var m_name = $('#m_name').val();
							var m_id = $('#m_id').val();
							var m_nick = $('#m_nick').val();
							var gender = $(
									':input:radio[name=m_gender]:checked')
									.val();

							var m_phone = $('#m_phone').val();
							var m_email = $('#m_email').val();
							var m_post = $('#m_post').val();
							var m_addr = $('#m_addr1').val() + ' '
									+ $('#m_addr2').val();

							var m_re_sms = $(
									':input:radio[name=m_re_sms]:checked')
									.val();
							var m_re_notice = $(
									':input:radio[name=m_re_notice]:checked')
									.val();
							var m_re_message = $(
									':input:radio[name=m_re_message]:checked')
									.val();
							var m_info = $(':input:radio[name=m_info]:checked')
									.val();

							var m_self = $('#m_self').val();

							$('#m_name-val').text(m_name);
							$('#m_id-val').text(m_id);
							$('#m_nick-val').text(m_nick);
							$('#m_gender-val').text(gender);

							$('#m_phone-val').text(m_phone);
							$('#m_email-val').text(m_email);
							$('#m_post-val').text(m_post);
							$('#m_addr-val').text(m_addr);

							$('#m_re_sms-val').text(m_re_sms);
							$('#m_re_notice-val').text(m_re_notice);
							$('#m_re_message-val').text(m_re_message);
							$('#m_info-val').text(m_info);

							$('#m_self-val').text(m_self);

							return true;
						},

						onFinished : function(event, currentIndex) {
							
							if ($('#agree').val() == "N") {
								alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
								return false;
							}
							if($('#phone_pass').val() == "N"){
								alert("핸드폰을 인증해주세요.");
								return false;
							}	
							
							if ($("#m_id").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#m_id").focus();
								return false;
							}
							if($("#m_id_check").val() != ""){
								alert("아이디를 확인해주세요.");
								$("#m_id").focus();
								return false;
							}							

							if ($("#m_nick").val() == "") {
								alert("닉네임을 입력해주세요.");
								$("#m_nick").focus();
								return false;
							}							
							if($("#m_nick_check").val() != ""){
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
								alert("비밀번호를 입력해주세요.");
								$("#comfirm_password").focus();
								return false;
							}
							if ($("#comfirm_password_check").val() != "") {
								alert("비밀번호를 확인해주세요.");
								$("#comfirm_password").focus();
								return false;
							}

							if ($("#m_name").val() == "") {
								alert("이름을 입력해주세요.");
								$("#m_name").focus();
								return false;
							}
							if ($("#m_name_check").val() != "") {
								alert("이름을 확인해주세요.");
								$("#m_name").focus();
								return false;
							}

							if ($("#m_birth").val() == "") {
								alert("생일을 입력해주세요.");
								$("#m_birth").focus();
								return false;
							}
							if ($("#m_birth_check").val() != "") {
								alert("생일을 확인해주세요.");
								$("#m_birth").focus();
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
							if($('#email_pass').val() == "N"){
								alert("이메일을 인증해주세요.");
								return false;
							}
							if($('#phone_pass').val() == "N"){
								alert("이메일을 인증해주세요.");
								return false;
							}							
							if(!pass){
								alert("형식에 맞지 않습니다. 다시 확인해주세요.");
								return false;
							}
							if(pass){
								alert("가입이 완료되었습니다.");
								$("#form-register").submit();
							}
						}
					});

	$("#m_id").blur(function() {
		var m_id = $('#m_id').val();
		$.ajax({
			url : '/idCheck?m_id=' + m_id,
			type : 'post',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);

				if (data > 0) {
					$("#m_id_check").text("사용중인 아이디입니다.");
					pass = false;

				} else {
					var reg_m_id = /^[A-Za-z0-9_\-]{4,12}$/;

					if (m_id == "") {
						$('#m_id_check').text('아이디를 입력해주세요.');

					} else if (reg_m_id.test(m_id)) {
						$("#m_id_check").text(" ");
						pass = true;

					} else if (m_id.length < 3 || !reg_m_id.test(m_id)) {
						$('#m_id_check').text("아이디는 영어와 숫자 4~12자리만 가능합니다.");
						pass = false;
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
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
							pass = false;

						} else {
							var reg_m_nick = /^[A-Za-zㄱ-ㅎㅏ-ㅣ가-힣0-9_\-]{1,10}$/;

							if (m_nick == "") {
								$('#m_nick_check').text('닉네임을 입력해주세요.');

							} else if (reg_m_nick.test(m_nick)) {
								$("#m_nick_check").text(" ");
								pass = true;

							} else if (!reg_m_nick.test(m_nick)) {
								$('#m_nick_check').text(
										"닉네임은 특수문자와 공백을 제외한 10자리 이하만 가능합니다");
								pass = false;

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
							pass = false;

						} else if (reg_m_pw.test(m_pw)) {
							$("#m_pw_check").text(" ");
							pass = true;

						} else if (!reg_m_pw.test(m_pw)) {
							$('#m_pw_check')
									.text(
											"비밀번호는 영문, 숫자, 특수문자 !@#$%^&*_~- 를 사용한 8~20자리만 가능합니다.");
							pass = false;

						}
						if($('#comfirm_password_check').val != ""){
							if($('#m_pw').val() != $('#comfirm_password').val()){
								$('#comfirm_password_check').text('비밀번호가 일치하지 않습니다.');
								$("#comfirm_password_check").css("color", "red");
								pass = false;

							}
						}
					});

	$('#comfirm_password').blur(function() {
		if ($('#comfirm_password').val() == '') {
			$('#comfirm_password_check').text('비밀번호를 입력해주세요.');

		} else if ($('#m_pw').val() == $('#comfirm_password').val()) {
			$('#comfirm_password_check').text('');
			pass = true;
		
		} else {
			$('#comfirm_password_check').text('비밀번호가 일치하지 않습니다.');
			$("#comfirm_password_check").css("color", "red");
			pass = false;

		}
	});
	
	$("#m_name").blur(function() {
	
		var m_name = $('#m_name').val();
		var reg_m_name = /^[가-힣a-zA-Z]{2,10}$/;

		if (m_name == "") {
			$('#m_name_check').text('이름을 입력해주세요.');

		} else if (reg_m_name.test(m_name)) {
			$("#m_name_check").text(" ");
			pass = true;

		} else if (!reg_m_name.test(m_name)) {
			$('#m_name_check').text("이름은 한글과 영문 2~10자리로 입력해주세요.");
			pass = false;

		}
	});

	$("#m_birth").blur(function() {
		
		var m_birth = $('#m_birth').val();
		var reg_m_birth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

		if (m_birth == "") {
			$('#m_birth_check').text('생년월일을 입력해주세요. ex)19940615');

		} else if (reg_m_birth.test(m_birth)) {
			$("#m_birth_check").text(" ");
			pass = true;

		} else if (!reg_m_birth.test(m_birth)) {
			$('#m_birth_check').text("생년월일은 숫자 8자리로 입력해주세요. ex)19940615");
			pass = false;

		}
	});
	
	$("#m_email").blur(function() {
		
		var m_email = $('#m_email').val();
		var reg_m_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;


		if (m_email == "") {
			$('#m_email_check').text('이메일을 입력해주세요.');

		} else if (reg_m_email.test(m_email)) {
			$("#m_email_check").text(" ");
			pass = true;

		} else if (!reg_m_email.test(m_email)) {
			$('#m_email_check').text("이메일 형식으로 입력해주세요.");
			pass = false;

		}
	});
	$("input[name='agree']").on('click', function() { 
//		var agree = document.getElementById('agree');
//		console.log(agree);
//		var check = agree.getAttribute("checked")
//		console.log(check);
		
		if ( $(this).prop('checked') ) { 
			$('#agree').attr("value","Y");

		} else { 
			$('#agree').attr("value","N");

		} 

	});		
});
