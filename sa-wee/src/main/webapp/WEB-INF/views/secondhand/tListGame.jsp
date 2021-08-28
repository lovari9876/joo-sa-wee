<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 403 에러 / csrf 토큰 문제 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />

<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">
	.masonry .entry__meta-links a::after{
		content : "" !important;
	}
</style>


</head>
<body id="top">

		<c:forEach items = "${gameNames}" var = "gameName">
			  <div class="entry__meta">
		      	<span class="entry__meta-links">	
					
					<c:choose>
						<c:when test="${gameName.g_no eq 0 }">
								#${gameName.tg_name} &emsp;
						</c:when>
						<c:otherwise>
							<a style = "color:#400186;" href="game_detail?g_no=${gameName.g_no}">#${gameName.tg_name}</a> &emsp;
						</c:otherwise>
					</c:choose>
				</span>
			</div>
		</c:forEach>

</body>
</html>