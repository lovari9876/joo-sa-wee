<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<link rel="stylesheet" href="css/board_hs/liststyle.css" />


</head>
<body id = "top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	
	
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="listName">
					<h3>개봉기 및 리뷰</h3>
					<p>개봉하고 리뷰 남기세요</p>
				</div>
				<script>
				      $(function(){
							  $('#searchBtn').click(function() {
							  	event.preventDefault(); // event canceled 막기!
							    	self.location = "board_open_review" 
							    				+ '${pageMaker.makeQuery(1)}' 
							    				+ "&searchType=" 
							    				+ $("#searchType option:selected").val() 
							    				+ "&s_content=" 
							    				+ "${s_content}"
							    				+ "&keyword=" 
							    				+ encodeURIComponent($('#keywordInput').val());
							  });
							}); 
				  </script>


				<!-- Search Bar  -->
				<form>
					<div class="search">		
						 <div class="dropdown pull-right">
								<select id="searchType" name="searchType" class="span2">
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
					<ul class="tab">
						<li <c:out value="${s_content eq null ? 'class = current' : ''}"/>  data-tab="tab1"><button type = "button" 
							onclick ="location.href='board_open_review'" >전체보기</button></li>
						<li <c:out value="${s_content == '개봉기' ? 'class = current' : ''}"/> data-tab="tab2" id = "개봉기"><button type = "button" value = "4" class = "select"
							onclick ="location.href='board_open_review?s_content=개봉기'" >개봉기</button></li>
						<li <c:out value="${s_content == '일 리뷰' ? 'class = current' : ''}"/> data-tab="tab3" id = "일리뷰"><button type = "button" value = "5" class= "select"
							onclick ="location.href='board_open_review?s_content=일 리뷰'" >일(一)리뷰</button></li>
						<li <c:out value="${s_content == '다 리뷰' ? 'class = current' : ''}"/> data-tab="tab4" id = "다리뷰"><button type = "button" value = "6" class = "select"
							onclick ="location.href='board_open_review?s_content=다 리뷰'" >다<span style = "font-family:dunggeunmo!important">(多)</span>리뷰</button></li>
					</ul>


					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current">
						
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">말머리</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						<tbody class = "tbody">
							<c:forEach items="${list}" var="dto">
							<tr class="row">
								<td class = "cell">${dto['RNUM']}</td>
								<td class = "cell">
									<c:choose>
										<c:when test="${dto['S_CONTENT'] eq '다 리뷰'}">
											다<span style = "font-family:dunggeunmo!important">(多)</span>리뷰
										</c:when>
										<c:when test="${dto['S_CONTENT'] eq '일 리뷰'}">
											일(一)리뷰
										</c:when>
										<c:otherwise>
											${dto['S_CONTENT']}
										</c:otherwise>
									</c:choose>
								</td>
								<td class = "cell"><a href="content_view?bw_no=${dto['BW_NO']}">${dto['BW_TITLE']}</a>  [${dto['CM']}]</td>
								<td class = "cell">
									<sec:authorize access="isAuthenticated()">	
										<a class="pointer" role = "button" class="pop_btn popovers"
										data-toggle="popover" 
										data-content="<a href='#' id='other_page' data-nick='${dto["M_NICK"]}' onclick='return false;' >회원정보보기</a>
										<br/>
														<a href='#' id='send_message' data-nick='${dto["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
										<br/>			
														<a href='report_view_m?m_no=${dto["M_NO"]}&bw_no=${dto["BW_NO"]}'>신고하기</a>">
										${dto['M_NICK']}
										</a>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										${dto['M_NICK']}
									</sec:authorize>			
								</td>
								<td class = "cell">
									<jsp:useBean id="today" class="java.util.Date" />
									<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
									<fmt:formatDate value="${dto['BW_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${dto['BW_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
								</td>
								<td class = "cell">${dto['BW_HIT']}</td>
								<td class = "cell">${dto['BW_RECOMMEND_NUM']}</td>
							</tr>
							</c:forEach>
						</tbody>

						</table>

					</div>

					
					<!-- 여기서부터는 말머리 선택 부분이라  -->
					<!-- <div id="tab2" class="tabcontent">
						
						<table class="table">

							
							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>
							
							<tbody class = "tbody test">
							
						</tbody>
							
							

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

							<tbody class = "tbody test">
							
						</tbody>
							
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

						
							<tbody class = "tbody test">
							
						</tbody>
							
							
						</table>
					</div> -->
					
				</div>
				
				<div class="Page navigation example">
						<ul class = "pagination">
							<c:if test="${pageMaker.prev}">
								<li class = "page-item"><a class = "page-link"
									href="board_open_review${pageMaker.makeSearch(pageMaker.startPage - 1)}&s_content=${s_content}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li class = "page-item"><a class = "page-link" href="board_open_review${pageMaker.makeSearch(idx)}&s_content=${s_content}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class = "page-item"><a class = "page-link"
									href="board_open_review${pageMaker.makeSearch(pageMaker.endPage + 1)}&s_content=${s_content}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
				

				<!-- 버튼에 링크 걸기 -->
				<c:if test="${r_no != 4}" > 	
					<sec:authorize access="isAnonymous()">
					<button class="write-view-btn" type="button"
						onclick="location.href='loginview'">글쓰기</button>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<button class="write-view-btn" type="button"
						onclick="location.href='board_write_view?bt_no=2'">글쓰기</button>
					</sec:authorize>
				</c:if>
			</div>
		</div>
	</div>
	
	
	
	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->
	


	<!--====== Javascripts & Jquery ======-->
	
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/header/scroll.js"></script>
<!-- 	<script src="js/board_hs/tab.js"></script> -->
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	
	<script src="js/footer/footer_hee.js"></script>
	<script src="js/board_hs/button.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/popover.js"></script>
	
	<script src="js/mypage/other_page.js"></script>
	
</body>
</html>