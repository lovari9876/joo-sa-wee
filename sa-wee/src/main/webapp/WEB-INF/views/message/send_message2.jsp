<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/message/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/message/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/message/check.css" />

</head>
<body>
	<div class="container-contact100">
		<div class="contact100-map" id="google_map" data-map-x="40.722047"
			data-map-y="-73.986422" data-pin="images/icons/map-marker.png"
			data-scrollwhell="0" data-draggable="1"></div>

		<div class="wrap-contact100">
			<form id="send_message-form" class="contact100-form validate-form" action="/send_message">
				<span class="contact100-form-title"> send message </span> <input
					type="hidden" id="m_no2" name="m_no2" value="${member.m_no}" />

				<div class="wrap-input100 validate-input" >
					<input class="input100" type="text" name="m_nick" id="m_nick" value="${other.m_nick}" readonly>
					<span class="focus-input100"></span>
				</div>
				<div class="check_font"></div>				

				<div class="wrap-input100 validate-input" data-validate="제목을 입력하세요">
					<input class="input100" type="text" name="n_title" id="n_title"
						placeholder="제목"> <span class="focus-input100"></span>
				</div>
				<div class="check_font" id="n_title_check"></div>
				
				<div class="wrap-input100 validate-input" data-validate="메세지를 입력하세요">
					<textarea class="input100" name="n_content" id="n_content"
						placeholder="내용"></textarea>
					<span class="focus-input100"></span>
				</div>
				<div class="check_font" id="n_content_check"></div>			

				<div class="container-contact100-form-btn">
				
					<input type="button" class="contact100-form-btn check" value="쪽지 보내기"/>
					<!-- <button class="contact100-form-btn">쪽지 보내기</button> -->					
				</div>
			</form>

			<!-- <div class="contact100-more">
				<span class="contact100-more-highlight">+001 345 6889</span>
			</div> -->
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/mypage/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/message/main.js"></script>
	<script src="resources/js/message/check.js"></script>

</body>
</html>

