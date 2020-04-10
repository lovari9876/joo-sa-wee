<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="css/board_hj/animate.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />

</head>
<body>
		<!-- 댓글 쓰기 -->
	<div class="pt-5">
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5">Leave a comment</h3>
			<form action="comment_write_bw" method="post">
				<input type="hidden" name="cm_no2" value="${content_view['BW_NO']}">
				<input type="hidden" name="bw_no" value="${content_view['BW_NO']}">
				<input type="hidden" name="m_no" value="${m_no}">
				<div class="form-group">
					<label for="message">Comment</label>
					<textarea name="cm_content" id="message" cols="30" rows="10"
						class="form-control" placeholder="댓글을 입력하세요."></textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="작성" class="btn btn-lavender btn-md">
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>