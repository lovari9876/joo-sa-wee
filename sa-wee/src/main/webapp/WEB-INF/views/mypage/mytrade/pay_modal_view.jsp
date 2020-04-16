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
	
	<!-- modal 
	================================================== -->	
	<link rel="stylesheet" href="/css/mypage/cassie/mypage_modalstyle.css" />
	
	<!-- 결제: 아임포트 js 
	================================================== -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<!-- 발표시 할 일:  -->
	<!-- 결제 완료 후 pc카톡 화면 보여주면서 결제완료 상태 보여주기 -->
	

</head>
<body >
						
	<!-- Modal HTML embedded directly into document -->
	<div id="pay-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와서... 값 넣을 때도 ajax사용..  -->
				<form >
					<input type = "hidden" name="t_no" value = "${content_view_t['T_NO']}"/> <!-- 글번호 -->
					<input type = "hidden" name="m_no" value = "${content_view_t['M_NO']}"/> <!-- 판매자 -->
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<!-- 로그인 된 상태일 때 글쓰기 가능하도록.. -->
					<!-- <input type = "hidden" id = "m_no" value = ""/> -->									
					<div class="table--div">
						<div class="modal--info">구매를 원하시는 물품에 체크 후, '구매요청' 버튼을 눌러주세요.<br/>
							판매자의 가격 조정이 끝나면, [마이페이지 -> 내 구매] 에서 배송지를 입력하실 수 있습니다.														
						</div>
						<br/>
						<table>
							<thead>
								<tr class="table--row">
									<th class="table--cell">보드게임</th>
									<th class="table--cell">희망가격</th>
								</tr>
							</thead>
							<tbody id="ajax-buy">
							</tbody>						
							<tr class="table--row sum--row">
								<td class="table--cell">합계</td>
								<td id="ajax-sum-buy" class="table--cell"></td>
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
						<br/>						
						<button id="buy-btn" class="write-btn lavender-btn" type="button"
								onClick="payNow()">결제</button>	
						<!-- modal close -->
						<span class="modal--close" onClick="closePayModal()">close</span>
					</div>
					
				</form>						
			</div>
		</div>		
	</div>

	

</body>
</html>