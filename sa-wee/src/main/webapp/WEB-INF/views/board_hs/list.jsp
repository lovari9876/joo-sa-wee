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
<link rel="stylesheet" href="css/board_hs/style.css" />
<link rel="stylesheet" href="css/board_hs/liststyle.css" />
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

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="listName">
					<h3>보드 이야기</h3>
					<p>보드이야기를 하는 곳입니다. 보드 이야기 하세요</p>
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
	
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/custom.js"></script>

</body>
</html>