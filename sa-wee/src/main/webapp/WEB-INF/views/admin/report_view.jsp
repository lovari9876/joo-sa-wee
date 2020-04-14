<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜포맷 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>
	
	<!-- 403 에러 / csrf 토큰 문제 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
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

							<form id="viewForm" method="post">
							<!-- security -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							
							<input type = "hidden" name = "r_no" value = "${report_view['R_NO']} ${report_view['R_TYPE_NO']}">
							<!-- get방식으로 url뒤에 붙는 값과 name이 맞지않으면 오류가난다. r_no, r_type외의 다른 값이 추가되면(해당 메소드에서 파라미터로 받으면) 오류가 난다... 
							그래서 띄어쓰기 기준으로 값을 두가지 보내서 탈퇴처리할 신고당한 회원 번호를 가져옴  -->
							<input type = "hidden" name = "r_type" value = "${report_view['R_TYPE']}">
							
								<table class="table" >
									<tr class="row">
										<td class="cell span2">신고한 회원</td>
										<td class="cell span3">${report_view['M_ID']}</td>
										<td class="cell span2">신고 타입</td>
										<td class="cell span3">${report_view['R_TYPE']}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">신고 대상</td>
										<td class="cell" colspan= "3">
											<c:if test="${report_view['R_ID'] eq null}">삭제된 글입니다....</c:if>
											<c:choose>
												<c:when test="${report_view['R_TYPE'] == '회원'}">
													<a href="">${report_view['R_ID']}</a>
												</c:when>
												<c:when test="${report_view['R_TYPE'] == '댓글'}">
													<c:choose>
														<c:when test="${report_view['CM_TYPE'] == '게시판'}">
															<a href="/content_view?bw_no=${report_view['CM_NO2']}">${report_view['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${report_view['CM_TYPE'] == '카페리뷰'}">
															<a href="/content_view_cr?cr_no=${report_view['CM_NO2']}">${report_view['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${report_view['CM_TYPE'] == '증고거래'}">
															<a href="/content_view_t?t_no=${report_view['CM_NO2']}">${report_view['CM_CONTENT']}</a>
														</c:when>
													</c:choose>
													
												</c:when>
												<c:when test="${report_view['R_TYPE'] == '게시글'}">
													<a href="/content_view?bw_no=${report_view['BW_NO']}">${report_view['BW_TITLE']}</a>
												</c:when>
												<c:when test="${report_view['R_TYPE'] == '카페리뷰'}">
													<a href="/content_view_cr?cr_no=${report_view['CR_NO']}">${report_view['CR_TITLE']}</a>
												</c:when>
												<c:when test="${report_view['R_TYPE'] == '중고거래'}">
													<a href="/content_view_t?t_no=${report_view['T_NO']}">${report_view['T_TITLE']}</a>
												</c:when>
											</c:choose>
										
										</td>
									</tr>
									
									<tr class="row">
										<td class="cell">신고 받은 횟수</td>
										<td class="cell">
											<c:choose>
												<c:when test="${report_view['R_TYPE'] == '회원'}">${report_view['M_REPORT_NUM']}</c:when>
												<c:when test="${report_view['R_TYPE'] == '댓글'}">${report_view['CM_REPORT_NUM']}</c:when>
												<c:when test="${report_view['R_TYPE'] == '게시글'}">${report_view['BW_REPORT_NUM']}</c:when>
											</c:choose>	
											
										</td>
										<td class="cell">신고일</td>
										<td class="cell"><fmt:formatDate value="${report_view['R_REPORT_DATE']}"  type="both" pattern="yyyy.MM.dd hh:mm:ss"/></td>
									</tr>


									<tr class="row">
										<td class = "cell span1">신고 내용</td>
										<td colspan= "3" class="cell span8">${report_view['R_CONTENT']}</td>
									</tr>


								</table>
								<div class="module-option clearfix">
									<div class="control-group">
										<div class="controls">
											<button type="button" class="btn  pull-left"
												onclick="location='report_list'">목록</button>
												<!-- 댓글의 경우 무인도 행 없이 바로 삭제이므로 무인도행 버튼 출력안함 
												해당 신고당한 대상의 타입을 받아와 댓글이라면 출력 하지 않는다! -->
												
												<c:choose>
													<c:when test="${report_view['R_TYPE'] == '댓글'}">
														<button type="submit" class="btn  pull-right" onClick='comment_delete()'>삭제</button>
													</c:when>
												
													<c:when test="${report_view['R_TYPE'] == '회원'}">
														<button type="submit" class="btn  pull-right" onClick='m_island()'>무인도행</button>
														<button type="submit" class="btn  pull-right" onClick='m_out()'>탈퇴</button>
													</c:when>
													
													<c:when test="${report_view['R_TYPE'] == '게시글' || report_view['R_TYPE'] == '중고거래' || report_view['R_TYPE'] == '카페리뷰'}">
														<button type="submit" class="btn  pull-right" onClick='island()'>무인도행</button>
														<button type="submit" class="btn  pull-right" onClick='board_delete()'>삭제</button>
													</c:when>
												</c:choose>	
												
											

										</div>
									</div>
								</div>


							</form> 
							<script>
								function m_out(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/outMember_report'/>";
									out.submit();
									console.log("out");
									alert("해당 회원이 탈퇴처리 되었습니다.");
								}
								
								function comment_delete(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/commentDelete'/>";
									out.submit();
									console.log("out");
									alert("해당 댓글이 삭제되었습니다.");
								}
								
								function board_delete(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/boardDelete'/>";
									out.submit();
									console.log("out");
									alert("해당 글이 삭제되었습니다.");
								}
								
								function island(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/island'/>";
									out.submit();
									console.log("out");
									alert("해당 글이 무인도로 이동되었습니다.");
								}
								
								function m_island(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/m_island'/>";
									out.submit();
									console.log("out");
									alert("해당 회원이 무인도로 이동되었습니다.");
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

	<!-- <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script> -->
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>