<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- collapse -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />

<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- collapse -->
<!-- <script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

</head>
<body id="top">
	<input type="hidden" name="bw_no" value="${content_view['BW_NO']}"/>

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('images/board_hj/lavender_dot.png');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="custom-breadcrumbs mb-0">
						<!-- 게시판이름과 게시글 작성자 -->
						<div class="title">
							<div class="title_item frist">
								<h4 id="community">${content_view['BT_NAME']}</h4>
								<span class="slash">&bullet;</span> 
								<span class="slash">${content_view['S_CONTENT']}</span>
							</div>
							<div class="title_item second">
								<span class="slash">추천수(</span><span class="slash rec">${content_view['BW_RECOMMEND_NUM']}</span><span class="slash">)</span> 
								<span class="slash">&bullet;</span>
								<span class="slash">조회수(${content_view['BW_HIT']})</span>
							</div>
						</div>
						<div>
							<span class="text-white">작성자 ${content_view['M_NICK']}</span>
							<span class="slash">&bullet;</span> 
							<span class="text-white">작성일 
							    <!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
								<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
								<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
								<fmt:formatDate value="${content_view['BW_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${content_view['BW_WRITTEN_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	
							</span> 
							<span class="slash">&bullet;</span>
							<span class="text-white">수정일 
								<fmt:formatDate value="${content_view['BW_UPDATED_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${content_view['BW_UPDATED_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	
							</span>
						</div>
					</div>
					<br />
					<!-- 게시글 제목 -->
					<h2 class="text-white">${content_view['BW_TITLE']}</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- 게시글 본문 -->
	<section class="site-section" id="next-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 blog-content">

					<p>${content_view['BW_CONTENT']}</p>
				
				
					<br/><br/><br/><br/><br/>
					<!-- 태그 -->
					<c:forEach items = "${gameName}" var = "gameName" >
						<a style="color:#400186;" href = "game_detail?g_no=${gameName['G_NO']}">#${gameName['G_NAME_KOR']} &emsp;</a> &nbsp;
					</c:forEach>


					<!-- 추천 -->
					<br /> <br />
					<div align="center" class="tooltip-purple">
					<sec:authorize access="isAuthenticated()">
						<input class="good" type="image" src="images/board_hj/good.png"
							name="button" id="rec_btn" value="${content_view['BW_NO']}"
							data-toggle="tooltip" data-container=".tooltip-purple"
							data-placement="top" title="추천 +1">
						<p>
							<span>(</span><span class="rec">${content_view['BW_RECOMMEND_NUM']}</span><span>)</span>
						</p>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<input class="good" type="image" src="images/board_hj/good.png"
							id="rec_btn" Onclick="location.href='/loginview'"
							data-toggle="tooltip" data-container=".tooltip-purple"
							data-placement="top" title="추천 +1">
						<p>
							<span>(</span><span class="rec">${content_view['BW_RECOMMEND_NUM']}</span><span>)</span>
						</p>
					</sec:authorize>
					</div>

					<br />
					<br />
					<!-- 목록보기와 수정, 삭제, 신고 -->
					<form action="/list_home" method="get">
						<div class="test">
							<div class="test_item first">
								<input type="hidden" id="bt_no" value="${content_view['BT_NO']}">
								<input type="button" onclick = "toList()" value="목록" class="btn btn-lavender btn-md">
							</div>
							<div class="test_item fifth">
								<c:if test="${content_view['M_NO'] != memberVO.m_no}">
								<sec:authorize access="isAuthenticated()">
									<a id="scrap" data-bt="${content_view['BT_NAME']}" data-no="${content_view['BW_NO']}">스크랩</a>
								</sec:authorize>
								</c:if>
								<sec:authorize access="isAnonymous()">
									<a href="loginview">스크랩</a>
								</sec:authorize>
							</div>
							<div class="test_item fourth">
								<c:if test = "${content_view['M_NO'] != memberVO.m_no}">
								<sec:authorize access="isAuthenticated()">
									<a href="report_view_bw?bw_no=${content_view['BW_NO']}"
									onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;">신고</a>
								</sec:authorize>
								</c:if>
								<sec:authorize access="isAnonymous()">
									<a href="loginview">신고</a>
								</sec:authorize>
							</div>
							<div class="test_item third">
								<c:if test = "${content_view['M_NO'] eq memberVO.m_no}">
									<a href="delete?bw_no=${content_view['BW_NO']}">삭제</a>
								</c:if>	
							</div>
							<div class="test_item second"> 
								<c:if test = "${content_view['M_NO'] eq memberVO.m_no}">
									<a href="board_modify_view?bw_no=${content_view['BW_NO']}">수정</a>
								</c:if>
							</div>
						</div>
					</form>
					<!-- 댓글부분 -->
					<%-- <%@ include file="/WEB-INF/views/content/comment_view_bw.jsp" %> --%>
						<c:choose>
							<c:when test="${content_view['BT_NO'] == 1}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:when test="${content_view['BT_NO'] == 2}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:when test="${content_view['BT_NO'] == 3}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:when test="${content_view['BT_NO'] == 4}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:when test="${content_view['BT_NO'] == 5}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:when test="${content_view['BT_NO'] == 6}">
								<c:import url="/comment_view_bw">
									<c:param name="cm_type" value="게시판"></c:param>
									<c:param name="cm_no2" value="${content_view['BW_NO']}"></c:param>
								</c:import>
							</c:when>
							
							<c:otherwise>
								<%@ include file="/WEB-INF/views/content/comment_view_bw.jsp" %>
							</c:otherwise>
						</c:choose>
					
					<!-- 댓글 쓰기 -->
					<div class="comment-form-wrap pt-5">
						<%@ include file="/WEB-INF/views/content/comment_write_view_bw.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->

	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>

	<!-- <script src="js/board_hj/jquery.slicknav.min.js"></script> -->

	<script src="js/board_hj/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hj/jquery.sticky-sidebar.min.js"></script>

	<!-- <script src="js/board_hj/bootstrap.min.js"></script> -->

	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<!-- <script src="js/board_hj/custom.js"></script> -->

	<script src="js/board_hj/main.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/recommend.js"></script>
	<script src="js/board_hj/popover.js"></script>
	
	<script src="js/board_hs/toList.js"></script>

	
	<!-- ====================스크랩기능============================== -->
	<script src="js/admin/scrap.js"></script>

	<!-- Java Script for header
    ================================================== -->
	<script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<script src="js/header/scroll.js"></script>

	<!-- Java Script for footer
    ================================================== -->
	<script src="js/footer/footer_hee.js"></script>
	

</body>
</html>