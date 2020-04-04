<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>SON-IN-RAW IS DICE - LOGIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/login/main.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/login/background.css">
</head>
<body>

	<div class="container-login100">
		<!-- 메인페이지와 연결되게 -->
		<div class="wrap-login100 p-l-55 p-r-55 p-t-50 p-b-30">
			<c:if test="${member == null}">
				<a href="#" class="wrap-input100 p-b-30"> <img
					class="logo_image"
					src="resources/images/bl_share/icons/login/wolf_logo.png"
					alt="son-in-low_is_dice">
				</a>
				<br />

				<form class="login100-form validate-form" method="post"
					autocomplete="off" action="/loginSecurity">
					<!-- <span class="login100-form-title p-b-37"> <img
					class="logo_image" src="resources/images/icons/login/wolf_logo.png"
					alt="son-in-low_is_dice">
				</span> -->

					<div class="wrap-input100 validate-input m-b-20"
						data-validate="Enter ID">
						<input id="m_id" class="input100" type="text" name="m_id"
							placeholder="ID"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-25"
						data-validate="Enter password">
						<input id="m_pw" class="input100" type="password" name="m_pw"
							placeholder="PASSWARD"> <span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">로그인</button>
					</div>

					<input name="${_csrf.parameterName}" type="hidden"
						value="${_csrf.token}" />


					<!-- 로그인 실패, F5를 누르면 사라짐 / 1회성  -->
					<c:if test="${msg == false}">
						<p style="color: #f00;">아이디 또는 패스워드를 다시 입력하십시오</p>
					</c:if>

					<!-- 스프링 시큐리티 로그인 실패 -->
					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						<p style="color: #f00;">
							<!-- Your login attempt was not successful due to <br /> -->
							${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
						</p>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					</c:if>

					<br />

					<div class="text-center txt3">
						FORGOT <a href="forgot_id" class="txt3 hov1"> ID</a> / <a
							href="forgot_pw" class="txt3 hov1">PASSWARD</a>
					</div>
					<div class="text-center p-t-57 p-b-20">
						<span class="txt1"> or login with </span>
					</div>

					<div class="flex-c p-b-112">
						<!-- <a href="#" class="login100-social-item">
						<i class="fa fa-facebook-f"></i>
					</a> -->
						<a href="#" class="login100-social-item"> <img
							src="resources/images/bl_share/icons/login/kakaolink_btn_medium_ov.png"
							alt="KAKAO">
						</a> <a href="#" class="login100-social-item"> <img
							src="resources/images/bl_share/icons/login/icon-google.png"
							alt="GOOGLE">
						</a> <a href="#" class="login100-social-item"> <img
							src="resources/images/bl_share/icons/login/naver_logo_Green.PNG"
							alt="NAVER">
						</a>
					</div>

					<div class="text-center">
						<a href="join" class="txt2 hov1"> 회원가입 </a>
					</div>

				</form>
			</c:if>

			<c:if test="${member != null}">
				<div class="text-center p-t-37 p-b-30">
					<span class="txt1"> ${member.m_id}님 환영합니다 </span>
				</div>
				<a href="/logout" class="txt3 hov1">로그아웃</a>

				<a href="/mypage" class="txt3 hov1">마이페이지</a>
			</c:if>


		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="resources/js/login/main.js"></script>

</body>
</html>

