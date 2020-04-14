<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"
	rel="stylesheet">
<!--         <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'> -->
</head>
<body>
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/admin/chart/tab.js" type="text/javascript"></script>
	<!-- 차트 Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="js/admin/chart/chart_out.js" type="text/javascript"></script>




	<%@include file="side.jsp"%>

	<!--/.span3-->
	<div class="span9">
		<div class="content">
			<div class="module">

				<div class="module-head">
					<h3>탈퇴사유 - 객관적</h3>
				</div>


				<div class="module-body">
					
						<div class="chart">
							<canvas id="myChart"></canvas>
						</div>

				</div>
				
				



			</div>
			
			
			<div class="module">
				<div class="module-head">
					<h3>탈퇴사유 - 주관적 </h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<script>
								      $(function(){
											  $('#searchBtn').click(function() {
											  	event.preventDefault(); // event canceled 막기!
											    	self.location = "withdrawer_list" 
											    				+ '${pageMaker.makeQuery(1)}' 
											    				+ "&searchType=" 
											    				+ $("#searchType option:selected").val() 
											    				+ "&keyword=" 
											    				+ encodeURIComponent($('#keywordInput').val());
											  });
											}); 
								   </script>
								<div class="dropdown">
									
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "a" class="btn" <c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>아이디</option><!-- memberVO랑 JOIN 한 값..!! -->
											<option value = "b" class="btn" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>탈퇴 사유</option>
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

					</form>
				<!-- 	<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">전체보기</button>
						<button type="button" class="btn">회원</button>
						<button type="button" class="btn">게시글</button>
						<button type="button" class="btn">댓글</button>
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
							<td class="cell">회원 아이디</td>
							<td class="cell">탈퇴 사유</td> 
							<td class="cell">탈퇴일</td>
							
						</tr>
						<tbody>
		
							<c:forEach var="wd" items="${withdrawer_list}">
								<tr class="trow">
									<td class="cell">${wd['M_ID']}</td>
									<td class="cell title">${wd['WR_REASON']}</td><!-- view 따로 만들지 않고 내용 목록에서 다 볼 수 있도록 -->
									<td class="cell">${wd['M_OUTDATE']}</td>
								</tr>
							</c:forEach>
						</tbody>
						
							
						
						
					</table>
					</div>
					
					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="withdrawer_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="withdrawer_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="withdrawer_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
			</div>

		</div>


	</div>
	<!--/.content-->
	</div>
	<!--/.span9-->
	</div>
	</div>
	<!--/.container-->
	</div>
	<!--/.wrapper-->
	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b>All rights
			reserved.
		</div>
	</div>

	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>





</body>
</html>