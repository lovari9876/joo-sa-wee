<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600"
	rel="stylesheet">
	
	<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<link rel="stylesheet" href="css/board_hs/liststyle.css" />


</head>
<body id="top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>
	<!-- header include end -->



	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="listName">
					<a href="selectAllReviewList"><h3 style="color:black;">카페 리뷰 리스트</h3></a>
					<p>카페 리뷰 리스트임</p>
				</div>


				<!-- Search Bar  -->
				<form>
					<div class="search" style="margin-top:0px;">
						<div class="dropdown pull-right">
								<select name="searchType" class="span2">
									<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
									<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								</select>
						</div> 
						<div class="input-append pull-right"> 
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="검색어를 입력해주세요">
							<button type="submit" class="btn" id="searchBtn">
								<i class="icon-search"></i>
							</button>
						</div>
					</div>
				</form>




				<!-- 리스트 -->
				<div class=tab-table>
					<!-- 탭부분 -->
					


					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current" style = "margin-top: 70px;">
						<!-- <div class="orderby">
							<button class ="orderbutton">최신순</button>
							<button class ="orderbutton">조회순</button>
							<button class ="orderbutton">추천순</button>
						</div> -->
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td style="width:150px;" class="cell">카페 이름</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						<tbody class = "tbody">
							<c:forEach items="${list}" var="list">
							<tr class="row">
								<td class = "cell">${list['RNUM']}</td>
								<td style="width:150px;" class = "cell"><a href="cafe_info?c_no=${list['C_NO']}">${list['C_TITLE']}</a></td>
								<td class = "cell"><a href="content_view_cr?cr_no=${list['CR_NO']}">${list['CR_TITLE']}</a> [${list['CM']}]</td>
								<td class = "cell">
									<sec:authorize access="isAuthenticated()">	
										<a class="pointer" role = "button" class="pop_btn popovers"
										data-toggle="popover" 
										data-content="<a href='#' id='other_page' data-nick='${list["M_NICK"]}' onclick='return false;' >회원정보보기</a>
										<br/>
														<a href='#' id='send_message' data-nick='${list["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
										<br/>			
														<a href='report_view_m?m_no=${list["M_NO"]}&bw_no=${list["CR_NO"]}'>신고하기</a>">
										${list['M_NICK']}
										</a>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										${list['M_NICK']}
									</sec:authorize>			
								</td>
								<td class = "cell">
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${list['CR_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${list['CR_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
								</td>
								<td class = "cell">${list['CR_HIT']}</td>
								<td class = "cell">${list['CR_RECOMMEND_NUM']}</td>
							</tr>
							</c:forEach>
						</tbody>

						</table>

					</div>

				</div>
				
				<div class="Page navigation example">
						<ul class = "pagination">
							<c:if test="${pageMaker.prev}">
								<li class = "page-item"><a class = "page-link"
									href="selectAllReviewList${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li class = "page-item"><a class = "page-link" href="selectAllReviewList${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class = "page-item"><a class ="page-link"
									href="selectAllReviewList${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>

				
			</div>
		</div>
	</div>



	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp"%>
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
	<script src="js/header/scroll.js"></script>
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/button.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/tabdata.js" type="text/javascript"></script>
	<script src="js/footer/footer_hee.js"></script>
	
	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/popover.js"></script>
	
	<!-- 다른 회원 정보 보기 팝업  -->
	<script src="js/mypage/other_page.js"></script>
	

</body>
</html>