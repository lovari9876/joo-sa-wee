<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="img/favicon.ico" rel="shortcut icon" />

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
<link rel="stylesheet" href="css/board_hs/style.css" />
<link rel="stylesheet" href="css/board_hs/writestyle.css" />
<link rel="stylesheet" href="css/board_hs/footer-style.css"/>


</head>
<body id = "top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	<header class="header-section">
		<div class="header-warp">
			<div class="header-bar-warp d-flex">

				<!-- site logo -->
				<!-- <a href="home.html" class="site-logo">
					<img src="./img/3535.png" width = "200px" height = "40px" alt="">
				</a> -->
				<br />
				<nav class="top-nav-area w-100">


					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a class="home" href="home">HOME</a></li>
						<li><a class="gameinfo" href="">보드게임 정보</a>
							<ul class="sub-menu">
								<li><a href="">당신의 보드게임</a></li>
								<li><a href="">보드게임 리스트</a></li>
							</ul></li>
						<li><a class="comm" href="list_home">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="list">보드이야기</a></li>
								<li><a href="list">개봉기 및 리뷰</a></li>
								<li><a href="list">보드게임 모임</a></li>
								<li><a href="list">보드 뉴스</a></li>
								<li><a href="list">질문 & 답변</a></li>
								<li><a href="list">창작 보드게임</a></li>
							</ul></li>
						<li><a href="cafe_map">보드게임카페</a></li>
						<li><a href="blog">보부상</a></li>
						<li><a class="help" href="contact">헬프데스크</a>
							<ul class="sub-menu">
								<li><a href="">자주하는 질문</a></li>
								<li><a href="question_list">1 : 1 문의 </a></li>
								<li><a href="">무인도 </a></li>
							</ul></li>
						<!-- 검색창  -->
						<li><div class="mysearch relative">
								<span class="lnr lnr-magnifier"></span>
								<form action="#" class="mysearch-field">
									<input type="text" placeholder="Search here"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search here'">
									<button class="mysearch-submit">
										<span class="lnr lnr-magnifier"></span>
									</button>
								</form>
							</div></li>

						<li><a class="fas fa-user" href="#"></a>
							<ul class="sub-menu">
								<li><a href="gameSingle">로그인</a></li>
								<li><a href="gameSingle">회원가입</a></li>

							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	


	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>리뷰 작성하기</h3>
				</div>
				<div class = "cafe-square"></div>
				
				
				<form action="" enctype="multipart/form-data">
					<table class="write-table">
						
						<!-- 입력창 -->
						<tr class="row">
							<td class="cell">제목</td>
							<td class="cell"><input type="text" name="bwTitle" placeholder = "제목을 입력하세요"></td>
							
						</tr>

						<tr class="row">
							<td class="cell">내용</td>
							<td class="cell"><textarea name="bwTitle" placeholder = "내용을 입력하세요"></textarea></td>
						</tr>

						<tr class="row">
							<td class="cell">첨부파일</td>
							<td class="cell">
								<input multiple="multiple" type="file" name="file" />
							</td>
							
						</tr>
					</table>
					<button class = "list" type="button" onclick="location.href='list'">목록</button>
					<button class = "write-btn" type = "submit">작성완료</button>
				</form>




			</div>
		</div>
	</div>

		<!-- footer 부분 -->
	<footer class="site-footer">

		<a href="#top" class="smoothscroll scroll-top"> <span
			class="fas fa-angle-up"></span>
		</a>

		<div class="container">
			<div class="rowa mb-5">
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>Home</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>보드게임 정보</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">당신의 보드게임</a></li>
						<li><a href="#">보드게임 리스트</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>커뮤니티</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">보드 이야기</a></li>
						<li><a href="#">개봉기 및 리뷰</a></li>
						<li><a href="#">보드게임 모임</a></li>
						<li><a href="#">보드 뉴스</a></li>
						<li><a href="#">질문 & 답변</a></li>
						<li><a href="#">창작 보드게임</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>보드게임 카페</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>보부상</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>헬프데스크</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">자주하는 질문</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">무인도</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<h3>Contact Us</h3>
					<div class="footer-social">
						<a href="#"><span class="fab fa-facebook-f"></span></a> <a href="#"><span
							class="fab fa-twitter"></span></a> <a href="#"><span
							class="fab fa-instagram"></span></a> <a href="#"><span
							class="fab fa-linkedin-in"></span></a>
					</div>
				</div>
			</div>

			<div class="rowa text-center">
				<div class="col-12">
					<p class="copyright">
						<small> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small><br />
						아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/freepik"
							title="Freepik">Freepik</a> from <a
							href="https://www.flaticon.com/kr/" title="Flaticon">
							www.flaticon.com</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	




	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	
	<!-- <script src ="js/file.js"></script> -->
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/custom.js"></script>

</body>
</html>