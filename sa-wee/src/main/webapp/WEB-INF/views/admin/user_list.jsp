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
</head>


<body>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>회원관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<div class="dropdown">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">전체보기 <i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">전체보기</a></li>
										<li><a href="#">아이디</a></li>
										<li><a href="#">닉네임</a></li>
										<li><a href="#">어찌구</a></li>
										
									</ul>
								
									
								</div>
									<div class="input-append pull-left">
									<input type="text" class="span3"
										placeholder="검색을해라">
									<button type="submit" class="btn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								
							</div>
						</div>

					</form>
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">가입일 순</button>
						<button type="button" class="btn">아이디 순</button>
						<button type="button" class="btn">등급 순</button>
					</div>
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table user_list">
						<tr class="trow header">
							<td class="cell">아이디</td><!-- 아이디 클릭시 회원정보 보기 링크 걸기 -->
							<td class="cell">이름</td>
							<td class="cell">닉네임</td>
							<td class="cell">등급</td>
							<td class="cell">포인트</td>
							<td class="cell">이메일</td>
							<td class="cell">가입일</td>
							<td class="cell">수정</td>
							<td class="cell">탈퇴</td>
							
						</tr>

						<!-- <tr class="trow">
							<td class="cell">Vincent</td>
							<td class="cell">Vincent</td>
							<td class="cell">Vincent</td>
							<td class="cell">00-00-00</td>
							<td class="cell">보드마스터</td>
							<td class="cell">1000p</td>
							<td class="cell">01000000000</td>
							<td class="cell">abc@gmail.com</td>
							<td class="cell">00-00-00</td>
							<td class="cell"><button type="button" class="btn" >탈퇴</button></td> 정말 탈퇴???? 한번더 묻기 
							
						</tr> -->
						
						<c:forEach items="${user_list}" var="member">
								<tr class="trow">
									<td class="cell">${member.m_id}</td><!-- 해당 tr 클릭하면 메인사이트 회원정보 화면으로 이동  -->
									<td class="cell"><a
										href="report_view?st_no=${report.st_no}">${member.m_name}</a></td>
									<td class="cell">${member.m_nick}</td>
									<td class="cell">
										<c:choose>
											<c:when test="${member.r_no == '1'}">보드대마왕</c:when>
											<c:when test="${member.r_no == '2'}">보드마스터</c:when>
											<c:when test="${member.r_no == '3'}">보드게이머</c:when>
											<c:when test="${member.r_no == '4'}">표류자</c:when>
										</c:choose>
									</td>
									<td class="cell">${member.m_point}</td>
									<td class="cell">${member.m_email}</td>
									<td class="cell">${member.m_indate}</td>
									<td class="cell"><button type="button" class="btn" onclick="location='user_view?m_no=${member.m_no}'">수정</button></td>
									<td class="cell"><button type="button" class="btn" >탈퇴</button></td> <!-- 정말 탈퇴???? 한번더 묻기  -->
								</tr>
							</c:forEach>
						

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<li><a href="#"><i class="icon-double-angle-left"></i></a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
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
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script> <script src="js/datatables/jquery.dataTables.js" type="text/javascript"></script>
</body>
</html>