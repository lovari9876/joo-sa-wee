<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h3>FAQ 수정</h3>
				</div>



				<!-- 본문 -->
				<div class="module-body">

					<form method="post" id="viewForm">
					<input type = "hidden" name = "faq_no" value = "${faq.faq_no}">
						<table class="table">
							 <tr class = "row">
							<td class = "cell span2">말머리</td>
							<td class = "cell span8">
								<select name="s_no">
										<option value="22" <c:out value="${faq.s_no == 22 ? 'selected' : ''}"/>>회원</option>
										<option value="23" <c:out value="${faq.s_no == 23 ? 'selected' : ''}"/>>결제</option>
										<option value="24" <c:out value="${faq.s_no == 24 ? 'selected' : ''}"/>>정보수정</option>
										<option value="25" <c:out value="${faq.s_no == 25 ? 'selected' : ''}"/>>무인도게시판</option>
										<option value="26" <c:out value="${faq.s_no == 26 ? 'selected' : ''}"/>>기타</option>
								</select>
							</td>
						</tr> 

							<tr class="row">
								<td class="cell span2">제목</td>
								<td class="cell span8"><input id="title" maxlength="60" type="text" name="faq_title"
									class="span6" value="${faq.faq_title}" ></td>
							</tr>

							<tr class="row">
								<td class="cell">내용</td>
								<td class="cell"><textarea id="editor" name="faq_content" class="span5"
										rows="10" >${faq.faq_content}</textarea></td>
							</tr>

						</table>
						<div class="module-option clearfix">
							<div class="control-group">
								<div class="controls">
									<button type="button" class="btn  pull-left"
										onclick="location='faq_list'">목록</button>
									<button id="btnConfirm" class="btn pull-right" value="faq_modify">수정완료</button>

								</div>
							</div>
						</div>
					</form>
					<script>
						/* function updateFaq(){
							var modify = document.getElementById("viewForm");
							modify.action="<c:url value='/admin/updateFaq'/>";
							modify.submit();
							console.log("modify");
						} */
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
	<!-- modify / submit 예외처리 -->
	<script src="js/admin/exception/board.js" type="text/javascript"></script>
	
	
	<!-- ckEditor 관련 -->
	
	<script type="text/javascript">
			var myEditor;
			ClassicEditor
				.create( document.querySelector( '#editor' ), {
					
					
					
					
					ckfinder: {
				        uploadUrl: '${pageContext.request.contextPath}/fileupload' // 내가 지정한 업로드 url (post로 요청감)
				       
					},
					
					toolbar: [ 'heading', '|',  'bold', 'italic','fontSize','fontColor', 'fontFamily', 'alignment:left', 'alignment:center', 'alignment:right','link', 'bulletedList', 'numberedList', 'blockQuote','insertTable',  'imageUpload', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight'],

					image : {
						styles : ['full', 'alignLeft', 'alignRight']
					},
					
					uiClor : '#FFFFFF',
					
					removePlugins: [ 'ImageCaption' ],
					
					alignment: {
			            options: [ 'left', 'center', 'right' ]
			        }
				} )
				.then( editor => {
			        console.log( 'Editor was initialized', editor );
			        myEditor = editor;
		    } )
			.catch( error => {
			    console.error( error );
			} );
		</script>
</body>
</html>