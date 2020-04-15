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
					<h3>보드게임정보 수정</h3>
				</div>



				<!-- 본문 -->
				<div class="module-body">

					<form method="post" id="viewForm">
					<input type = "hidden" name = "g_no" value = "${game_info['G_NO']}">
						<table class="table">
							
							<tr class="row">
								<td class="cell span2">한국어 제목</td>
								<td class="cell span8"><input type="text" name="g_name_kor" class="span6" value="${game_info['G_NAME_KOR']}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">최소인원</td>
								<td class="cell span8"><input type="text" name="g_min" class="span6" rows="2" value="${game_info['G_MIN']}"></input></td>
							</tr>

							<tr class="row">
								<td class="cell span2">최대인원</td>
								<td class="cell span8"><input type="text" name="g_max" class="span6" value="${game_info['G_MAX']}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">플레이시간</td>
								<td class="cell span8"><input type="text" name="g_playtime" class="span6" value="${game_info['G_PLAYTIME']}"></td>
							</tr>

							<tr class="row">
								<td class="cell span2">출시일</td>
								<td class="cell span8"><input type="text" name="g_release" class="span6" value="${game_info['G_RELEASE']}"></td>
							</tr>

							
						</table>
						<div class="module-option clearfix">
							<div class="control-group">
								<div class="controls">
									<button type="button" class="btn  pull-left"
										onclick="location='game_list'">목록</button>
									<button class="btn  pull-right" onclick="updateGame()" >수정완료</button>

								</div>
							</div>
						</div>
					</form>
					<script>
						function updateGame(){
							var modify = document.getElementById("viewForm");
							modify.action="<c:url value='/admin/updateGame'/>";
							modify.submit();
							console.log("modify");
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