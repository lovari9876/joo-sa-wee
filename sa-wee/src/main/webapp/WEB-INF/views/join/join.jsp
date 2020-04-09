<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DICE</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />


<!-- <link rel="stylesheet" type="text/css"
	href="resources/css/join/roboto-font.css">
<link rel="stylesheet" type="text/css"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->

<link rel="stylesheet" type="text/css"
	href="resources/css/join/jquery-ui.min.css">

<link rel="stylesheet" href="resources/css/join/style.css" />
<link rel="stylesheet" href="resources/css/join/main.css" />
<!-- 403 에러 / csrf 토큰 문제 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- 우편번호 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_post').value = data.zonecode;
                document.getElementById("m_addr1").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
	
	<!-- 본문 -->
	<div class="page-content">
		<div class="wizard-v3-content">
			<div class="wizard-form">
				<div class="wizard-header">
					<a href="#" class="wrap-input100"> <img class="logo_image"
						src="resources/images/bl_share/icons/login/wolf_logo.png"
						alt="son-in-low_is_dice">
					</a>
				</div>
				<form id="form-register" class="form-register" action="/join"
					method="post">
					<div id="form-total">
						<h2>
							<span class="step-icon"><i class="zmdi zmdi-account"></i></span>
							<span class="step-text">About</span>
						</h2>
						<section>
							<div class="inner">
								<h3>가입 정보:</h3>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											name="m_id" id="m_id" class="form-control" required>
											<span class="label">아이디</span> <span class="border"></span>
										</label>										
										<div class="check_font" id="m_id_check"></div>										
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_nick" name="m_nick" required>
											<span class="label">닉네임</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_nick_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="password"
											name="m_pw" id="m_pw" class="form-control" required>
											<span class="label">비밀번호</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_pw_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="password"
											name="comfirm_password" id="comfirm_password"
											class="form-control" required> <span class="label">비밀번호
												확인</span> <span class="border"></span>
										</label>
										<div class="check_font" id="comfirm_password_check"></div>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-lock"></i></span> <span
								class="step-text">Personal</span>
						</h2>
						<section>
							<div class="inner">
								<h3>개인 정보:</h3>
								<div class="form-row">
									<div class="form-holder">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_name" name="m_name" required>
											<span class="label">이름</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_name_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div id="radio">
										<label>성별:</label> <input type="radio" name="m_gender"
											value="f" checked class="radio-1"> Female <input
											type="radio" name="m_gender" value="m"> Male
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_birth" name="m_birth" required>
											<span class="label">생년월일</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_birth_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_phone" name="m_phone" required>
											<span class="label">핸드폰 번호</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_phone_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											name="m_email" id="m_email" class="form-control" required>
											<span class="label">이메일 주소</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_email_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_post" name="m_post" required>
											<span class="label">우편번호</span> <span class="border"></span>
										</label>
										<div class="check_font"></div>
										
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>

									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_addr1" name="m_addr1" required>
											<span class="label">주소</span> <span class="border"></span>
										</label>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_addr2" name="m_addr2" required>
											<span class="label">상세주소</span> <span class="border"></span>
										</label>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-account"></i></span>
							<span class="step-text">Detail</span>
						</h2>
						<section>
							<div class="inner">
								<h3>추가 정보:</h3>
								<div class="form-row">
									<div id="radio">
										<label>SMS수신여부:</label> <input type="radio" name="m_re_sms"
											value="y"> Yes <input type="radio" name="m_re_sms"
											value="n" checked class="radio-1"> No
									</div>
								</div>

								<div class="form-row">
									<div id="radio">
										<label>메일수신여부:</label> <input type="radio" name="m_re_notice"
											value="y"> Yes <input type="radio" name="m_re_notice"
											value="n" checked class="radio-1"> No
									</div>
								</div>
								<div class="form-row">
									<div id="radio">
										<label>쪽지수신여부:</label> <input type="radio" name="m_re_message"
											value="y"> Yes <input type="radio"
											name="m_re_message" value="n" checked class="radio-1">
										No
									</div>
								</div>

								<div class="form-row">
									<div id="radio">
										<label>회원정보공개여부:</label> <input type="radio" name="m_info"
											value="y"> Yes <input type="radio" name="m_info"
											value="n" checked class="radio-1"> No
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_self" name="m_self" required>
											<span class="label">자기소개</span> <textarea rows="10"
												style="width: 100%;" class="border"> </textarea> <!--  <span class="border"></span> -->
										</label>
									</div>
								</div>
							</div>
						</section>

						<h2>
							<span class="step-icon"><i class="zmdi zmdi-receipt"></i></span>
							<span class="step-text">Confirm</span>
						</h2>
						<section>
							<div class="inner">
								<h3>확인:</h3>
								<div class="form-row table-responsive">
									<table class="table">
										<tbody>
											<tr class="space-row">
												<th>이름:</th>
												<td id="m_name-val"></td>
											</tr>
											<tr class="space-row">
												<th>아이디:</th>
												<td id="m_id-val"></td>
											</tr>
											<tr class="space-row">
												<th>닉네임:</th>
												<td id="m_nick-val"></td>
											</tr>
											<tr class="space-row">
												<th>성별:</th>
												<td id="m_gender-val"></td>
											</tr>
											<!-- <tr class="space-row">
												<th>생년월일:</th>
												<td id="m_birth-val"></td>
											</tr> -->
											<tr class="space-row">
												<th>전화번호:</th>
												<td id="m_phone-val"></td>
											</tr>
											<tr class="space-row">
												<th>이메일:</th>
												<td id="m_email-val"></td>
											</tr>
											<tr class="space-row">
												<th>우편번호:</th>
												<td id="m_post-val"></td>
											</tr>

											<tr class="space-row">
												<th>주소:</th>
												<td id="m_addr-val"></td>
											</tr>
											<tr class="space-row">
												<th>쪽지수신여부:</th>
												<td id="m_re_sms-val"></td>
											</tr>
											<tr class="space-row">
												<th>메일수신여부:</th>
												<td id="m_re_notice-val"></td>
											</tr>
											<tr class="space-row">
												<th>쪽지수신여부:</th>
												<td id="m_re_message-val"></td>
											</tr>
											<tr class="space-row">
												<th>회원정보공개여부:</th>
												<td id="m_info-val"></td>
											</tr>
											<tr class="space-row">
												<th>자기소개:</th>
												<td id="m_self-val"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


						</section>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/js/join/jquery-3.3.1.min.js"></script>
	<script src="resources/js/join/jquery.steps.js"></script>
	<script src="resources/js/join/jquery-ui.min.js"></script>
	<script src="resources/js/join/main.js"></script>
	<!-- <script src="resources/js/join/check.js"></script> -->


	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
</body>
</html>