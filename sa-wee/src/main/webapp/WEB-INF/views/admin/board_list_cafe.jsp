<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜포맷 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<%@include file="side.jsp"%>

<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>게시글관리 - 카페리뷰</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
							<script>
							      $(function(){
											  $('#searchBtn').click(function() {
											  	event.preventDefault(); // event canceled 막기!
											    	self.location = "board_list_cafe" 
											    				+ '${pageMaker.makeQuery(1)}' 
											    				+ "&searchType=" 
											    				+ $("#searchType option:selected").val() 
											    				+ "&keyword=" 
											    				+ encodeURIComponent($('#keywordInput').val());
											  });
											}); 
								   </script>
								<div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "a" class="btn" <c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>카페이름</option>
											<option value = "b" class="btn" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>리뷰제목</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value = "d" class="btn" <c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>작성자</option>
											<option value = "bc" class="btn" <c:out value="${scri.searchType eq 'bc' ? 'selected' : ''}"/>>제목+내용</option>
										</select>
								</div> 
								
								<div class="input-append pull-left"> 
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="조회  / 검색어입력">
									<button type="submit" class="btn" id="serchBtn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								
							</div>
						</div>

					</form>
					<br><br>
					<div class="btn-group pull-left" >
						<button type="button" class="btn selectDelete_btn" data-BW="${cr['BT_NO']} ${cr['CR_NO']}" >선택 글 삭제</button>
						<button type="button" class="btn selectIsland_btn" data-BW="${cr['BT_NO']} ${cr['CR_NO']} ${cr['M_NO']}">무인도 행</button>
					</div>
					<div class="btn-group pull-right" data-toggle="buttons-radio">
							<button type="button" class="btn"
								onclick ="location.href='board_list_cafe?page=1&perPageNum=15&sort=hit'">조회수</button>
							<button type="button" class="btn"
								onclick ="location.href='board_list_cafe?page=1&perPageNum=15&sort=report'">신고수</button>
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
							<td class="cell span1">번호</td>
							<td class="cell">카페 이름</td>
							<td class="cell title span4">리뷰 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
							<td class="cell span1">조회수</td>
							<td class="cell span1">신고수</td>
						</tr><!-- 조회수 추천수 추가..? -->
						
						<tbody>
							<c:forEach items="${board_list_cafe}" var="cr">
									<tr class="trow">
										<td class="cell"><input type="checkbox" name="chBox" class="chBox" data-BW="${cr['BT_NO']} ${cr['CR_NO']} ${cr['M_NO']}"></td>
										<td class="cell">${cr['RNUM']}</td>
										<td class="cell">${cr['C_TITLE']}</td>
										<td class="cell title"><a
											href="/content_view_cr?cr_no=${cr['CR_NO']}">${cr['CR_TITLE']} (${cr['CM']})</a></td>
										<td class="cell">${cr['M_ID']}</td>
										<td class="cell"> 
											<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${cr['CR_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when>
												<c:otherwise>
													<fmt:formatDate value="${board['BW_WRITTEN_DATE']}" pattern="HH:mm:ss"/>
												</c:otherwise>
											</c:choose>
											
										</td>
										<td class="cell">${cr['CR_HIT']}</td>
										<td class="cell">${cr['CR_REPORT_NUM']}</td>
									</tr>
								</c:forEach>
							</tbody>

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="board_list_cafe${pageMaker.makeSearch(pageMaker.startPage - 1)}&sort=${sort}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="board_list_cafe${pageMaker.makeSearch(idx)}&sort=${sort}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="board_list_cafe${pageMaker.makeSearch(pageMaker.endPage + 1)}&sort=${sort}"><i
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

	
	<!-- 체크박스 한번에 전체선택, 선택삭제 -->
	<script src="js/admin/checkBox.js" type="text/javascript"></script>
	<script src="js/admin/island.js" type="text/javascript"></script>
	
	<script src="js/admin/board_tab/selectbox.js" type="text/javascript"></script>
	
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
		
		
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>