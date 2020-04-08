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
</head>
<body>
	<form action="reply" method="get">
	<input type="hidden" name="cm_no2" value="${content_view['BW_NO']}">
	<input type="hidden" name="bw_no" value="${content_view['BW_NO']}">
	<input type="hidden" name="cm_group" value="${comment_view['CM_GROUP']}">
	<input type="hidden" name="cm_step" value="${comment_view['CM_STEP']}">
	<input type="hidden" name="cm_indent" value="${comment_view['CM_INDENT']}">
		<div class="form-group">
			<label for="message">Reply</label>
			<textarea name="cm_comment" id="message" cols="30" rows="5" class="form-control" placeholder="댓글을 입력하세요."></textarea>
		</div>
		<div class="form-group">
			<input type="submit" value="작성" class="btn btn-lavender btn-md">
		</div>
	</form>
</body>
</html>