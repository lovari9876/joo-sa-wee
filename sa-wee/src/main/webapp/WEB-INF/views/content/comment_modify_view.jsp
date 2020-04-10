<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUN-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<link rel="stylesheet" href="css/board_hj/header_style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<div class="pt-5">
			<div class="comment-form-wrap pt-5">
				<form action="comment_modify" method="get">
					<input type="hidden" name="cm_no" value="${comment_modi['CM_NO']}">
					<input type="hidden" name="cm_type" value="게시판">
					<input type="hidden" name="cm_no2" value="${comment_modi['CM_NO2']}">
					<div class="form-group">
						<label for="message">내 댓글 수정하기</label>
						<textarea name="cm_content" id="message" cols="30" rows="10"
							class="form-control" placeholder="${comment_modi['CM_CONTENT']}"></textarea>
					</div>
					<div class="form-group">
						<input type="button" value="닫기" onClick='window.close()'
							class="btn btn-lavender btn-md text-white" id="btn-color">		
						<input type="submit" value="수정" class="btn btn-lavender btn-md text-white" id="btn-color">		
					</div>
				</form>
			</div>
		</div>
	</div>






	<!-- <script>
		$("#cm_modi").click(function() {
			
			var bw_no = '${content_view["BW_NO"]}';
			
			function commentModify(cm_no, cm_content) {
				var a = '';
				
				a += '<div class="form-group">';
				a += '<input type="hidden" name="bw_no" value="'+bw_no+'">';
			    a += '<input type="text" class="form-control" name="content_'+cm_no+'" value="'+cm_content+'"/>';
			    a += '<span class="input-group-btn"><button class="btn btn-lavender btn-md" type="button" onclick="commentUpdateProc('+cm_no+');">수정</button> </span>';
			    a += '</div>';
			    
			    $('.commentContent'+cm_no).html(a);

			}
			
			function commentUpdateProc(cm_no){
			    var updateContent = $('[name=content_'+cm_no+']').val();
			    
			    $.ajax({
			        url : 'http://localhost:8282/comment_modify',
			        type : 'post',
			        data : {'cm_content' : updateContent, 'cm_no' : cm_no},
			        success : function(data){
			            if(data == 1) window.location.href = 'content_view'; //댓글 수정후 목록 출력 
			        }
			    });
			}
		});
	</script> -->




	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>

	<script src="js/board_hj/jquery.slicknav.min.js"></script>

	<script src="js/board_hj/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hj/jquery.sticky-sidebar.min.js"></script>

	<script src="js/board_hj/bootstrap.min.js"></script>

	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>


	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script src="js/board_hj/main.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/popover.js"></script>
</body>
</html>