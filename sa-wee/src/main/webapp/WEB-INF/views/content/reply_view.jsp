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
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
</head>
<body>

	<div class="container">
		<div class="pt-5">
			<div class="comment-form-wrap pt-5">
				<h3 class="mb-5">Leave a reply</h3>
				<form action="reply" method="GET">
					<input type="hidden" name="cm_type" value="게시판"> 
					<input type="hidden" name="cm_no2" value="${comment_view['CM_NO2']}">
					<input type="hidden" name="cm_group" value="${comment_view['CM_GROUP']}"> 
					<input type="hidden" name="cm_step" value="${comment_view['CM_STEP']}"> 
					<input type="hidden" name="cm_indent" value="${comment_view['CM_INDENT']}">
					<input type="hidden" name="m_no" value="${m_no}">
					<div class="form-group">
						<label for="message">Reply</label>
						<textarea name="cm_content" id="message" cols="30" rows="5"
							class="form-control" placeholder="답글을 입력하세요."></textarea>
					</div>
					<div class="form-group">
					<div class="input-group">
						<input type="button" value="닫기" onClick='window.close()'
								class="btn btn-lavender btn-md text-white" id="btn-color">
						<input type="submit" value="작성" class="btn btn-lavender btn-md">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>