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
	
	<!-- LOGO
    ================================================== -->
    <link rel="icon" type="image/png"
		href="/images/share/wolf_logo.ico" />
	
	<!-- modal -->	
	<link rel="stylesheet" href="/css/mypage/cassie/mypage_modalstyle.css" />

</head>
<body >
						
	<!-- Modal HTML embedded directly into document -->
	<div id="sell-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와서... 값 넣을 때도 ajax사용..  -->
									
					<!-- 로그인 된 상태일 때 글쓰기 가능하도록.. -->
					<!-- <input type = "hidden" id = "m_no" value = ""/> -->									
					<div class="table--div">
						<div class="modal--info">
							구매자의 결제를 기다리는 중입니다. <br/>
							결제 확인 후, 운송장을 입력하실 수 있습니다.														
						</div>
						<table>
							<thead>
								<tr class="table--row">
									<th class="table--cell">보드게임</th>
									<th class="table--cell">희망가격</th>
								</tr>
							</thead>
							<tbody id="ajax-sell">
							</tbody>							
							<tr class="table--row sum--row">
								<td class="table--cell">합계</td>
								<td id="ajax-sum-sell" class="table--cell"></td>
							</tr> <!-- 결국 마이페이지 내의 모달은 다 한 페이지에 있기에 -->
								  <!-- 절대 모달끼리 id가 중복되면 안된다.. 안나와.. -->
							
														
						<%--  	<c:forEach items="${ptgList}" var="ptgItem" varStatus="status">
								<tr class = "table--row">
									<td class = "table--cell"> <!-- tg => tg_no -->
										${ptgItem['TG_NAME']}
									</td>
									<td class="table--cell">${ptgItem['TG_PRICE']}원</td>
								</tr>
							</c:forEach>	--%>					
						</table>
						<br/>
						<!-- modal close -->
						<span class="modal--close" onClick="closeSellModal()">close</span>
						<br/>	
						
					</div>				
			</div>
		</div>		
	</div>

</body>
</html>