<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜포맷 -->

	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<%@include file="side.jsp"%>

<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>게시글관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
								<select tabindex="1" onchange="categoryChange(this)" data-placeholder="전체게시판" class="span2 pull-left">
										<option value="">전체게시판</option>
										<option value="category_1">보드이야기</option>
										<option value="category_2">개봉기 및 리뷰</option>
										<option value="category_3">보드게임 모임</option>
										<option value="category_4">보드뉴스</option>
										<option value="category_5">질문 n 답변</option>
										<option value="category_6">창작 보드게임</option>
								</select>
									
								<select tabindex="2" id="category" data-placeholder="전체말머리" class="span2 pull-left">
										<option>전체말머리</option>
								</select>
									
									
								<!-- <select tabindex="2" data-placeholder="전체말머리" class="span2 pull-left">
										<option value="">전체말머리</option>
										<option value="Category 1">말머리1</option>
										<option value="Category 2">말머리2</option>
										<option value="Category 3">말머리3</option>
										<option value="Category 4">말머리4</option>
								</select> -->
								
								
								<div class="input-append pull-right"> 
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="검색을 해라">
									<button type="submit" class="btn" id="serchBtn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								 <div class="dropdown pull-right">
										<select name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
										</select>
								</div> 
							</div>
						</div>

					</form>
					
					<div class="btn-group pull-left" >
						<button type="button" class="btn selectDelete_btn" data-Num="${board.bw_no}" >선택 글 삭제</button>
						<button type="button" class="btn">무인도 행</button>
					</div>
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">정렬</button>
						<button type="button" class="btn">조회수</button>
						<button type="button" class="btn">추천수</button>
					</div>
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table">
						<tr class="trow header">
							<td class="cell"><input type="checkbox" name = "allCheck" id = "allCheck" value="0"></td> <!-- 전체선택 처리하기  -->
							<td class="cell">글 번호</td>
							<td class="cell">게시판</td>
							<td class="cell">말머리</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
							<td class="cell">신고수</td>
						</tr><!-- 조회수 추천수 추가..? -->
						
						
						<c:forEach items="${board_list}" var="board">
								<tr class="trow">
									<td class="cell"><input type="checkbox" name="chBox" class="chBox" data-Num="${board.bw_no}"></td>
									<td class="cell">${board.bw_no}</td>
									<td class="cell">${board.bt_no}</td>
									<td class="cell">${board.s_no}</td>
									<td class="cell"><a
										href="board_view?st_no=${board.bw_no}">${board.bw_title}</a></td>
									<td class="cell">${board.m_no}</td>
									<td class="cell"> 
									
									
										<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
										<jsp:useBean id="today" class="java.util.Date" />
										<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
										<fmt:formatDate value="${board.bw_written_date}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${now}</c:when>
											<c:otherwise>
												<fmt:formatDate value="${board.bw_written_date}" pattern="HH:mm:ss"/>
											</c:otherwise>
										</c:choose>
										
										
									</td>
									<td class="cell">${board.bw_report_num}</td>
								</tr>
							</c:forEach>

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="board_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="board_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="board_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
			</div>
		</div>
	</div>
	</section>



	</div>
	</div>
	<!--/.content-->
	</div>
	<!--/.span9-->
	<!-- 		</div>
		</div> -->
	<!--/.container-->
	<!-- 	</div> -->
	<!--/.wrapper-->

	<div class="footer">
		<div class="container">


			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All
			rights reserved.
		</div>
	</div>

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	
	<!-- 체크박스 한번에 전체선택, 선택삭제 -->
	<script src="js/admin/checkBox.js" type="text/javascript"></script>
	
	<!-- 말머리 탭 -->
	<script src="js/admin/board_tab/selectbox.js" type="text/javascript"></script>
	
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>