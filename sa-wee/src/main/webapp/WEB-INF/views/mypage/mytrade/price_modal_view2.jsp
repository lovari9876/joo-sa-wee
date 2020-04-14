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
	
	<!-- content_view에 있는 css 공유중.. -->	
	<!-- modal -->	
	<link rel="stylesheet" href="/css/secondhand/modalstyle.css" />

</head>
<body >
						
	<!-- Modal HTML embedded directly into document -->
	<div id="price-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와서... 값 넣을 때도 ajax사용..  -->
				<form action="call_buy" method="post" enctype="multipart/form-data">
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
							<tbody id="ajax-sell">
							</tbody>
														
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
						<button id="buy-btn" class="write-btn lavender-btn" type="submit" onClick="return isChecked()">구매 요청</button>	
						<!-- modal close -->
						<span id="modal--close">close</span>
					</div>
					
				</form>						
			</div>
		</div>		
	</div>

	
	<script>
		
		// 구매요청 버튼 누를 때, 체크 안된 것이 있으면 alert 띄우고 모달 유지, 
		// 1개 이상 체크하면 완료 alert 띄우고 form action 주소 이동
		function isChecked() {
			var checkBoxes = document.getElementsByName("tg");	
			var msg = "구매 요청이 완료되었습니다.\n마이페이지에서 확인해보세요.";
			var chk = false;
			var count = 0;
			
			for(var i=0; i<checkBoxes.length; i++){
				if(checkBoxes[i].checked){
					count = count +1; 
				}
			}
			
			if(count != 0) {
				alert(msg);	
				return;
			} else {
				msg = "구매할 상품을 선택하세요.";
				alert(msg);	
				return false;
			}			
			
		} // 버튼에 onClick="return isChecked()" 이렇게 해야 
		  // 미체크 시 alert 띄우고 모달로 돌아온다!
		
	</script>
					

</body>
</html>