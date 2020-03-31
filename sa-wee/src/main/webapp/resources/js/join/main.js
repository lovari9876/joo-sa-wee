function checkID(m_id){
	var reg_m_id = /^[A-Za-z]+[A-Za-z0-9_\-]{3,19}$/;
	var match = reg_m_id(m_id);
	
	if(m_id == ""){
		alert("아이디를 입력하세요.");
		return true;
	}
	if(m_id.length < 4 || m_id.length > 20){
		alert("아이디는 4자 이상 20자 이하로 입력하세요.");
		return true;
	}
	if(match == null){
		alert("아이디의 첫 글자는 영문으로 시작하고, 영문과 숫자 조합만 가능합니다.");
		return true;
	}
	
	return false;
}


function fn_idCheck() {
	$.ajax({
		url : "/idCheck",
		type : "post",
		dataType : "json",
		data : {
			"m_id" : $("#m_id").val()
		},

		
		success : function(data) {
			var m_id = $("#m_id").val();
			console.log(m_id);

			if (data == 1) {
				alert("중복된 아이디입니다.");
			} else if (data == 0) {
				$("#idCheck").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

$(function() {

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

							if ($("#m_id").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#m_id").focus();
								return false;
							}

							if ($("#m_nick").val() == "") {
								alert("닉네임을 입력해주세요.");
								$("#m_nick").focus();
								return false;
							}
							if ($("#m_pw").val() == "") {
								alert("비밀번호를 입력해주세요.");
								$("#m_pw").focus();
								return false;
							}
							if ($("#comfirm_password").val() == "") {
								alert("비밀번호를 입력해주세요.");
								$("#comfirm_password").focus();
								return false;
							}

							if ($("#m_name").val() == "") {
								alert("이름을 입력해주세요.");
								$("#m_name").focus();
								return false;
							}

							if ($("#m_birth").val() == "") {
								alert("생일을 입력해주세요.");
								$("#m_birth").focus();
								return false;
							}

							if ($("#m_phone").val() == "") {
								alert("핸드폰 번호를 입력해주세요.");
								$("#m_phone").focus();
								return false;
							}
							if ($("#m_email").val() == "") {
								alert("이메일을 입력해주세요.");
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
							var idCheckVal = $("#idCheck").val();
							if (idCheckVal == "N") {
								alert("중복확인 버튼을 눌러주세요.");
								return false;
							} else if (idCheckVal == "Y") {
								alert("Submitted!");
								$("#form-register").submit();
							}

						}

					});

});
