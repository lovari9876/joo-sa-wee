<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
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

<link rel="stylesheet" href="css/board_hs/list-home-style.css" />


<link rel="stylesheet" href="css/board_hs/flaticon.css">
<link rel="stylesheet" href="css/board_hs/icomoon.css">
<link rel="stylesheet" href="css/board_hs/ionicons.min.css">
<link rel="stylesheet" href="css/board_hs/open-iconic-bootstrap.min.css">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- 밑에 전체부분 -->
	<section class="ftco-section2 bg-light ftco-no-pb2">
		<div class="container-fluid px-0">
			
				<!-- 화면제목 -->
				<div class = "heading">
					<!-- <h3>리스트 홈</h3> -->
				</div>
				
				

				<div class="row no-gutters ">

				<!-- 바둑판 시작  -->

				
			
					<div class="col-lg-6 ">
						<div class="room-wrap d-md-flex">
							<a href="notice_list" class="img"
								style="background-image: url(images/board_hs/notice.jpg);"></a>
							
							
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0"></p>
									<h3 class="mb-3">
										<a href="notice_list">공지사항</a>
									</h3>
									<p class="pt-1">
										<a href="notice_list" class="btn-custom px-3 py-2">
										<span class="far fa-hand-point-left"></span>  게시판 가기	
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 자주하는 질문  -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="faq" class="img"
								style="background-image: url(images/board_hs/question.jpg);"></a>
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0"></p>
									<h3 class="mb-3">
										<a href="faq">자주하는 질문</a>
									</h3>
									<p class="pt-1">
										<a href="faq" class="btn-custom px-3 py-2">
											<span class="far fa-hand-point-left"></span>  게시판 가기	
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>



					<!-- 1 : 1 문의 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="question_list" class="img order-md-last"
								style="background-image: url(images/board_hs/qna.jpg);"></a>
							<div class="half right-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0"></p>
									<h3 class="mb-3">
										<a href="question_list">1 : 1 문의</a>
									</h3>
									<p class="pt-1">
										<a href="question_list" class="btn-custom px-3 py-2">게시판 가기
											 <span class="far fa-hand-point-right"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 무인도 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="island_list" class="img order-md-last"
								style="background-image: url(images/board_hs/island.jpg);"></a>
							<div class="half right-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0"></p>
									<h3 class="mb-3">
										<a href="island_list">무인도</a>
									</h3>
									<p class="pt-1">
										<a href="island_list" class="btn-custom px-3 py-2">게시판 가기
											 <span class="far fa-hand-point-right"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</section>
	
		





	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/header/scroll.js"></script>

</body>
</html>