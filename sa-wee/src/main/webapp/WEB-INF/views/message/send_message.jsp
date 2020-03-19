<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send_message</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/message/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/message/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="container-contact100">
		<div class="contact100-map" id="google_map" data-map-x="40.722047"
			data-map-y="-73.986422" data-pin="images/icons/map-marker.png"
			data-scrollwhell="0" data-draggable="1"></div>

		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title"> send message </span>

				<div class="wrap-input100 validate-input" data-validate="닉네임을 입력하세요">
					<input class="input100" type="text" name="name" placeholder="닉네임">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="제목을 입력하세요">
					<input class="input100" type="text" name="name" placeholder="제목">
					<span class="focus-input100"></span>
				</div>

				<!-- <div class="wrap-input100 validate-input"
					data-validate="Please enter email: e@a.x">
					<input class="input100" type="text" name="email"
						placeholder="Email"> <span class="focus-input100"></span>
				</div> -->

				<div class="wrap-input100 validate-input" data-validate="메세지를 입력하세요">
					<textarea class="input100" name="message" placeholder="내용"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">쪽지 보내기</button>
				</div>
			</form>

			<div class="contact100-more">
				<span class="contact100-more-highlight">+001 345 6889</span>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="resources/message/js/map-custom.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/message/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
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

