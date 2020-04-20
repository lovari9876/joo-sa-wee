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
<script src = "js/board_hs/ckeditor.js" ></script>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>보드게임카페 정보수정</h3>
				</div>



				<!-- 본문 -->
				<div class="module-body">

					<form method="post" id="viewForm">
					<input type = "hidden" name = "c_no" value = "${cafe_info.c_no}">
						<table class="table">
							
							<tr class="row">
								<td class="cell span2">카페 이름</td>
								<td class="cell span8"><input type="text" maxlength="30" name="c_title" class="span6" value="${cafe_info.c_title}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">카페 주소</td>
								<td class="cell span8"><input type="text" maxlength="60" name="c_add" class="span6" rows="2" value="${cafe_info.c_add}"></input></td>
							</tr>

							<tr class="row">
								<td class="cell span2">전화번호</td>
								<td class="cell span8"><input type="text" id="phone" maxlength="13" name="c_phone" class="span6" value="${cafe_info.c_phone}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">수용인원</td>
								<td class="cell span8"><input type="number" maxlength="3" name="c_people" class="span6" value="${cafe_info.c_people}"
															oninput="numberMaxLength(this);"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">테이블개수</td>
								<td class="cell span8"><input type="number" maxlength="3" name="c_table" class="span6" value="${cafe_info.c_table}"
															oninput="numberMaxLength(this);"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">의자개수</td>
								<td class="cell span8"><input type="number" maxlength="3"name="c_chair" class="span6" value="${cafe_info.c_chair}"
															oninput="numberMaxLength(this);"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">오픈시간</td>
								<td class="cell span8"><input type="text" maxlength="6" name="c_open"  class="span6" value="${cafe_info.c_open}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">마감시간</td>
								<td class="cell span8"><input type="text"  maxlength="6" name="c_close" class="span6" value="${cafe_info.c_close}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">휴일</td>
								<td class="cell span8"><input type="text"  maxlength="30" name="c_rest" class="span6" value="${cafe_info.c_rest}"></td>
							</tr> 

						</table>
						<div class="module-option clearfix">
							<div class="control-group">
								<div class="controls">
									<button type="button" class="btn  pull-left" 
										onclick="location='cafe_list'">목록</button>
									<button id="btnConfirm" class="btn  pull-right" value="modify_view">수정완료</button>

								</div>
							</div>
						</div>
					</form>
					<script>
						/* function updateCafe(){
							var modify = document.getElementById("viewForm");
							modify.action="<c:url value='/admin/updateCafe'/>";
							modify.submit();
							console.log("modify");
						} */
						/* number 길이제한 */
						function numberMaxLength(e){
					        if(e.value.length > e.maxLength){
					            e.value = e.value.slice(0, e.maxLength);
					        }
					    }
						
					</script>

					<!-- 	</div>
						</div>
					</div> -->



				</div>
			</div>
			<!--/.content-->
		</div>
	</div>
	<!--/.span9-->
	</div>
	</div>
	<!--/.container-->
	</div> 
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
	<!-- insert & 예외처리 -->
	<script src="js/admin/exception/cafe.js" type="text/javascript"></script>
	
</body>
</html>