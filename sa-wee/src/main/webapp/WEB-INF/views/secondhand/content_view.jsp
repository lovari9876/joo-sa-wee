<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- collapse -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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

<!-- 테이블 -->
<link rel="stylesheet" href="css/secondhand/tablestyle.css" />
<!-- 버튼 -->
<link rel="stylesheet" href="css/secondhand/buttonstyle.css" />

<!-- tooltip, popover, modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- collapse -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<!-- modal -->	
<link rel="stylesheet" href="css/secondhand/modalstyle.css" />

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
								<h4 id="community">${content_view_t['S_CONTENT']}</h4> 
								<span class="slash">&bullet;</span> 
								<span class="slash"></span>
							</div>
							<div class="title_item second">
								<span class="slash">추천수(</span>
									<span class="slash rec">${content_view_t['T_RECOMMEND_NUM']}</span>
									<span class="slash">)</span> 
								<span class="slash">&bullet;</span>
								<span class="slash">조회수(${content_view_t['T_HIT']})</span>
							</div>
						</div>
						<div>
							<span class="text-white">작성자 ${content_view_t['M_NICK']}</span>
							<span class="slash">&bullet;</span> 
							<span class="text-white">작성일 
							    <!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
								<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
								<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
								<fmt:formatDate value="${content_view_t['T_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${content_view_t['T_WRITTEN_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	
							</span> 
							<span class="slash">&bullet;</span>
							<span class="text-white">수정일 
								<fmt:formatDate value="${content_view_t['T_UPDATED_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${content_view_t['T_UPDATED_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	
							</span>
						</div>
					</div>
					<br />
					<!-- 게시글 제목 -->
					<h2 class="text-white">${content_view_t['T_TITLE']}</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- 게시글 본문 -->
	<section class="site-section" id="next-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 blog-content">
					<!-- 게임, 가격 갖고오는 테이블 -->
					<div class="table--div">
						<table class="write-table">
							<tr class="table--row">
								<th class="table--cell">보드게임</th>
								<th class="table--cell">희망가격</th>
							</tr>
							<c:forEach items="${tgList}" var="tgItem">
								<tr class="table--row">
									<c:choose>
										<c:when test="${tgItem.g_no eq 0}">	
											<td class="table--cell">${tgItem.tg_name}</td>							
										</c:when>
										<c:otherwise>
											<td class="table--cell"><a href="game_detail?g_no=${tgItem.g_no}">${tgItem.tg_name}</a></td>
										</c:otherwise>
									</c:choose>	
										<td class="table--cell">${tgItem.tg_price}원</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<p>${content_view_t['T_CONTENT']}</p>
					
					<c:forEach items="${fileName}" var = "img">
						<img src="<c:url value="/img/${img['F_NAME']} "/>" />
					</c:forEach> 
					
					

					<br/>
					<br/>
	
					<!-- ** 거래하기 버튼 및 모달: 일단 판매시에만 나타나도록! -->
					<!-- && 본인 글에서는 구매하기 버튼 미출력! && 표류자도 못사요 -->		
					<c:if test="${content_view_t['S_NO']==32 && content_view_t['M_NO'] != m_no && memberVO.r_no != 4}" > 	
						<!-- 구매하기 버튼: open modal -->
						<sec:authorize access="isAuthenticated()">
							<div align="center" class="buy--button" >
								<button id ="myBtn" class="write-btn lavender-btn" type="button" >거래하기</button> 
								<!-- <a class="" data-modal href="#myModal">거래하기</a>  -->
							</div>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<div align="center">
								<button class="write-btn lavender-btn" type="button" 
								onclick="location.href='loginview' ">거래하기</button> 
							</div>
						</sec:authorize>
					</c:if>					  
					<br />							
					<br />	

					
					<!-- 목록보기와 수정, 삭제, 신고 -->
					<form action="/tlist" method="get">
						<div class="test">
							<div class="test_item first">
								<input type="submit" value="목록" class="btn btn-lavender btn-md">
							</div>
							<div class="test_item fourth">
								<c:if test = "${content_view_t['M_NO'] != m_no}">
								<sec:authorize access="isAuthenticated()">
									<a href="report_view_t?t_no=${content_view_t['T_NO']}"
									onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;">신고</a>
								</sec:authorize>
								</c:if>
								<sec:authorize access="isAnonymous()">
									<a href="loginview">신고</a>
								</sec:authorize>
							</div>
							<div class="test_item third"> 
								<!-- 결제 테이블에 없는 것만 삭제 가능(&& pCnt==0) -->
								<c:if test = "${content_view_t['M_NO'] eq m_no && pCnt==0}">
									<a href="delete_t?t_no=${content_view_t['T_NO']}" 
									   onclick="alert('삭제되었습니다.');">삭제</a>
								</c:if>
								<!-- 삭제 버튼 공갈로 만들고 삭제불가 처리 -->
								<c:if test = "${content_view_t['M_NO'] eq m_no && pCnt!=0}">
									<a onclick="alert('구매 요청이 발생한 글은 삭제하실 수 없습니다.');">삭제</a>
								</c:if>
							</div>
							<div class="test_item second">
								<c:if test = "${content_view_t['M_NO'] eq m_no}">
									<a href="trade_modify_view?t_no=${content_view_t['T_NO']}">수정</a>
								</c:if>
							</div>
						</div>
					</form>


					<!-- 댓글부분 -->
					<%-- <%@ include file="/WEB-INF/views/content/comment_view_T.jsp" %> --%>
						<c:choose>
							<c:when test="${content_view_t['BT_NO'] == 9}">
								<c:import url="/comment_view_t">
									<c:param name="cm_type" value="중고거래"></c:param>
									<c:param name="cm_no2" value="${content_view_t['T_NO']}"></c:param>
								</c:import>
							</c:when>
							<c:otherwise>
								<%@ include file="/WEB-INF/views/content/comment_view_bw.jsp" %>
							</c:otherwise>
						</c:choose>
						
						<%-- <c:param name="cm_type" value="${board_typeVO.bt_no}"></c:param>
						<c:param name="cm_no2" value="${content_view.bw_no}"></c:param> --%>
					
					<!-- 댓글 쓰기 -->
					<div class="comment-form-wrap pt-5">
						<%@ include file="/WEB-INF/views/content/comment_write_view_t.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 모달은 바디 바로 안쪽에 넣어야 헤더 및 다른 최상위 객체가 위로 올라오지 않음!! -->
	<!-- modal include start -->
	<%@ include file="/WEB-INF/views/secondhand/modal_view.jsp" %>
	<!-- modal include end -->

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

	<script src="js/board_hj/bootstrap.min.js"></script>

	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script src="js/board_hj/main.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<!-- <script src="js/board_hj/recommed_t.js"></script> -->
	<script src="js/board_hj/popover.js"></script>

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