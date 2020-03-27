<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DICE</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />


<!-- <link rel="stylesheet" type="text/css"
	href="resources/css/join/roboto-font.css">
<link rel="stylesheet" type="text/css"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->

<link rel="stylesheet" type="text/css"
	href="resources/css/join/jquery-ui.min.css">

<link rel="stylesheet" href="resources/css/join/style.css" />
<link rel="stylesheet" href="resources/css/join/main.css" />

</head>
<body>

	<div class="page-content">
		<div class="wizard-v3-content">
			<div class="wizard-form">
				<div class="wizard-header">
					<a href="#" class="wrap-input100"> <img class="logo_image"
						src="resources/images/bl_share/icons/login/wolf_logo.png"
						alt="son-in-low_is_dice">
					</a>
				</div>
				<form id="form-register" class="form-register" action="/join"
					method="post">
					<div id="form-total">
						<h2>
							<span class="step-icon"><i class="zmdi zmdi-account"></i></span>
							<span class="step-text">About</span>
						</h2>
						<section>
							<div class="inner">
								<h3>가입 정보:</h3>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											name="m_id" id="m_id" class="form-control" required>
											<span class="label">아이디</span> <span class="border"></span>
										</label>
										<div class="check_font" id="id_check">
											<button class="idCheck" type="button" id="idCheck"
												onclick="fn_idCheck();" value="N">중복확인</button>
										</div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_nick" name="m_nick" required>
											<span class="label">닉네임</span> <span class="border"></span>
										</label>
										<div class="check_font" id="nickname_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="password"
											name="m_pw" id="m_pw" class="form-control" required>
											<span class="label">비밀번호</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="password"
											name="comfirm_password" id="comfirm_password"
											class="form-control" required> <span class="label">비밀번호
												확인</span> <span class="border"></span>
										</label>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-lock"></i></span> <span
								class="step-text">Personal</span>
						</h2>
						<section>
							<div class="inner">
								<h3>개인 정보:</h3>
								<div class="form-row">
									<div class="form-holder">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_name" name="m_name" required>
											<span class="label">이름</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div id="radio">
										<label>성별:</label> <input type="radio" name="m_gender"
											value="f" checked class="radio-1"> Female <input
											type="radio" name="m_gender" value="m"> Male
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_birth" name="m_birth" required>
											<span class="label">생년월일</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_phone" name="m_phone" required>
											<span class="label">핸드폰 번호</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											name="m_email" id="m_email" class="form-control" required>
											<span class="label">이메일 주소</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_post" name="m_post" required>
											<span class="label">우편번호</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_addr1" name="m_addr1" required>
											<span class="label">주소</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_addr2" name="m_addr2" required>
											<span class="label">상세주소</span> <span class="border"></span>
										</label>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-account"></i></span>
							<span class="step-text">Detail</span>
						</h2>
						<section>
							<div class="inner">
								<h3>추가 정보:</h3>
								<div class="form-row">
									<div id="radio">
										<label>SMS수신여부:</label> <input type="radio" name="m_re_sms"
											value="y"> Yes <input type="radio" name="m_re_sms"
											value="n" checked class="radio-1"> No
									</div>
								</div>

								<div class="form-row">
									<div id="radio">
										<label>메일수신여부:</label> <input type="radio" name="m_re_notice"
											value="y"> Yes <input type="radio" name="m_re_notice"
											value="n" checked class="radio-1"> No
									</div>
								</div>
								<div class="form-row">
									<div id="radio">
										<label>쪽지수신여부:</label> <input type="radio" name="m_re_message"
											value="y"> Yes <input type="radio"
											name="m_re_message" value="n" checked class="radio-1">
										No
									</div>
								</div>

								<div class="form-row">
									<div id="radio">
										<label>회원정보공개여부:</label> <input type="radio" name="m_info"
											value="y"> Yes <input type="radio" name="m_info"
											value="n" checked class="radio-1"> No
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_self" name="m_self" required>
											<span class="label">자기소개</span> <textarea rows="10"
												style="width: 100%;" class="border"> </textarea> <!--  <span class="border"></span> -->
										</label>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-receipt"></i></span>
							<span class="step-text">Confirm</span>
						</h2>
						<section>
							<div class="inner">
								<h3>확인:</h3>
								<div class="form-row table-responsive">
									<table class="table">
										<tbody>
											<tr class="space-row">
												<th>이름:</th>
												<td id="m_name-val"></td>
											</tr>
											<tr class="space-row">
												<th>아이디:</th>
												<td id="m_id-val"></td>
											</tr>
											<tr class="space-row">
												<th>닉네임:</th>
												<td id="m_nick-val"></td>
											</tr>
											<tr class="space-row">
												<th>성별:</th>
												<td id="m_gender-val"></td>
											</tr>
											<!-- <tr class="space-row">
												<th>생년월일:</th>
												<td id="m_birth-val"></td>
											</tr> -->
											<tr class="space-row">
												<th>전화번호:</th>
												<td id="m_phone-val"></td>
											</tr>
											<tr class="space-row">
												<th>이메일:</th>
												<td id="m_email-val"></td>
											</tr>
											<tr class="space-row">
												<th>우편번호:</th>
												<td id="m_post-val"></td>
											</tr>

											<tr class="space-row">
												<th>주소:</th>
												<td id="m_addr-val"></td>
											</tr>
											<tr class="space-row">
												<th>쪽지수신여부:</th>
												<td id="m_re_sms-val"></td>
											</tr>
											<tr class="space-row">
												<th>메일수신여부:</th>
												<td id="m_re_notice-val"></td>
											</tr>
											<tr class="space-row">
												<th>쪽지수신여부:</th>
												<td id="m_re_message-val"></td>
											</tr>
											<tr class="space-row">
												<th>회원정보공개여부:</th>
												<td id="m_info-val"></td>
											</tr>
											<tr class="space-row">
												<th>자기소개:</th>
												<td id="m_self-val"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


						</section>
					</div>

				</form>


			</div>
		</div>
	</div>
	<script src="resources/js/join/jquery-3.3.1.min.js"></script>
	<script src="resources/js/join/jquery.steps.js"></script>
	<script src="resources/js/join/jquery-ui.min.js"></script>
	<script src="resources/js/join/main.js"></script>
	<!-- <script src="resources/js/join/check.js"></script> -->


	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
</body>
</html>