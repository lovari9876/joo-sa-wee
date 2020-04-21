<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/mypage/font.css" />

<!-- modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5">비밀번호 변경</h3>
			<form action="/pw_modify" method="post" id="viewForm">

				<div class="col-md-4 eml-mob" style="border-right: none;">
					<div class="pd">
						<label>비밀번호</label> <input placeholder="password"
							class="form-control password-font" type="password" id="m_pw"
							name="m_pw" value="">
						<div class="check_font" id="m_pw_check"></div>
						<br /> <label>비밀번호 확인</label> <input
							placeholder="comfirm password" class="form-control password-font"
							type="password" id="comfirm_password" name="comfirm_password"
							value="">
						<div class="check_font" id="comfirm_password_check"></div>
					</div>
					<input type="hidden" id="m_no" name="m_no" value="${member.m_no}" />
				</div>
				<br />

				<div class="form-group btn-shake">
					<a href="/pw_modifyview" onclick="modify()"
						class="btn btn-lavender btn-md text-white" id="btn-color">비밀번호
						변경</a>
				</div>

				<br />
			</form>
		</div>
	</div>

	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>
	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script>
		var pass = false;
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
							if ($('#comfirm_password_check').val != "") {
								if ($('#m_pw').val() != $('#comfirm_password')
										.val()) {
									$('#comfirm_password_check').text(
											'비밀번호가 일치하지 않습니다.');
									$("#comfirm_password_check").css("color",
											"red");
									pass = false;
								}
							}
						});

		$('#comfirm_password').blur(function() {
			if ($('#comfirm_password').val() == '') {
				$('#comfirm_password_check').text('비밀번호를 입력해주세요.');
				pass = false;
			} else if ($('#m_pw').val() == $('#comfirm_password').val()) {
				$('#comfirm_password_check').text('');
				pass = true;
			} else {
				$('#comfirm_password_check').text('비밀번호가 일치하지 않습니다.');
				$("#comfirm_password_check").css("color", "red");
				pass = false;
			}
		});

		function modify() {
			var modify = document.getElementById("viewForm");
			var m_pw = $('#m_pw').val();

			if (pass) {

				console.log("m_pw " + m_pw );

				modify.action = "<c:url value='/pw_modify'/>";
				modify.submit();
				alert("비밀번호 변경이 완료되었습니다.");
				window.opener.location.replace('/mypage_modifyview');
				window.close();

			} else {
				alert("비밀번호를 다시 확인해주세요.");
				return false;

			}
		}
	</script>

</body>
</html>