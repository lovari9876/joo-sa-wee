<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="img/favicon.ico" rel="shortcut icon" />

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="css/board_hs/bootstrap.min.css" />
<link rel="stylesheet" href="css/board_hs/font-awesome.min.css" />
<link rel="stylesheet" href="css/board_hs/slicknav.min.css" />
<link rel="stylesheet" href="css/board_hs/owl.carousel.min.css" />
<link rel="stylesheet" href="css/board_hs/magnific-popup.css" />
<link rel="stylesheet" href="css/board_hs/animate.css" />
<link rel="stylesheet" href="css/board_hs/linearicons.css" />
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/writestyle.css" />



</head>
<body id = "top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	
	


	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>리뷰 작성하기</h3>
				</div>
				<div class = "cafe-square"></div>
				
				
				<form action="insertReview" enctype="multipart/form-data">
					<table class="write-table">
						
						<input type = "hidden" name = "c_no" value = "${c_no}">
						
						<!-- 입력창 -->
						<tr class = "row">
							<td class = "cell">${c_title}</td>
						</tr>
						
						<tr class="row">
							<td class="cell"><input type="text" name="cr_title" placeholder = "제목을 입력하세요"></td>
						</tr>

						<tr class="row">
							<td class="cell"><textarea id = "editor" name="cr_content" placeholder = "내용을 입력하세요"></textarea></td>
						</tr>

					</table>
					<button class = "list" type="button" onclick="location.href='list'">목록</button>
					<button class = "write-btn" type = "submit">작성완료</button>
				</form>




			</div>
		</div>
	</div>

		<!-- footer 부분 -->
		<!-- footer include start -->
			<%@ include file="/WEB-INF/views/share/footer.jsp" %>
		<!-- footer include end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/header/scroll.js"></script>
	<!-- <script src ="js/file.js"></script> -->
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	
	<script src="js/footer/footer_hee.js"></script>
</body>
</html>