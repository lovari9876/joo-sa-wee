<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>관리자 | 내사위는주사위</title>
<link type="text/css" href="css/admin/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>FAQ - 자주하는 질문</h3>
				</div>



				<!-- 본문 -->

				<div class="view-section">
					<div class="view-container">


						<div class="content-view">

							 <form id="viewForm" method="post">

							 <input type = "hidden" name = "faq_no" value = "${faq_view.faq_no}">
							 <div class = "table_mobile">
								<table class="table table_view" >
									<tr class="row">
										<td class="cell perspan2">말머리</td>
										<td class="cell perspan4">
											<c:choose>				
													<c:when test="${faq_view.s_no eq 22}">회원</c:when>
													<c:when test="${faq_view.s_no eq 23}">결제</c:when>
													<c:when test="${faq_view.s_no eq 24}">정보 수정</c:when>
													<c:when test="${faq_view.s_no eq 25}">무인도 게시판</c:when>
													<c:when test="${faq_view.s_no eq 26}">기타</c:when>
												</c:choose>
										</td>
										<td class="cell perspan2">조회수</td>
										<td class="cell perspan4">${faq_view.faq_hit}</td>

									</tr>
									<tr class="row">
										<td class="cell perspan2">제목</td>
										<td class="cell perspan11" colspan="3">${faq_view.faq_title}</td>

									</tr>

									<tr class="row">
										<td class="cell">내용</td>
										<td class="cell perspan11" colspan="3">${faq_view.faq_content}</td>
									</tr>

								</table>
								</div>
								<div class="module-option clearfix">
									<div class="control-group">
										<div class="controls">
											<button type="button" class="btn  pull-left"
												onclick="location='faq_list'">목록</button>
											
											<button type="submit" class="btn  pull-right" onClick='faq_delete()'>삭제</button>
											<div class="btn  pull-right"><a href="faq_modify?faq_no=${faq_view.faq_no}">수정</a></div>
											
										
											

										</div>
									</div>
								</div>
							</form> 
							<script>
								
								function faq_delete(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/faqDelete'/>";
									out.submit();
									console.log("delete");
									alert("해당 글이 삭제되었습니다.");
								}
								
							</script>



						</div>
					</div>
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
</body>
</html>