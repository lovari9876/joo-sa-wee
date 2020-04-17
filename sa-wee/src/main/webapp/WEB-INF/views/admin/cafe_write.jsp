<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>보드게임카페 정보 작성</h3>
				</div>



				<!-- 본문 -->
				<div class="module-body">
					<!-- 					<div class="write-section">
						<div class="write-container">


							<div class="write-view"> -->

					<form id="viewForm" method="post" >  <!-- action="/admin/cafeInsert" -->
						<table class="table">
							<!-- <tr class = "row">
							<td class = "cell">말머리</td>
							<td class = "cell span7">
								<select>
										<option value="0" selected>말머리</option>
										<option value="1">말머리</option>
										<option value="2">말머리</option>
								</select>
							</td>
						</tr>  -->

							<tr class="row">
								<td class="cell span2">카페 이름</td>
								<td class="cell span8"><input type="text" maxlength="30" name="c_title" class="span6"
									placeholder="카페이름을 입력하세요"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">카페 주소</td>
								<td class="cell span8"><input type="text" maxlength="60" name="c_add" class="span6" rows="2"
										placeholder="카페주소를 입력하세요"></input></td>
							</tr>

							<tr class="row">
								<td class="cell span2">전화번호</td>
								<td class="cell span8"><input type="text" maxlength="13" name="c_phone"
									placeholder="전화번호를 입력하세요" class="span6"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">수용인원</td>
								<td class="cell span8"><input type="number" maxlength="3" name="c_people" oninput="numberMaxLength(this);"
									placeholder="수용인원을 입력하세요" class="span6"></td>
							</tr>
 
							<tr class="row">
								<td class="cell span2">테이블개수</td>
								<td class="cell span8"><input type="number" maxlength="3" name="c_table" oninput="numberMaxLength(this);"
									placeholder="테이블 개수를 입력하세요" class="span6"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">의자개수</td>
								<td class="cell span8"><input type="number" maxlength="3" name="c_chair" oninput="numberMaxLength(this);"
									placeholder="의자 개수를 입력하세요" class="span6"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">오픈시간</td>
								<td class="cell span8"><input type="text" maxlength="6" name="c_open"
									placeholder="오픈시간을 입력하세요" class="span6"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">마감시간</td>
								<td class="cell span8"><input type="text" maxlength="6" name="c_close"
									placeholder="마감시간을 입력하세요" class="span6"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">휴일</td>
								<td class="cell span8"><input type="text" maxlength="30" name="c_rest"
									placeholder="카페 휴일을 입력하세요" class="span6"></td>
							</tr>

							<!-- <tr class="row">
								<td class="cell span2">첨부파일</td>
								<td class="cell span8"><input multiple="multiple" type="file"
									name="file" class="pull-left" /></td>
							</tr> -->
						</table>
						<div class="module-option clearfix">
							<div class="control-group">
								<div class="controls">
									<button type="button" class="btn  pull-left"
										onclick="location='cafe_list'">목록</button>
									<button id="btnConfirm" class="btn  pull-right">작성완료</button>

								</div>
							</div>
						</div>


					</form>
					<script>
						
						/* number 길이제한 */
						function numberMaxLength(e){
					        if(e.value.length > e.maxLength){
					            e.value = e.value.slice(0, e.maxLength);
					        }
					    }
						
					</script>



					<!-- 							</div>
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