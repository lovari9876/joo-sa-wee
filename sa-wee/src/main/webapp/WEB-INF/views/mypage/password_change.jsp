<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- modal -->
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
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5">탈퇴</h3>
			<form action="/out" method="get" id="viewForm">

				<p>탈퇴 사유가 있으신가요?</p>
				<br />

				<c:forEach items="${withdrawal}" var="withdrawal" varStatus="status">

					<c:if test="${!status.last}">
						<input type="radio" name="w_no" value="${withdrawal.w_no}">
						<label>${withdrawal.w_reason}</label>
						<br />
					</c:if>

					<c:if test="${status.last}">
						<input type="radio" name="w_no" value="${withdrawal.w_no}">
						<label>${withdrawal.w_reason}</label>
						<textarea name="wr_reason" id="wr_reason" cols="30" rows="6"
							class="form-control" placeholder="신고할 내용을 입력하세요."></textarea>
						<br />
					</c:if>

				</c:forEach>
				<br />

				<div class="form-group btn-shake">
					<a href="/outview" onclick="m_out()"
						class="btn btn-lavender btn-md text-white" id="btn-color">탈퇴하기</a>
				</div>

				<br />
			</form>
		</div>
	</div>

	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>
	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script>
		function m_out() {
			var out = document.getElementById("viewForm");
			var w_no = $(':input:radio[name=w_no]:checked').val();

			if(w_no == undefined){
				alert("사유를 선택해주세요.")
				return false;
			}
			
			var result = confirm("사위님 정말 탈퇴하시겠습니까?");
			
			if (result) {
				
				var wr_reason = $("#wr_reason").val();
				var w_no = $(':input:radio[name=w_no]:checked').val();
				
				console.log("wr_reason "+wr_reason + ", w_no "+w_no);
				
				out.action = "<c:url value='/out'/>";
				out.submit();
				alert("당신에게는 앞으로 주사위의 저주가 있을 것입니다. 탈퇴가 완료되었습니다.");
				window.opener.location.replace('/');
				window.close();
				
			} else {
				alert("탈퇴가 취소되었습니다. 내 사위는 주사위를 즐기세요!");
				window.close();
				return false;

			}
		}
	</script>

</body>
</html>