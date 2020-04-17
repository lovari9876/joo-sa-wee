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
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
<script src = "js/board_hs/ckeditor.js" ></script>

</head>


<body>

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>공지사항 작성</h3>
				</div>



				<!-- 본문 -->
				<div class="module-body">
					<!-- 					<div class="write-section">
						<div class="write-container">


							<div class="write-view"> -->

					<form id="viewForm" method="post">
						<input type="hidden" name = "bt_no" value="12" >
						<input type="hidden" name = "s_no" value="35">
						<input type="hidden" name = "m_no" value="0">
						<table class="table">
						
							<tr class="row">
								<td class="cell span2">제목</td>
								<td class="cell span9"><input id="title" maxlength="60" type="text" name="bw_title"
									class="span7" placeholder="제목을 입력하세요"></td>

							</tr>

							<tr class="row">
								<td class="cell ">내용</td>
								<td class="cell "><textarea id="editor" class="content" name="bw_content" 
										rows="10" placeholder="내용을 입력하세요"></textarea></td>
							</tr>

							<!-- <tr class="row">
								<td class="cell">첨부파일</td>
								<td class="cell"><input multiple="multiple" type="file"
									class="btn  pull-right" name="file" /></td>

							</tr> -->
						</table>
						<div class="module-option clearfix">
							<div class="control-group">
								<div class="controls">
									<button type="button" class="btn  pull-left"
										onclick="location='notice_list'">목록</button>
									<button id="btnConfirm"class="btn  pull-right" value="notice_write">작성완료</button>

								</div>
							</div>
						</div>


					</form>




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