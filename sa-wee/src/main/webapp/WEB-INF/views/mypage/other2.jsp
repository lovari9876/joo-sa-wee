<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>other</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!--===============================================================================================-->
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

<!--===============================================================================================-->

</head>
<body>
	<div class="container">
		<c:if test="${other.m_info == 'y'}">
			<div class="comment-form-wrap pt-5">
				<h3 class="mb-5"></h3>
				<form method="get" id="viewForm">

					<p>닉네임 : ${other.m_nick}</p>

					<p>등급 : ${other.getR_name(other.r_no)}</p>

					<p>이메일 : ${other.m_email}</p>

					<p>자기소개 : ${other.m_self}</p>

					<div class="form-group">
						<a href="/" class="btn btn-lavender btn-md text-white"
							id="btn-color">쪽지 보내기</a>
					</div>

				</form>
			</div>
		</c:if>
		<c:if test="${other.m_info == 'n'}">
			<div class="comment-form-wrap pt-5">
				<p> 정보 공개 설정을 하지 않은 회원입니다. </p>
			</div>
		</c:if>
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

