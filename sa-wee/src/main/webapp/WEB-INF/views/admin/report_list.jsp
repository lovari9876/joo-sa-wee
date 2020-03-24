<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edmin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>신고관리</h3>
				</div>
				<div class="module-option clearfix">
					<form role="form" method="get">
					<div class = "search">
						<div class="control-group">

							<div class="controls">
								<div class="dropdown">
										<select name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>


										</select>
								</div>
							
								<div class="input-append pull-left">
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span3" placeholder="검색을 해라">
									<button type="submit" class="btn" id="serchBtn">
										<i class="icon-search"></i>
									</button>
									
									<script>
								      $(function(){
								        $('#searchBtn').click(function() {
								          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								        });
								      });   
								    </script>
								</div>


							</div>
						</div>
						<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn __all" value="">전체보기</button>
						<button type="button" class="btn __member" value="회원">회원</button>
						<button type="button" class="btn __board" value="게시글">게시글</button>
						<button type="button" class="btn __comment" value="댓글">댓글</button>
					</div>
					</div>
					</form>
					
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class="table_mobile">
						<table class="table">
							<tr class="trow header">
								<td class="cell">신고 번호</td>
								<td class="cell">신고 대상</td>
								<td class="cell title">신고 내용</td>
								<!-- 미리보기! 길면 ...으로 표시 ! 목록에서 선택시 content_view 페이지로 이동,  
								 신고한 회원과, 신고당한 대상 이름, 내용 등 표시 -->
								<td class="cell">신고일</td>
							</tr>
								<tbody id="ajax_test"> 
							<c:forEach items="${report_list}" var="report">
								<tr class="trow" onClick="location.href='report_view?r_no=${report.r_no}'">
									<td class="cell">${report.r_no}</td>
									<td class="cell">${report.r_type}</td>
									<td class="cell title">${report.r_content}</td>
									<td class="cell">${report.r_report_date}</td>
								</tr>
							</c:forEach>
							</tbody>			
						</table>
					</div>
					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="report_list2${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="report_list2${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="report_list2${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
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
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/admin/board_tab/tab.js" type="text/javascript"></script>
	
	
	
	
</body>
</html>