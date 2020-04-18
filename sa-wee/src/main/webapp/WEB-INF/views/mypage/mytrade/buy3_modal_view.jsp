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
	<div id="buy3-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와서... form 으로 전달  -->		
				<form action="buyerConfirm" method="post" enctype="multipart/form-data"
					  	onsubmit="return confirmSubmit();">					
					<input type = "hidden" class="buy3-modal-p_no" name="p_no" />								
					<div class="table--div">
						<div class="modal--info">
							배송 중입니다. <br/>
							배송이 완료되면 수취확인 버튼을 눌러주세요.												
						</div>						
						<table>
							<thead>
								<tr class="table--row">
									<th class="table--cell">보드게임</th>
									<th class="table--cell">희망가격</th>
								</tr>
							</thead>
							<tbody id="ajax-buy3">
							</tbody>						
							<tr class="table--row sum--row">
								<td class="table--cell">합계</td>
								<td id="ajax-sum-buy3" class="table--cell"></td>
							</tr> <!-- 결국 마이페이지 내의 모달은 다 한 페이지에 있기에 -->
								  <!-- 절대 모달끼리 id가 중복되면 안된다.. 안나와.. -->					
								
						</table>
						<br/>
						<br/>
						<div class="modal--info">
							물품에 결함이 있거나 배송에 문제가 있으면 관리자에게 문의하세요.<br/>
							7일 내로 수취확인이나 문의를 하지 않으면, 자동으로 배송완료 처리됩니다.												
						</div>
						<!-- form table -->
						<table class="tracking_table">
							<tr class="table--row">
								<td class="table--cell">택배사</td>
								<td class="table--cell buy3-courier">									
								</td>
							</tr>	
							
							<tr class="table--row">
								<td class="table--cell">운송장</td>
								<td class="table--cell buy3-tracking">									
								</td>
							</tr>
						</table>
						<br/>
						<br>
						<!-- form 제출 -->
						<button class="write-btn lavender-btn" type="submit">수취확인</button>							
						<!-- modal close -->
						<span class="modal--close" onClick="closeBuyModal()">close</span>
						
					</div>
				</form>					
			</div>
		</div>		
	</div>
	
	<script type="text/javascript">
	
		function confirmSubmit() {
			var rtn = confirm('수취확인은 취소하실 수 없습니다. 정말로 하시겠습니까?');				
			
			if (rtn) {
				return true;
			} else {
				return false;
			}
		}
		
	</script>
	

</body>
</html>