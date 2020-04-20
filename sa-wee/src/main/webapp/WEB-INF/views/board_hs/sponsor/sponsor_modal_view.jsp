<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 사위는 주사위</title>
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
						
	<!-- 후원 모달 -->
	<div id="sponsor-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>						
				<div class="table--div">
					<div class="modal--info">
						후원금 결제를 카카오페이로 진행합니다.<br>
						결제하실 금액을 선택해주세요.														
					</div>						
					<table>
						<thead>							
							<tr class="table--row">
								<th class="table--cell">선택</th>
								<th class="table--cell">결제 금액</th>
							</tr>
						</thead>
						<tbody id="ajax-sponsor">
						</tbody>			
									
							<!-- 1,000원 ~ 10,000원 -->
							<c:forEach var="i" begin="1" end="3">
								<tr class="table--row sum--row">
									<td class="table--cell">
										<input type="radio" id="amount${i}000" name="spAmount" value="${i}000">
									</td>
									<td class="table--cell">
										${i},000
									</td>
								</tr>
							</c:forEach>
							
							<!-- 20,000원 ~ 100,000원 -->
							<c:forEach var="j" begin="2" end="10">
								<tr class="table--row sum--row">
									<td class="table--cell">
										<input type="radio" id="amount${j}0000" name="spAmount" value="${j}0000">
									</td>
									<td class="table--cell">
										${j}0,000
									</td>
								</tr>
							</c:forEach>																	
							
						 <!-- 결국 마이페이지 내의 모달은 다 한 페이지에 있기에 -->
							  <!-- 절대 모달끼리 id가 중복되면 안된다.. 안나와.. -->
						
					</table>
					<br/>				
					<!-- 카카오페이 이미지... -->
					<img alt="" src="/images/cassie/pay/payment_icon_yellow_small.png" 
						 onClick="return isRadioChecked();" style="margin-right:10px;"/>
					<span class="modal--close" onClick="closeSponsorModal()">close</span>
					<br/>
				</div>						
			</div>
		</div>		
	</div>

</body>
</html>