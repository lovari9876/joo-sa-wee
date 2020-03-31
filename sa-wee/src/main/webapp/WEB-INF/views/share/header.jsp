<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html class="no-js" lang="UTF-8">
<head>

    <!-- 혜수꺼 css
    ================================================== -->
    <link rel="stylesheet" href="css/header/header_hyesoo.css">
    <link rel="stylesheet" href="css/header/slicknav.min.css" /> 
    <link rel="stylesheet" href="css/header/font-awesome.min.css" />
    <link rel="stylesheet"
		href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>

<body id="top">

	<!-- 상단바 전체 -->
	<!-- Header section -->
	<header class="header-section">
		<div class="dice">내 사위는 주사위</div>
		<div class="header-warp">
			<div class="header-bar-warp d-flex ">
				<nav class="top-nav-area w-100">

					<!-- 상단바 메뉴 -->
					<ul class="main-menu head--ul primary-menu">
						<li><a href="/">Home</a></li>
						<li><a class="gameinfo" href="">보드게임 정보</a>
							<ul class="sub-menu">
								<li><a href="">당신의 보드게임</a></li>
								<li><a href="">보드게임 리스트</a></li>
							</ul>
						</li>
						<li><a class="comm" href="list_home">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="board_story">보드이야기</a></li>
								<li><a href="board_open_review">개봉기 및 리뷰</a></li>
								<li><a href="board_meet">보드게임 모임</a></li>
								<li><a href="board_news">보드 뉴스</a></li>
								<li><a href="board_qna">질문 & 답변</a></li>
								<li><a href="board_creation">창작 보드게임</a></li>
							</ul>
						</li>
						<li><a class ="board_cafe" href="cafe_map">보드게임카페</a>
							<ul class = "sub-menu">
								<li><a href="cafe_map">보드게임 카페</a></li>
								<li><a href="selectAllReviewList">카페리뷰 리스트</a></li>
							</ul>
						</li>
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
									<input type="text" placeholder="검색어를 입력하세요"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '검색어를 입력하세요'">
									<button class="mysearch-submit">
										<span class="lnr lnr-magnifier"></span>
									</button>
								</form>
							</div></li>

						<!-- 사람모양 아이콘  -->
						<li><a class="fas fa-user" href="#"></a>
							<ul class="sub-menu">
								<li><a href="gameSingle">로그인</a></li>
								<li><a href="gameSingle">회원가입</a></li>

							</ul> 
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header section end -->


</body>

</html>