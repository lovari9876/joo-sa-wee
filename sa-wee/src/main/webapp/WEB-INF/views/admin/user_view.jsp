<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h3>회원관리</h3>
				</div>



				<!-- 본문 -->

				<div class="view-section">
					<div class="view-container">


						<div class="content-view">

							 <form id="viewForm" method="post">
							 <!-- security -->
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

							 <input type = "hidden" name = "m_no" value = "${user_view.m_no}">
							 <input type = "hidden" name = "cate" value = "user">
								<table class="table user_view" >
									<tr class="row ">
										<td class="cell span3" rowspan= "5">프로필사진</td>
										<td class="cell span2" rowspan= "5">사진</td>
										<td class="cell span2">이름</td>
										<td class="cell span3">${user_view.m_name}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">아이디</td>
										<td class="cell">${user_view.m_id}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">닉네임</td>
										<td class="cell"><input type="text" name="m_nick" class="span2" value="${user_view.m_nick}"></td>
									</tr>
									
									<tr class="row">
										<td class="cell">성별</td>
										<td class="cell">${user_view.m_gender}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">생년월일</td>
										<td class="cell">${user_view.m_birth}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">주소</td><!-- 주소, 상세주소 -->
										<td colspan="3" class="cell">${user_view.m_addr1}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">SMS 수신여부</td>
										<td class="cell">${user_view.m_re_sms}</td>
										<td class="cell">우편번호</td>
										<td class="cell">${user_view.m_post}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">쪽지 수신여부</td>
										<td class="cell">${user_view.m_re_message}</td>
										<td class="cell">등급</td>
										<td class="cell">
										<c:choose>
											<c:when test="${user_view.r_no == '1'}">보드대마왕</c:when>
											<c:when test="${user_view.r_no == '2'}">보드마스터</c:when>
											<c:when test="${user_view.r_no == '3'}">보드게이머</c:when>
											<c:when test="${user_view.r_no == '4'}">표류자</c:when>
										</c:choose>
										</td>
									</tr>
									
									<tr class="row">
										<td class="cell">공지메일 수신여부</td>
										<td class="cell">${user_view.m_re_notice}</td>
										<td class="cell">포인트</td>
										<td class="cell">${user_view.m_point}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">회원정보 공개여부</td>
										<td class="cell">${user_view.m_info}</td>
										<td class="cell">이메일</td>
										<td class="cell">${user_view.m_email}</td>
									</tr>
									
									<tr class="row">
										<td class="cell">가입일</td>
										<td class="cell">${user_view.m_indate}</td>
										<td class="cell">신고 당한 수</td>
										<td class="cell">${user_view.m_report_num}</td>
									</tr>
									
									<tr class="row">
										<td class = "cell span1">비고</td>
										<td colspan= "3" class="cell span8">
											<textarea name = "m_extra" class="span5" rows="5"><c:if test="${user_view.m_extra != '0'}">${user_view.m_extra}</c:if></textarea></td>
									</tr> <!-- default값이 n임 : n이면 안뜨게  -->

									<tr class="row">
										<td class = "cell span1">자기소개</td>
										<td colspan= "3" class="cell span8">
											<textarea name = "m_self" class="span5" rows="8">${user_view.m_self}</textarea></td>
									</tr>
									
									<tr class="row">
										<td class="cell">탈퇴여부</td>
										<td class="cell">${user_view.m_out}</td>
										<td class="cell">탈퇴일</td>
										<td class="cell">
											<c:if test = "${user_view.m_outdate eq null}">X</c:if>
											${user_view.m_outdate} <!-- 탈퇴일이 null이면 X출력하기  -->
										</td>
									</tr>
									<tr class="row">
										<td class="cell">은행</td>
										<td class="cell">${user_view.m_bank}</td>
										<td class="cell">계좌번호</td>
										<td class="cell">${user_view.m_account}</td>
									</tr>
								</table>
								<div class="module-option clearfix">
									<div class="control-group">
										<div class="controls">
											<button type="button" class="btn  pull-left"
												onclick="location='user_list'">목록</button>
											<button class="btn  pull-right" onclick='m_update()'>수정</button>
											<button type="submit" class="btn  pull-right" onClick='m_out()'>탈퇴</button>
											<c:if test="${user_view.r_no == '4'}"><!-- 등급이 표류자일 경우에만 버튼 출력  -->
												<button class="btn  pull-right" onclick='m_confirm()'>등급복구</button>
											</c:if>
											

										</div>
									</div>
								</div>
							</form> 
							<script>
								function m_update(){
									var modify = document.getElementById("viewForm");
									modify.action="<c:url value='/admin/updateMember'/>";
									modify.submit();
									console.log("modify");
								}
								
								function m_out(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/outMember_user'/>";
									out.submit();
									console.log("out");
									alert("해당 회원이 탈퇴처리 되었습니다.");
								}
								
								function m_confirm(){
									var out = document.getElementById("viewForm");
									out.action="<c:url value='/admin/member_confirm'/>";
									out.submit();
									console.log("out");
									alert("해당 회원의 등급이 복구되었습니다.");
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