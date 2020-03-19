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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/liststyle.css" />


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
	
	
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="listName">
					<h3>창작 보드게임</h3>
					<p>창작 보드게임 게시판입니다. 자랑하세요</p>
				</div>


				<!-- Search Bar  -->
				<form action="">

					<div class="search">

						<select>
							<option value="0" selected>제목</option>
							<option value="1">내용</option>
							<option value="2">닉네임</option>
						</select> 
						
						<input id="searchBar" type="text">

						<!-- 여기 미쳐버렸음. 일단 버튼으로 만들어 놓고 다음에 해야함 타입이 submit 인줄도 모르겠음-->
						<button type="submit" class="fa fa-fw fa-search"></button>


						<!-- <i class="fa fa-fw fa-search"></i> -->
					</div>
				</form>




				<!-- 리스트 -->
				<div class=tab-table>
					<!-- 탭부분 -->
					<ul class="tab">
						<li class="current" data-tab="tab1"><a href="#">전체보기</a></li>
						<li data-tab="tab2"><a href="#">말머리1</a></li>
						<li data-tab="tab3"><a href="#">말머리2</a></li>
						<li data-tab="tab4"><a href="#">말머리3</a></li>

					</ul>
					
						

					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current">

						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

							<tr class="row">
								<td class="cell">1</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">2</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">3</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">4</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">5</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">6</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">7</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">8</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">9</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">10</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">11</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">12</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">13</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">14</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">15</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

						</table>

					</div>

					<div id="tab2" class="tabcontent">

						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

							<tr class="row">
								<td class="cell">1</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">V아니아니liamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">2</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">3</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">4</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">5</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">6</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">7</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">8</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">9</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">10</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">11</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">12</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">13</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">14</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">15</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

						</table>

					</div>

					<div id="tab3" class="tabcontent">

						<table class="table">


						<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

							<tr class="row">
								<td class="cell">1</td>
								<td class="cell">Vi에이이이이아야야ㅑㅏㅏon</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">2</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">3</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">4</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">5</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">6</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">7</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">8</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">9</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">10</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">11</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">12</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">13</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">14</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">15</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>
						</table>

					</div>

					<div id="tab4" class="tabcontent">

						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

							<tr class="row">
								<td class="cell">1</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vinc아니아니아니어어어어어</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

								<tr class="row">
								<td class="cell">2</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">3</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">4</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">5</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">6</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">7</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">8</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">9</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">10</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">11</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">12</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">13</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">14</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>

							<tr class="row">
								<td class="cell">15</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent </td>
								<td class="cell">Vincent</td>
							</tr>
						</table>
					</div>

				</div>

				<!-- 버튼에 링크 걸기 -->
				<button class="write-view-btn" type="button"
					onclick="location.href='write_view'">글쓰기</button>


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
	<script src="js/js_header/scroll.js"></script>
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/js_footer/footer_hee.js"></script>

</body>
</html>