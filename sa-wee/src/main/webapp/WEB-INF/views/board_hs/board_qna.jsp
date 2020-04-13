<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h3>질문 & 답변</h3>
					<p>질문하고 답하고 하세요</p>
				</div>


				<!-- Search Bar  -->
				<div class="search">		
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
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="검색을 해라">
							<button type="submit" class="btn" id="searchBtn">
								<i class="icon-search"></i>
							</button>
						</div>
					 </div>




				<!-- 리스트 -->
				<div class=tab-table>
					<!-- 탭부분 -->
					<ul class="tab">
						<li class="current" data-tab="tab1"><button type = "button" 
							onclick ="location.href='board_qna'" >전체보기</button></li>
						<li data-tab="tab2" id = "룰"><button type = "button" value = "14" class = "select"
							onclick ="location.href='board_qna?s_content=룰'">룰</button></li>
						<li data-tab="tab3" id = "추천"><button type = "button" value = "15" class= "select"
							onclick ="location.href='board_qna?s_content=추천'">추천</button></li>
						<li data-tab="tab4" id = "기타"><button type = "button" value = "16" class = "select"
							onclick ="location.href='board_qna?s_content=기타'">기타</button></li>
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
								<td class = "cell">${dto['S_CONTENT']}</td>
								<td class = "cell"><a href="content_view?bw_no=${dto['BW_NO']}">${dto['BW_TITLE']}</a>  [${dto['CM']}]</td>
								<td class = "cell">${dto['M_NICK']}</td>
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
					</div>
				</div>
				
				<div class="Page navigation example">
						<ul class ="pagination">
							<c:if test="${pageMaker.prev}">
								<li class = "page-item"><a class = "page-link"
									href="board_qna${pageMaker.makeSearch(pageMaker.startPage - 1)}&s_content=${s_content}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li class = "page-item"><a class = "page-link" href="board_qna${pageMaker.makeSearch(idx)}&s_content=${s_content}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class = "page-item"><a class = "page-link"
									href="board_qna${pageMaker.makeSearch(pageMaker.endPage + 1)}&s_content=${s_content}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
				

				<!-- 버튼에 링크 걸기 -->
				<button class="write-view-btn" type="button"
					onclick="location.href='board_write_view?bt_no=5'">글쓰기</button>


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
	<script src="js/header/scroll.js"></script>
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	
	<script src="js/footer/footer_hee.js"></script>
	<script src="js/board_hs/button.js"></script>

</body>
</html>