<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	<%@include file="side.jsp"%>

<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>무인도관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
							<script>
								      $(function(){
												  $('#searchBtn').click(function() {
												  	event.preventDefault(); // event canceled 막기!
												    	self.location = "board_list" 
												    				+ '${pageMaker.makeQuery(1)}' 
												    				+ "&bt_no="
												    				+ $("#board option:selected").val()
												    				+ "&searchType=" 
												    				+ $("#searchType option:selected").val() 
												    				+ "&keyword=" 
												    				+ encodeURIComponent($('#keywordInput').val());
												  });
												}); 
								   </script>
								   
							
							
									
							
								
								<div class="input-append pull-right"> 
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="검색을 해라">
									<button type="submit" class="btn" id="searchBtn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								 <div class="dropdown pull-right">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
										</select>
								</div> 
								
								<select id="bt_no" name="bt_no" data-placeholder="전체게시판" class="span2 pull-right">
									<option value="0" <c:out value="${bt_no == null ? 'selected' : ''}"/>>전체게시판</option>
									<option value="1" <c:out value="${bt_no eq 1 ? 'selected' : ''}"/>>보드이야기</option>
									<option value="2" <c:out value="${bt_no eq 2 ? 'selected' : ''}"/>>개봉기 및 리뷰</option>
									<option value="3" <c:out value="${bt_no eq 3 ? 'selected' : ''}"/>>보드게임 모임</option>
									<option value="4" <c:out value="${bt_no eq 4 ? 'selected' : ''}"/>>보드뉴스</option>
									<option value="5" <c:out value="${bt_no eq 5 ? 'selected' : ''}"/>>질문과 답변</option>
									<option value="6" <c:out value="${bt_no eq 6 ? 'selected' : ''}"/>>창작 보드게임</option>
									<option value="8" <c:out value="${bt_no eq 8 ? 'selected' : ''}"/>>일대일 문의</option>
									<option value="9" <c:out value="${bt_no eq 9 ? 'selected' : ''}"/>>보부상</option>
									<option value="10" <c:out value="${bt_no eq 10 ? 'selected' : ''}"/>>카페</option>
									<option value="11" <c:out value="${bt_no eq 11 ? 'selected' : ''}"/>>카페리뷰</option>
								</select>
								
								
							</div>
						</div>

					</form>
					
					<div class="btn-group pull-left" >
						<button type="button" value="island" class="btn selectDelete_btn" data-BW="${island['BT_NO']} ${island['I_NO']}">선택 글 삭제</button>
						<button type="button" class="btn selectConfirm_btn" data-BW="${island['BT_NO']} ${island['I_NO']} ${island['M_NO']}">수정완료</button>
					</div>
				<!-- 	<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">정렬</button>
						<button type="button" class="btn">조회수</button>
						<button type="button" class="btn">추천수</button>
					</div> -->
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
							<td class="cell span4">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
							<td class="cell">신고수</td>
							<td class="cell">상태</td>
						</tr><!-- 조회수 추천수 추가..? -->
						<tbody>
						
							<c:forEach items="${island_list}" var="island">
									<tr class="trow">
										<td class="cell"><input type="checkbox" name="chBox" class="chBox" data-BW="${island['BT_NO']} ${island['I_NO']} ${island['M_NO']}"></td>
										<td class="cell">${island['RNUM']}</td>
										<td>
											<c:choose>				
													<c:when test="${island['BT_NO'] eq 1}">보드이야기</c:when>		
													<c:when test="${island['BT_NO'] eq 2}">개봉기 및 리뷰</c:when>
													<c:when test="${island['BT_NO'] eq 3}">보드게임 모임</c:when>
													<c:when test="${island['BT_NO'] eq 4}">보드 뉴스</c:when>
													<c:when test="${island['BT_NO'] eq 5}">질문&답변</c:when>
													<c:when test="${island['BT_NO'] eq 6}">창작 보드게임</c:when>
													<c:when test="${island['BT_NO'] eq 8}">일대일 문의</c:when>
													<c:when test="${island['BT_NO'] eq 9}">보부상</c:when>
													<c:when test="${island['BT_NO'] eq 11}">카페 리뷰</c:when>
													<c:otherwise>불명확</c:otherwise>
												</c:choose>
											</td>
										<td class="cell title"><a href="/content_view_i?i_no=${island['I_NO']}&bt_no=${island['BT_NO']}">${island['I_TITLE']}</a></td>
										<td class="cell">${island['M_ID']}</td>
										<td>
												<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${island['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${island['I_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="cell">${island['I_REPORT_NUM']}</td>
										<td class="cell">
											<c:if test="${island['I_ISLAND'] eq 1}">수정 전</c:if>	
											<c:if test="${island['I_ISLAND'] eq 2}">수정 완료</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="island_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="island_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="island_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
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
	
	<!-- 선택한 글들 무인도에서 원래있던곳으로 복구 -->
	<script src="js/admin/island_confirm.js" type="text/javascript"></script>
	
	
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
		
		
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>