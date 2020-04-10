<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SUN-IN-LAW IS DISE</title>
<meta charset="UTF-8">
<meta name="description" content="EndGam Gaming Magazine Template">
<meta name="keywords" content="endGam,gGaming, magazine, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

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
<link rel="stylesheet" href="css/board_hj/radio_style.css">
<link rel="stylesheet" href="css/board_hj/graph_style.css">
<link rel="stylesheet" href="css/board_hj/list_style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body id="top">

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- Game이라는 제목 부분 -->
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="images/board_hj/lavender_dot_dark.png">
		<div class="page-info">
			<h3>보드게임 정보</h3>
		</div>
	</section>
	<!-- Page top end-->


	<!-- Games section -->
	<section class="games-single-page">
		<div class="container">
			<div class="g_info">
				<div class="rating-widget">
					<div class="gameSingle-content">
						<h4 class="gs-title">Final Appocalipse 2.1</h4>
					</div>
					<div class="gameSingle-preview game_item first">
						<img src="images/board_hj/games/big.jpg" alt="" class="g_photo">
						<div class="game_item second">
							<div class="widget-item" style="text-align: left">
								<h4 class="widget-title">상세정보</h4>
								<ul>
									<li>게임이름<span>3.5/5</span></li>
									<li>디자이너<span>4.5/5</span></li>
									<li>최소인원<span>3.5/5</span></li>
									<li>최대인원<span>4.5/5</span></li>
									<li>플레이시간<span>4.5/5</span></li>
									<li>사용연령<span>4.5/5</span></li>
									<li>게임난이도<span>4.5/5</span></li>
									<li>출시일<span>4.5/5</span></li>
									<li>플레이시간<span>4.5/5</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="g_vote">
				<div class="rating-widget">
					<div class="widget-item inline-item first">
						<h4 class="widget-title">투표</h4>
						<form action="#">
							<ul class="mar_li">
								<li>게임난이도 <span class="radio-group"> <input
										type="radio" id="option-one1" name="selector1" value="1"><label
										for="option-one1">1점</label><input type="radio"
										id="option-two1" name="selector1" value="2"><label
										for="option-two1">2점</label><input type="radio"
										id="option-three1" name="selector1" value="3"><label
										for="option-three1">3점</label><input type="radio"
										id="option-four1" name="selector1" value="4"><label
										for="option-four1">4점</label><input type="radio"
										id="option-five1" name="selector1" value="5"><label
										for="option-five1">5점</label>
								</span>
								</li>
								<li>룰설명시간 <span> <input type="text" name="ruletime"
										size="1" class="text_time"> 분
								</span>
								</li>
								<li>언어의존도 <span class="radio-group"> <input
										type="radio" id="option-one2" name="selector2" value="1"><label
										for="option-one2">1점</label><input type="radio"
										id="option-two2" name="selector2" value="2"><label
										for="option-two2">2점</label><input type="radio"
										id="option-three2" name="selector2" value="3"><label
										for="option-three2">3점</label><input type="radio"
										id="option-four2" name="selector2" value="4"><label
										for="option-four2">4점</label><input type="radio"
										id="option-five2" name="selector2" value="5"><label
										for="option-five2">5점</label>
								</span>
								</li>
								<li>상호작용 <span class="radio-group"> <input
										type="radio" id="option-one3" name="selector3" value="1"><label
										for="option-one3">1점</label><input type="radio"
										id="option-two3" name="selector3" value="2"><label
										for="option-two3">2점</label><input type="radio"
										id="option-three3" name="selector3" value="3"><label
										for="option-three3">3점</label><input type="radio"
										id="option-four3" name="selector3" value="4"><label
										for="option-four3">4점</label><input type="radio"
										id="option-five3" name="selector3" value="5"><label
										for="option-five3">5점</label>
								</span>
								</li>
								<li>테마충실도 <span class="radio-group"> <input
										type="radio" id="option-one4" name="selector4" value="1"><label
										for="option-one4">1점</label><input type="radio"
										id="option-two4" name="selector4" value="2"><label
										for="option-two4">2점</label><input type="radio"
										id="option-three4" name="selector4" value="3"><label
										for="option-three4">3점</label><input type="radio"
										id="option-four4" name="selector4" value="4"><label
										for="option-four4">4점</label><input type="radio"
										id="option-five4" name="selector4" value="5"><label
										for="option-five4">5점</label>
								</span>
								</li>
								<li>리플레이성 <span class="radio-group"> <input
										type="radio" id="option-one5" name="selector5" value="1"><label
										for="option-one5">1점</label><input type="radio"
										id="option-two5" name="selector5" value="2"><label
										for="option-two5">2점</label><input type="radio"
										id="option-three5" name="selector5" value="3"><label
										for="option-three5">3점</label><input type="radio"
										id="option-four5" name="selector5" value="4"><label
										for="option-four5">4점</label><input type="radio"
										id="option-five5" name="selector5" value="5"><label
										for="option-five5">5점</label>
								</span>
								</li>
								<li>아트웍 <span class="radio-group"> <input
										type="radio" id="option-one6" name="selector6" value="1"><label
										for="option-one6">1점</label><input type="radio"
										id="option-two6" name="selector6" value="2"><label
										for="option-two6">2점</label><input type="radio"
										id="option-three6" name="selector6" value="3"><label
										for="option-three6">3점</label><input type="radio"
										id="option-four6" name="selector6" value="4"><label
										for="option-four6">4점</label><input type="radio"
										id="option-five6" name="selector6" value="5"><label
										for="option-five6">5점</label>
								</span>
								</li>
								<li>내용물구성 <span class="radio-group"> <input
										type="radio" id="option-one7" name="selector7" value="1"><label
										for="option-one7">1점</label><input type="radio"
										id="option-two7" name="selector7" value="2"><label
										for="option-two7">2점</label><input type="radio"
										id="option-three7" name="selector7" value="3"><label
										for="option-three7">3점</label><input type="radio"
										id="option-four7" name="selector7" value="4"><label
										for="option-four7">4점</label><input type="radio"
										id="option-five7" name="selector7" value="5"><label
										for="option-five7">5점</label>
								</span>
								</li>
								<li>추천인원 <span class="radio-group"> <input
										type="radio" id="option-one8" name="selector8" value="1"><label
										for="option-one8">1명</label><input type="radio"
										id="option-two8" name="selector8" value="2"><label
										for="option-two8">2명</label><input type="radio"
										id="option-three8" name="selector8" value="3"><label
										for="option-three8">3명</label><input type="radio"
										id="option-four8" name="selector8" value="4"><label
										for="option-four8">4명</label><input type="radio"
										id="option-five8" name="selector8" value="5"><label
										for="option-five8">5명</label><input type="radio"
										id="option-six8" name="selector8" value="6"><label
										for="option-six8">6명</label><input type="radio"
										id="option-seven8" name="selector8" value="7"><label
										for="option-seven8">7명</label><input type="radio"
										id="option-eight8" name="selector8" value="8"><label
										for="option-eight8">8명이상</label>
								</span>
								</li>
								<li><span> <input type="submit" value="완료"
										class="btn">
								</span></li>
							</ul>
						</form>
					</div>
					<div class="widget-item inline-item second"
						style="text-align: left">
						<h4 class="widget-title">결과</h4>
						<ul>
							<li>게임난이도<span>4/5</span></li>
							<li>룰설명시간<span>4/5</span></li>
							<li>언어의존도<span>3/5</span></li>
							<li>상호작용<span>4/5</span></li>
							<li>테마충실도<span>4/5</span></li>
							<li>리플레이성<span>4/5</span></li>
							<li>아트웍<span>4/5</span></li>
							<li>내용물구성<span>4/5</span></li>
							<li>추천인원</li>
						</ul>
						<div class="zt-span6 last">
							<div class="zt-skill-bar">
								<div data-width="88" style="">
									1명<span>88%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="92" style="">
									2명<span>92%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="82" style="">
									3명<span>82%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="85" style="">
									4명<span>85%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="60" style="">
									5명<span>60%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="60" style="">
									6명<span>60%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="60" style="">
									7명<span>60%</span>
								</div>
							</div>
							<div class="zt-skill-bar">
								<div data-width="60" style="">
									8명이상<span>60%</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- 리스트 -->
			<div class=tab-table>
				<!-- 탭부분 -->
				<ul class="tab">
					<li class="current"><a href="#tab1">보드 이야기</a></li>
					<li><a href="#tab2">개봉기 및 리뷰</a></li>
					<li><a href="#tab3">보드게임 모임</a></li>
					<li><a href="#tab4">보드 뉴스</a></li>
					<li><a href="#tab5">질문 & 답변</a></li>
					<li><a href="#tab6">창작 보드게임</a></li>

				</ul>

				<!-- 테이블  -->
				<div id="tab1" class="tabcontent current">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

					</table>

				</div>

				<div id="tab2" class="tabcontent">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">V아니아니liamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

					</table>

				</div>

				<div id="tab3" class="tabcontent">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vi어어어어어어어ㅓ엉lliamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

					</table>

				</div>

				<div id="tab4" class="tabcontent">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vinc아니아니아니어어어어어</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

					</table>
				</div>
				
				<div id="tab5" class="tabcontent">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vinc아니아니아니어어어어어</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vinc아니아니아니어어어어어</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

					</table>
				</div>
				
				<div id="tab6" class="tabcontent">

					<table class="table">


						<tr class="rows r_title">
							<td class="cell">글 번호</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>

						<tr class="rows">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vinc아니아니아니어어어어어</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
						</tr>

						<tr class="rows">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vinc아니아니아니어어어어어</td>
						</tr>

					</table>
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
	<script src="js/board_hj/linebar.js"></script>
	<script src="js/board_hj/tab.js"></script>
	
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