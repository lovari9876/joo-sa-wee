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

</head>
<body >
						
	<!-- 4. 배송완료=>상세정보 -->
	<div id="buy4-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와 -->													
					<div class="table--div">
						<div class="buy4_5_info_up modal--info">
																			
						</div>						
						<table>
							<thead>
								<tr class="table--row">
									<th class="table--cell">보드게임</th>
									<th class="table--cell">희망가격</th>
								</tr>
							</thead>
							<tbody id="ajax-buy4">
							</tbody>						
							<tr class="table--row sum--row">
								<td class="table--cell">합계</td>
								<td id="ajax-sum-buy4" class="table--cell"></td>
							</tr> <!-- 결국 마이페이지 내의 모달은 다 한 페이지에 있기에 -->
								  <!-- 절대 모달끼리 id가 중복되면 안된다.. 안나와.. -->					
								
						</table>
						<br/>
						<br/>
						<div class="buy4_5_info_down modal--info">							
						</div>
						<!-- form table -->
						<table class="tracking_table">
							<tr class="table--row">
								<td class="table--cell">택배사</td>
								<td class="table--cell buy4-courier">									
								</td>
							</tr>	
							
							<tr class="table--row">
								<td class="table--cell">운송장</td>
								<td class="table--cell buy4-tracking">									
								</td>
							</tr>
						</table>
						<br/>
						<br>						
						<!-- modal close -->
						<span class="modal--close" onClick="closeBuyModal()">close</span>
						<br/>
					</div>
								
			</div>
		</div>		
	</div>

</body>
</html>