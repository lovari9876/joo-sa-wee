<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>SON-IN-RAW IS DICE - forgot_id</title>
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
			
			<a href="#" class="wrap-input100 p-b-30"> 
				<img class="logo_image"
				src="resources/images/bl_share/icons/login/wolf_logo.png"
				alt="son-in-low_is_dice">
			</a><br/>
			
			<form class="login100-form validate-form">
				<!-- <span class="login100-form-title p-b-37"> <img
					class="logo_image" src="resources/images/icons/login/wolf_logo.png"
					alt="son-in-low_is_dice">
				</span> -->

				<div class="wrap-input100 validate-input m-b-20"
					data-validate="ID를 입력하세요">
					<input class="input100" type="text" name="username"
						placeholder="ID"><span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="등록된 이메일을 입력하세요">
					<input class="input100" type="email" name="email"
						placeholder="EMAIL"><span class="focus-input100"></span>
				</div>
				<div class="text-center fs-11 p-b-10">
					기존에 등록된 메일로 새로운 <br/> PASSWARD가 발송됩니다.
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn">PASSWARD 재설정</button>
				</div>
				<br />
				
				<div class="text-center">
					<a href="forgot_idview"
						class="txt3 hov1">FORGOT ID</a>
				</div>
				<br/><br/><br/>
				<div class="text-center">
					<a href="/loginview" class="txt2 hov1"> 로그인</a> / <a href="/joinview" class="txt2 hov1">회원가입 </a>
				</div>

			</form>


		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<script src="resources/js/login/main.js"></script>

</body>
</html>

