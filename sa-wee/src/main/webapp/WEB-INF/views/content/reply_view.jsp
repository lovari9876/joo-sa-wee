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
	<div id="myModal" class="modal--comment">
		<div class="modal--reply">
		<span class="modal--re_close">&times;</span>
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
							<input type="hidden" name="bw_no" value="${content_view['BW_NO']}">
							<div class="form-group">
								<label for="message">Reply</label>
								<textarea name="cm_content" id="message" cols="30" rows="5"
									class="form-control" placeholder="답글을 입력하세요."></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="작성" class="btn btn-lavender btn-md">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	// Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementsByClassName("myBtn");
    
    for (var i = 0; i < btn.length; i++) {
    	var myBtn = btn.item(i);
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("modal--re_close")[0];                                          

    // When the user clicks on the button, open the modal 
    myBtn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
	</script>

</body>
</html>