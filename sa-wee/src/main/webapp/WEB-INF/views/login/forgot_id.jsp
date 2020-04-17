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
			<a href="#" class="wrap-input100 p-b-30"> <img class="logo_image"
				src="images/bl_share/icons/login/wolf_logo.png"
				alt="son-in-low_is_dice">
			</a><br />
			<form class="login100-form " action="/forgot_idview">
			
				<div class="wrap-input100 m-b-20"
					data-validate="이름을 입력하세요">
					<input class="input100" type="text" name="m_name" id="m_name"
						placeholder="NAME"> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 m-b-25"
					data-validate="등록된 이메일을 입력하세요">
					<input class="input100" type="email" name="m_email" id="m_email" 
						placeholder="EMAIL"> <span class="focus-input100"></span>
				</div>

				<div class="text-center check_font m-b-25" id="id_check"></div>
				
				<div class="container-login100-form-btn">
					<button type="button" class="login100-form-btn" id="find_id" >ID 찾기</button>
				</div>
				<br />

				<div class="text-center">
					<a href="forgot_pwview" class="txt3 hov1">FORGOT PASSWARD</a>
				</div>
				<br /> <br /> <br />

				<div class="text-center">
					<a href="/loginview" class="txt2 hov1"> 로그인</a> / <a href="/joinview"
						class="txt2 hov1"> 회원가입 </a>
				</div>
			</form>

		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<script src="resources/js/join/jquery-3.3.1.min.js"></script>
	<script src="resources/js/login/main.js"></script>
	<script src="resources/js/login/forgot_id.js"></script>

	<script>
	
	</script>	

</body>
</html>

