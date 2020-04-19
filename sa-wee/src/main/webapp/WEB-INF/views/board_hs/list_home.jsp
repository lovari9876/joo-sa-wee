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
	<section class="ftco-section bg-light ftco-no-pb">
		<div class="container-fluid px-0">
			
				<!-- 화면제목 -->
				<div class = "heading">
					<!-- <h3>리스트 홈</h3> -->
				</div>
				
				

				<div class="row no-gutters ">

				<!-- 바둑판 시작  -->

				
				<!-- 보드이야기 세트 -->
				
					<div class="col-lg-6 ">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img"
								style="background-image: url(images/board_hs/5.jpg);"></a>
							
							
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_story">보드이야기</a>
									</h3>
									<p class="pt-1">
										<a href="board_story" class="btn-custom px-3 py-2">
										<span class="far fa-hand-point-left"></span>  게시판 가기	
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 개봉기 및 리뷰 세트 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img"
								style="background-image: url(images/board_hs/6.jpg);"></a>
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_open_review">개봉기 및 리뷰</a>
									</h3>
									<p class="pt-1">
										<a href="board_open_review" class="btn-custom px-3 py-2">
											<span class="far fa-hand-point-left"></span>  게시판 가기	
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>



					<!-- 보드게임 모임 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img order-md-last"
								style="background-image: url(images/board_hs/2.jpg);"></a>
							<div class="half right-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_meet">보드게임 모임</a>
									</h3>
									<p class="pt-1">
										<a href="board_meet" class="btn-custom px-3 py-2">게시판 가기
											 <span class="far fa-hand-point-right"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 보드뉴스 세트 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img order-md-last"
								style="background-image: url(images/board_hs/3.jpg);"></a>
							<div class="half right-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_news">보드 뉴스</a>
									</h3>
									<p class="pt-1">
										<a href="board_news" class="btn-custom px-3 py-2">게시판 가기
											 <span class="far fa-hand-point-right"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 질문 & 답변 세트 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img"
								style="background-image: url(images/board_hs/1.jpg);"></a>
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_qna">질문 & 답변</a>
									</h3>
									<p class="pt-1">
										<a href="board_qna" class="btn-custom px-3 py-2">
											<span class="far fa-hand-point-left"></span>  게시판 가기	
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>


					<!-- 창작 보드게임 세트 -->
					<div class="col-lg-6">
						<div class="room-wrap d-md-flex">
							<a href="list" class="img"
								style="background-image: url(images/board_hs/4.jpg);"></a>
							<div class="half left-arrow d-flex align-items-center">
								<div class="text p-4 p-xl-5 text-center">
									<p class="star mb-0">
										<!-- <span class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span><span class="ion-ios-star"></span><span
											class="ion-ios-star"></span> -->
									</p>
									<!-- <p class="mb-0">
										<span class="price mr-1">$120.00</span> <span class="per">per
											night</span>
									</p> -->
									<h3 class="mb-3">
										<a href="board_creation">창작 보드게임</a>
									</h3>
									<p class="pt-1">
										<a href="board_creation" class="btn-custom px-3 py-2">
											<span class="far fa-hand-point-left"></span>  게시판 가기	
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