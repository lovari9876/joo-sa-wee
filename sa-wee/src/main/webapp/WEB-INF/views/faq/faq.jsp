<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	document.getElementsByTagName("html")[0].className += " js";
</script>
<link rel="stylesheet" href="css/faq/style_faq.css">
<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />
<title>FAQ</title>

</head>
<body id = "top"> <!-- js 적용위해 id 지정 -->
      
      
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<section
		class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
		<ul class="cd-faq__categories">
			<li><a
				class="cd-faq__category cd-faq__category-selected truncate_" href="#member">회원</a></li>
			<li><a class="cd-faq__category truncate" href="#payment">결제</a></li>
			<li><a class="cd-faq__category truncate" href="#info">정보 수정</a></li>
			<li><a class="cd-faq__category truncate" href="#island">무인도 게시판</a></li>
			<li><a class="cd-faq__category truncate__" href="#etc">기타</a></li>
		</ul>
		<!-- cd-faq__categories -->

		<div class="cd-faq__items">
		
			<ul id="member" class="cd-faq__group">
				<li class="cd-faq__title"><h4>회원</h4></li>
				<c:forEach items="${faq_list}" var="faq"> 
				<c:if test="${faq.s_no == 22}">
					<li class="cd-faq__item upHit" value="${faq.faq_no}"><a class="cd-faq__trigger" href="#0">
						<span>${faq.faq_title}</span></a>
					<div class="cd-faq__content">
						<div class="text-component">
							<p>${faq.faq_content}</p>
						</div>
					</div> <!-- cd-faq__content --></li>
				</c:if>
				</c:forEach>
			</ul>
			<!-- cd-faq__group -->

			<ul id="payment" class="cd-faq__group">
				<li class="cd-faq__title"><h4>결제</h4></li>
				<c:forEach items="${faq_list}" var="faq"> 
				<c:if test="${faq.s_no == 23}">
					<li class="cd-faq__item upHit" value="${faq.faq_no}"><a class="cd-faq__trigger" href="#0">
						<span>${faq.faq_title}</span></a>
					<div class="cd-faq__content">
						<div class="text-component">
							<p>${faq.faq_content}</p>
						</div>
					</div> <!-- cd-faq__content --></li>
				</c:if>
				</c:forEach>
			</ul>
			<!-- cd-faq__group -->

			<ul id="info" class="cd-faq__group">
				<li class="cd-faq__title"><h4>정보 수정</h4></li>
				<c:forEach items="${faq_list}" var="faq"> 
				<c:if test="${faq.s_no == 24}">
					<li class="cd-faq__item upHit" value="${faq.faq_no}"><a class="cd-faq__trigger" href="#0">
						<span>${faq.faq_title}</span></a>
					<div class="cd-faq__content">
						<div class="text-component">
							<p>${faq.faq_content}</p>
						</div>
					</div> <!-- cd-faq__content --></li>
				</c:if>
				</c:forEach>
			</ul>
			<!-- cd-faq__group -->

			<ul id="island" class="cd-faq__group">
				<li class="cd-faq__title"><h4>무인도 게시판</h4></li>
				<c:forEach items="${faq_list}" var="faq"> 
				<c:if test="${faq.s_no == 25}">
					<li class="cd-faq__item upHit" value="${faq.faq_no}"><a class="cd-faq__trigger" href="#0">
						<span>${faq.faq_title}</span></a>
					<div class="cd-faq__content">
						<div class="text-component">
							<p>${faq.faq_content}</p>
						</div>
					</div> <!-- cd-faq__content --></li>
				</c:if>
				</c:forEach>
			</ul>
			<!-- cd-faq__group -->
			
			
			<ul id="etc" class="cd-faq__group">
				<li class="cd-faq__title"><h4>기타</h4></li>
				<c:forEach items="${faq_list}" var="faq"> 
				<c:if test="${faq.s_no == 26}">
					<li class="cd-faq__item upHit" value="${faq.faq_no}"><a class="cd-faq__trigger" href="#0">
						<span>${faq.faq_title}</span></a>
					<div class="cd-faq__content">
						<div class="text-component">
							<p>${faq.faq_content}</p>
						</div>
					</div> <!-- cd-faq__content --></li>
				</c:if>
				</c:forEach>
			</ul>
			<!-- cd-faq__group -->
			
			
		</div>
		<!-- cd-faq__items -->

		<a href="#0" class="cd-faq__close-panel text-replace">Close</a>

		<div class="cd-faq__overlay" aria-hidden="true"></div>
	</section>
	
	
 	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->
	
	
	
	
	
	<!-- =========== js ==================== -->
	<script src="js/cassie/jquery-3.2.1.min.js"></script>
	<!-- cd-faq -->
	<script src="js/faq/util.js"></script>
	<!-- util functions included in the CodyHouse framework -->
	<script src="js/faq/main.js"></script>
	
	
	<script src="js/admin/faqUpHit.js" type="text/javascript"></script>
	<!-- Java Script for header
    ================================================== -->   
    <script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<script src="js/header/scroll.js"></script>
	
	<!-- Java Script for footer
    ================================================== -->  
	<script src="js/footer/footer_hee.js"></script>

	<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js" integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8=" crossorigin="anonymous"></script>
	
	
	
</body>
</html>