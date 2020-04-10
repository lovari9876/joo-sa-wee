<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- 버튼 -->
<link rel="stylesheet" href="css/secondhand/buttonstyle.css" />
<!-- modal -->	
<link rel="stylesheet" href="css/secondhand/modalstyle.css" />

</head>
<body >


	<!-- 구매하기 버튼: open modal -->
	<br />
	<br />
	<div align="center" class="buy--button" >
		<button id ="myBtn" class="write-btn lavender-btn" type="button" > 거래하기</button> 
		<!-- <a class="" data-modal href="#myModal">거래하기</a>  -->
	</div>					
	<br />
	<br />
						
	<!-- Modal HTML embedded directly into document -->
	<div id="myModal" class="modal--trade">
	
		<div class="modal--content">						
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
			cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
			proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
			<span id="modal--close">close</span>
			</p>
		</div>
		
	</div>
	
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		
		// Get the <span> element that closes the modal
		var span = document.getElementById("modal--close");                                          
		
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		    modal.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
		}
	</script>
					

</body>
</html>