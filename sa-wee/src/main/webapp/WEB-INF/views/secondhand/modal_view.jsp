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
		href="resources/images/share/wolf_logo.ico" />
	
	<!-- content_view에 있는 css 공유중.. -->	
	<!-- modal -->	
	<link rel="stylesheet" href="css/secondhand/modalstyle.css" />


</head>
<body >
						
	<!-- Modal HTML embedded directly into document -->
	<div id="myModal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- 폼: 물품 checkbox로 선택 후(가격 조정 아직..) 컨텐트 리다이렉트(성공시 alert한번 해주기)  -->
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
							<tr class="table--row">
								<th class="table--cell">보드게임</th>
								<th class="table--cell">희망가격</th>
							</tr>
															
							<c:forEach items="${tgList}" var="tgItem" varStatus="status">
								<tr class = "table--row">
									<td class = "table--cell"> <!-- tg => tg_no -->
										<input type="checkbox" id="tg${status.count}" name="tg" value="${tgItem.tg_no}">
										<label for="tg">${tgItem.tg_name}</label><br>
									</td>
									<td class="table--cell">${tgItem.tg_price}원</td>
								</tr>
							</c:forEach>						
						</table>
						<br/>
						<br/>						
						<button class="write-btn lavender-btn" type="submit">구매 요청</button>	
						<!-- modal close -->
						<span id="modal--close">close</span>
					</div>
					
				</form>				
			
				
			</div>
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