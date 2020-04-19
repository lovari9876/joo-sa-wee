<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>내 사위는 주사위</title>
<meta charset="UTF-8">
<meta name="description" content="EndGam Gaming Magazine Template">
<meta name="keywords" content="endGam,gGaming, magazine, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
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
<link rel="stylesheet" href="css/board_hs/style.css" />
<link rel="stylesheet" href="css/header/header_hyesoo.css">
<link rel="stylesheet" href="css/board_hs/home-liststyle.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!-- Page Preloder -->
	<!-- <div id="preloder">
		<div class="loader"></div>
	</div> -->



	<!-- 상단바 전체 -->
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/main-header.jsp" %>
	<!-- header include end -->


	<!-- Header section end -->


	<!-- 도로록  -->
	<div class="sidenav">
		<ul class="mymenu">
			<li><a class="icon fas fa-home" id="uno" href="#advertise"></a>
				<div class="hide">홈</div></li>
			<li><a class="icon fab fa-hotjar" id="uno" href="#hot-issue"></a>
				<div class="hide">핫이슈</div></li>
			<li><a class="icon far fa-kiss-wink-heart" id="dos" href="#best"></a>
				<div class="hide">베스트</div></li>
			<li><a class="icon fas fa-coffee" id="tres" href="#support"></a>
				<div class="hide">후원</div>
		</ul>
	</div>

	




	<!-- 광고  -->

	<section class="main-section" id = "advertise">
		<!-- 1 : 광고, 사진, 랭킹 묶음-->
		<div class="main-wrap">
			<!-- 1-1 : 광고, 사진 묶음  -->
			<div class="advertise-wrap">

				<div class="forname">
					<div class="ad-name" id = "octagon"><i class="fas fa-ad" style = "margin-left:20px;"></i> 광고</div>
					<!--1-1-1 : 광고 묶음  -->
					<div class="slider-wrap ">

						<div class="advertise-slider">

							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<!-- 이것도 추가해줘야하나봄. 밑에 조그마한 막대모양 -->
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>

								</ol>



								<div class="carousel-inner " role="listbox">

									<!-- 이거 한뭉텅이씩 추가하면 광고 추가됨 -->
									<div class="carousel-item active">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/">
											<img class="d-block w-100 " src="images/board_hs/root.jpeg">
										</a>
										<div class="carousel-caption">첫번째</div>
									</div>

									<div id="target" class="carousel-item ">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/root.jpeg"></a>
										<div class="carousel-caption">두번째</div>
									</div>

									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/root.jpeg"></a>
										<div class="carousel-caption">세번째</div>
									</div>


								</div>


								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>




					</div>
				</div>

				<div class="forname">
					<div class="ev-name"id = "octagon2"><i class="fas fa-gift" style = "margin-left:20px;"></i> 이벤트</div>
					<!--1-1-2 : 사진 묶음  -->
					<div class="image-wrap ">
						<div class="advertise-image">

							<a target="_blank" href="https://www.naver.com"><img
								src="images/board_hs/age.png"></a>
							<div class="content">
								<h3>이벤트입니다</h3>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- 1-2 : 랭킹 묶음  -->
			<div class="ad-name" id = "octagon" style = "margin-top : 15px;margin-left : 0px;"><i class="fas fa-trophy" style = "margin-left:20px;"></i> 랭킹</div>
			<div class="ranking-wrap">
				<!-- <h3>오늘의 랭킹</h3> -->

				<div class="rank medal">
					<img src="images/board_hs/gold-medal128.png">
					<div class="rank-name">
						댓글 많이 씀
						<br/>
						<br/>
						${rankWC}
					</div>
					
				</div>

				<div class="rank shield">
					<img src="images/board_hs/shield128.png">
					<div class="rank-name">글 많이 씀
						<br/>
						<br/>
						<c:forEach items = "${rankW}" var = "rankW">
						${rankW['I_NICK']}
						</c:forEach>
					</div>
				</div>

				<div class="rank siren">
					<img src="images/board_hs/alert.png">
					<div class="rank-name">신고 많이 받음...
						<br/>
						<br/>
						누구
					</div>

				</div>

			</div>
		</div>
	</section>






	<!-- 히트다 히트 --><!-- 조회순 -->
	<!-- Blog section -->
	<section id="hot-issue" class="blog-section spad">
		<div class="container">
			<!-- <div class="row"> -->
			<div class="col-xl-12 col-lg-12 col-md-12 col-xs-12">
				<div class="section-title">
					<h2>히트다 히트</h2>
				</div>

				<div class="limiter">
					<div class="container-table101">
						<div class="wrap-table100">

							<table class="table">
								<tr class="row header">
									<td class="cell">순위</td>
									<td class="cell">게시판</td>
									<td class="cell">제목</td>
									<td class="cell">작성자 </td>
									<td class="cell">작성일</td>
									<td class="cell">조회수</td>
								</tr>
							<c:forEach items = "${hit}" var = "hit">
								<tr class="row">
								<!-- 이거 1부터 10까지  -->
									<td class="cell">${hit['ROWNUM'] }</td>
									<!-- 게시판 이름 어찌 가져오냐..... -->
									<td class="cell">${hit['BT_NAME']}</td>
									<td class="cell"><a href = "content_view?bw_no=${hit['BW_NO']}">${hit['BW_TITLE']}</a></td>
									<td class="cell">${hit['M_NICK']}</td>
									<td class="cell">
										<jsp:useBean id="today" class="java.util.Date" />
										<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
										<fmt:formatDate value="${hit['BW_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${hit['BW_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="cell">${hit['BW_HIT']}</td>
								</tr>
							</c:forEach>
								
							</table>
						</div>
					</div>
				</div>


			</div>
		</div>
		
	</section>
	<!-- Blog section end -->




	<!-- 베스트 --><!-- 추천순 -->
	<!-- Blog section -->
	<section id="best" class="blog-section spad">
		<div class="container">
			<!-- <div class="row"> -->
			<div class="col-xl-12 col-lg-12 col-md-12 col-xs-12">
				<div class="section-title">
					<h2>베 스 트</h2>
				</div>

				<div class="limiter">
					<div class="container-table100">
						<div class="wrap-table100">

							<table class="table">
								<tr class="row header">
									<td class="cell">순위</td>
									<td class="cell">게시판</td>
									<td class="cell">제목</td>
									<td class="cell">작성자 </td>
									<td class="cell">작성일</td>
									<td class="cell">추천쑤</td>
								</tr>
							<c:forEach items = "${best}" var = "best">
								<tr class="row">
								<!-- 이거 1부터 10까지  -->
									<td class="cell">${best['RNUM'] }</td>
									<!-- 게시판 이름 어찌 가져오냐..... -->
									<td class="cell">${best['I_NAME']}</td>
									<td class="cell">
										<c:choose>
											<c:when test = "${best['I_NAME'] eq '카페 리뷰'}">
												<a href = "content_view_cr?cr_no=${best['I_NO']}">${best['I_TITLE']}</a>
											</c:when>
											<c:otherwise>
												<a href = "content_view?bw_no=${best['I_NO']}">${best['I_TITLE']}</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="cell">${best['M_NICK']}</td>
									<td class="cell">
										
										<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
										<fmt:formatDate value="${best['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${best['I_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="cell">${best['I_RECOMMEND_NUM']}</td>
								</tr>
							</c:forEach>
								
							</table>
						</div>
					</div>
				</div>


			</div>
		</div>
		
	</section>






	<!-- 후원 -->
	<!-- Newsletter section -->
	<section id="support" class="newsletter-section">
		<div class="container">
			<div class="section-title text-white">
				<h2>커피 한잔 사주실래요</h2>
			</div>
			<button class="site-btn">후원하기</button>
		</div>
	</section>
	<!-- Newsletter section end -->




	<!-- 하단 정보 -->
	<!-- Footer section -->

	<footer class="ftco-footer  ftco-section">
		<div class="container">
			<div class="rowa mb-1">
				<div class="col-md site">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">내사위는 주사위</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="fab fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fab fa-facebook-f"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fab fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Useful Links</h2>
						<ul class="list-unstyled">
							<li><a href="game_info" class="py-2 d-block">보드게임 정보</a></li>
							<li><a href="list_home" class="py-2 d-block">커뮤니티</a></li>
							<li><a href="cafe_map" class="py-2 d-block">보드게임 카페</a></li>
							<li><a href="tlist" class="py-2 d-block">보부상</a></li>
							<li><a href="help_home" class="py-2 d-block">헬프데스크</a></li>
						</ul>
					</div>
				</div>


				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Contact Us</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><i class="fas fa-phone"></i> &nbsp;&nbsp; 02-1234-5678</li>
								<li><i class="far fa-envelope"></i>&nbsp;&nbsp;
									info.colorlib@gmail.com</li>
								<li><i class="fas fa-map-marked-alt"></i>&nbsp;&nbsp; 서울
									마포구 백범로 23 지하1층</li>

								<!--  <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li> -->
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--  <div class="rowa">
          <div class="col-md-12 text-center">

            <p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
          </div>
        </div> -->
		</div>
	</footer>
	<!-- Footer section end -->
	
	
	<!-- ========== 후원 모달 ================================================ -->
	
	<!-- 후원 모달 include start -->
	<%@ include file="/WEB-INF/views/board_hs/sponsor/sponsor_modal_view.jsp"%>
	<!-- 후원 모달 include end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/board_hs/scroll.js"></script>
	<script src="js/board_hs/cafe-photo.js"></script>
</body>
</html>