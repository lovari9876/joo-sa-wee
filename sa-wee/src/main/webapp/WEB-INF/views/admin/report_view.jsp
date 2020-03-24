<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edmin</title>
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

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/admin/fetchPage.js" type="text/javascript"></script>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>신고관리</h3>
				</div>



				<!-- 본문 -->

				<div class="view-section">
					<div class="view-container">


						<div class="content-view">

							 <form action="" method = "post" enctype="multipart/form-data">
							 <input type = "hidden" name = "r_no" value = "${report_view.r_no}">
								<table class="table" >
									<tr class="row">
										<td class="cell span2">신고한 회원</td>
										<td class="cell span3">${report_view.m_no}</td>
										<td class="cell span2">신고 타입</td>
										<td class="cell span3">${report_view.r_type}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">신고 대상</td>
										<td class="cell">${report_view.r_type_no}</td>
										<td class="cell">신고일</td>
										<td class="cell">${report_view.r_report_date}</td>
									</tr>

									<tr class="row">
										<td class = "cell span1">신고 내용</td>
										<td colspan= "3" class="cell span8">${report_view.r_content}</td>
									</tr>


								</table>
								<div class="module-option clearfix">
									<div class="control-group">
										<div class="controls">
											<button type="button" class="btn  pull-left"
												onclick="location='report_list'">목록</button>
												<!-- 댓글의 경우 무인도 행 없이 바로 삭제이므로 무인도행 버튼 출력안함 
												해당 신고당한 대상의 타입을 받아와 댓글이라면 출력 하지 않는다! ㄴ-->
												<c:if test="${report_view.r_type != '댓글'}">
													<button type="submit" class="btn  pull-right">무인도행</button>
												</c:if>
											<button type="submit" class="btn  pull-right">삭제 / 탈퇴</button>

										</div>
									</div>
								</div>


							</form> 




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

	<!-- <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script> -->
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>