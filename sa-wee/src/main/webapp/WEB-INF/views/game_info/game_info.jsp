<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SUN-IN-LAW IS DISE</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Favicon -->
<link href="images/board_hj/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<link rel="stylesheet" href="css/board_hj/game_style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body id="top">
	<!-- Page Preloder -->
	<!-- <div id="preloder">
		<div class="loader"></div>
	</div> -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- Game이라는 제목 부분 -->
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="images/board_hj/lavender_dot_dark.png">
		<div class="page-info">
			<h3>보드게임 정보</h3>
			<!-- <div class="site-breadcrumb">
				<a href="">Home</a> / <span>Games</span>
			</div> -->
		</div>
	</section>
	<!-- Page top end-->
	

	<!-- Games section -->
	<!-- ㄱㄴ~z까지 버튼 부분 -->
	<section class="games-section">
		<div class="container">
			<ul class="game-filter" id="game-filter">
				<li class="btn-color"><a href="">ㄱ</a></li>
				<li class="btn-color"><a href="">ㄴ</a></li>
				<li class="btn-color"><a href="">ㄷ</a></li>
				<li class="btn-color"><a href="">ㄹ</a></li>
				<li class="btn-color"><a href="">ㅁ</a></li>
				<li class="btn-color"><a href="">ㅂ</a></li>
				<li class="btn-color"><a href="">ㅅ</a></li>
				<li class="btn-color"><a href="">ㅇ</a></li>
				<li class="btn-color"><a href="">ㅈ</a></li>
				<li class="btn-color"><a href="">ㅊ</a></li>
				<li class="btn-color"><a href="">ㅋ</a></li>
				<li class="btn-color"><a href="">ㅌ</a></li>
				<li class="btn-color"><a href="">ㅍ</a></li>
				<li class="btn-color"><a href="">ㅎ</a></li>
				<li><a href="">A</a></li>
				<li><a href="">B</a></li>
				<li><a href="">C</a></li>
				<li><a href="">D</a></li>
				<li><a href="">E</a></li>
				<li><a href="">F</a></li>
				<li><a href="">G</a></li>
				<li><a href="">H</a></li>
				<li><a href="">I</a></li>
				<li><a href="">J</a></li>
				<li><a href="">K</a></li>
				<li><a href="">L</a></li>
				<li><a href="">M</a></li>
				<li><a href="">N</a></li>
				<li><a href="">O</a></li>
				<li><a href="">P</a></li>
				<li><a href="">Q</a></li>
				<li><a href="">R</a></li>
				<li><a href="">S</a></li>
				<li><a href="">T</a></li>
				<li><a href="">U</a></li>
				<li><a href="">V</a></li>
				<li><a href="">W</a></li>
				<li><a href="">X</a></li>
				<li><a href="">Y</a></li>
				<li><a href="">Z</a></li>
			</ul>
			<!-- 보드게임종뷰 부분 -->
			<div class="row right-align" id="row">
				<div class="col-xl-7 col-lg-8 col-md-7">
					<div class="row right-item photo">
					
						<c:forEach items = "${gameList}" var = "game">
							<div class="col-lg-4 col-md-6">
								<div class="game-item">
									<img src="${game.g_thumbnail}" alt="#">
									<h5>${game.g_name_kor }</h5>
									<a href="game_detail?g_no=${game.g_no}" class="read-more">Read More <img
										src="images/board_hj/icons/double-arrow.png" alt="" /></a>
								</div>
							</div>
						</c:forEach>
						
					
					</div>
					<div class="site-pagination">
						<a href="#" class="active">01.</a> <a href="#">02.</a> <a href="#">03.</a>
					</div>
				</div>
				
				<!-- 사이드바 부분 -->
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar" class="right-item bar">
						<div class="widget-item">
						<div class="categories-widget">
								<h4 class="widget-title wt">categories</h4>
								<ul>
									<li><a href="">Games</a></li>
									<li><a href="">Gaming Tips & Tricks</a></li>
									<li><a href="">Online Games</a></li>
									<li><a href="">Team Games</a></li>
									<li><a href="">Community</a></li>
									<li><a href="">Uncategorized</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title wt">platform</h4>
								<ul>
									<li><a href="">Xbox</a></li>
									<li><a href="">X box 360</a></li>
									<li><a href="">Play Station</a></li>
									<li><a href="">Play Station VR</a></li>
									<li><a href="">Nintendo Wii</a></li>
									<li><a href="">Nintendo Wii U</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title wt">Genre</h4>
								<ul>
									<li><a href="">Online</a></li>
									<li><a href="">Adventure</a></li>
									<li><a href="">S.F.</a></li>
									<li><a href="">Strategy</a></li>
									<li><a href="">Racing</a></li>
									<li><a href="">Shooter</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Games end-->


	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>
	
	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>
	
	<!-- <script src="js/board_hj/jquery.slicknav.min.js"></script> -->
	
	<script src="js/board_hj/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hj/ResizeSensor.js"></script>
	<script src="js/board_hj/jquery.sticky-sidebar.min.js"></script> 
	
	<script src="js/board_hj/bootstrap.min.js"></script>
	
	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>
	
	<script src="js/board_hj/main.js"></script>
	
	<!-- Java Script for header
    ================================================== -->   
    <script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<!-- 이미 가지고 있음 js/board_hj/main.js -->
	<script src="js/header/scroll.js"></script>
	
	<!-- Java Script for footer
    ================================================== -->  
	<script src="js/footer/footer_hee.js"></script>
	
</body>
</html>