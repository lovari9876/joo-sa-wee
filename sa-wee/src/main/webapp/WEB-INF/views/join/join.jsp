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
<%-- <meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" /> --%>
<!-- 우편번호 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
											name="m_pw" id="m_pw" class="form-control password-font"
											required> <span class="label">비밀번호</span> <span
											class="border"></span>
										</label>
										<div class="check_font" id="m_pw_check"></div>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="password"
											name="comfirm_password" id="comfirm_password"
											class="form-control password-font" required> <span
											class="label">비밀번호 확인</span> <span class="border"></span>
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
										<input type="button" class="btn btn-info" id="phoneBtn"
											value="핸드폰 인증번호 발송" /> <label class="form-row-inner">
											<input type="text" class="form-control" id="randomSMS"
											name="randomSMS" required> <span class="label">핸드폰
												인증번호 입력</span> <span class="border"></span>
										</label>
										<div class="check_font"></div>
										<input type="button" class="btn btn-info" id="smsBtn"
											value="핸드폰 인증" /> <input type="hidden" id="phone_pass"
											value="N" />
									</div>
								</div>
								<div class="form-row"></div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											name="m_email" id="m_email" class="form-control" required>
											<span class="label">이메일 주소</span> <span class="border"></span>
										</label>
										<div class="check_font" id="m_email_check"></div>
										<input type="button" class="btn btn-info" id="emailBtn"
											value="이메일 발송" /> <label class="form-row-inner"> <input
											type="text" name="random_check" id="random_check"
											class="form-control" required> <span class="label">이메일
												인증번호 입력</span> <span class="border"></span>
										</label>
										<div class="check_font"></div>
										<input type="button" class="btn btn-info" id="emailAuthBtn"
											value="이메일 인증" />
										<%-- <input type="hidden" path="random" id="random" value="${random }" /> --%>
										<input type="hidden" id="email_pass" value="N" />
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<label class="form-row-inner"> <input type="text"
											class="form-control" id="m_post" name="m_post" required>
											<span class="label">우편번호</span> <span class="border"></span>
										</label>
										<div class="check_font"></div>

										<input type="button" onclick="sample4_execDaumPostcode()"
											value="우편번호 찾기"><br>
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
								<br /> <br />
								<div class="form-row">
									<div class="form-holder form-holder-1">
										<!-- <label class="form-row-inner"> <input type="text"
											class="form-control" id="m_self" name="m_self" required>
											<span class="label">자기소개</span> <textarea rows="10"
												style="width: 100%;" class="border"> </textarea><span
											class="border"></span>
										</label> -->
										<label class="form-row"> <textarea name="m_self"
												id="m_self" cols="50" class="form-control font-JS"
												style="resize: none;" onkeydown="resize(this)"
												onkeyup="resize(this)"></textarea> <span class="label">자기소개</span>
											<span class="border"></span>
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
											<tr class="space-row">
												<th>회원약관</th>
												<td></td>
											</tr>
											<tr class="space-row">
												<th></th>
												<td></td>
											</tr>
										</tbody>
									</table>

								</div>

								<table class="table">
									<tbody>
										<tr class="space-row">
											<td colspan="2"><textarea id="agree-check" readonly>
					제1조 (목적)
					
이 이용약관(이하 '약관'이라 합니다)은 이용고객(이하 '회원'이라 합니다)이 ㈜내 사위는 주사위(이하 '회사'라 합니다)의 커뮤니티 서비스(이하 '서비스'라 합니다)를 이용함에 있어 회사와 회원간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.


제2조 (약관의 명시와 개정)
① 회사는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 회사 서비스의 초기화면 또는 연결화면을 통하여 게시합니다.
② 회사는 약관의 규제에 관한 법률, 전자문서 및 전자거래 기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③ 회사는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 회사 서비스나 커뮤니티의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
④ 회원은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. 회원이 거부하는 경우 회사는 당해 회원과의 계약을 해지할 수 있습니다. 만약 회원이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.
⑤ 회사는 이 약관에서 구체적 범위를 정하여 위임한 사항에 관하여, 운영정책을 정할 수 있습니다. 운영정책은 각 커뮤니티 별로 공개합니다.
⑥ 운영정책은 이 약관과 동일한 효력을 가지나, 운영정책 중 이 약관에서 위임받지 아니한 사항 및 약관의 내용에 반하는 사항은 그러하지 않습니다.  

 

제3조 (회원가입 및 이용계약체결 신청 등)
① 회원이 되고자 하는 자는 회사가 정한 커뮤니티 회원 가입 양식에 따라 SNS 계정 연동 방법으로 회원가입 및 커뮤니티 이용계약체결을 신청합니다.
② 회사는 제1항과 같이 회원으로 가입할 것을 신청한 자를 다음 각 호에 해당하지 않는 한커뮤니티 이용 회원으로 등록하며, 이용계약체결 신청을 승낙, 체결합니다.  

  1) 가입신청자가 본 약관 제4조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우.  
    다만 제4조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원재가입 승낙을 얻은 경우에는 예외로 합니다.  
  2) 등록 내용에 허위, 기재누락, 오기가 있는 경우 
  3) 기타 회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우 
     - 해당 게임이 청소년 이용불가 게임이거나 기타 청소년이 이용하기 부적절한 경우, 청소년 또는 미성년자가 회원등록을 신청할 때 
     - 기타 해당 게임의 등급 등을 고려하여 해당 게임의 커뮤니티 운영자가 운영정책으로 커뮤니티 가입연령을 제한하였는데, 그 연령에 달하지 아니한 자가 회원등록을 신청할 때 

③ 회사는 서비스 이용계약체결 신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.  

  1)  회사의 설비 여유가 없는 경우  
  2)  회사의 기술상 일시적 지장이 있는 경우  
  3)  기타 회사의 귀책사유로 이용승낙이 곤란한 경우  

④ 회사는 이용계약체결 신청고객이 관계법령에서 규정하는 미성년자일 경우에 서비스별 안내에서 정하는 바에 따라 승낙을 보류 또는 거절할 수 있습니다.
⑤ 회원가입 및 이용계약 체결의 성립시기는 회사의 승낙이 가입신청자에게 도달한 시점으로 합니다.
⑥ 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.
  


제4조 (탈퇴요청, 이용정지 등)
① 회원은 회사에 언제든지 자신의 회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청할 수 있으며 회사는 위 요청을 받은 즉시 해당 이용자의 회원 등록 말소를 위한 절차를 밟습니다. 이 경우 회원이 게재한 게시물은 제8조, 제9조에 따릅니다. 

② 회원이 다음 각호의 사유에 해당하는 경우, 회사는 회원에 대해서 이용정지 조치를 취할 수 있습니다. 이용정지는 영구이용정지와 한시적 이용정지로 나뉘고, 한시적 이용정지는 각 기간을 달리하여 운영정책에서 정할 수 있습니다. 각 이용정지의 사유 및 기간은 운영정책에서 규정할 수 있습니다. 한시적 이용정지는 한시적 기간동안 회원이 커뮤니티의 모든 활동(열람, 게재 등)을 못하게 하는 조치이며, 영구이용정지는 해당 커뮤니티에서 이용자를 탈퇴시킨 후 재가입을 금지시키는 조치입니다. 상세한 조치는 운영정책에서 정합니다. 이용정지 조치를 받은 회원이 게재한 게시물은 제8조, 제9조에 따릅니다. 

      1)  가입 신청 시에 허위 내용을 등록한 경우  
          2)  서비스 이용과 관련하여 회원이 부담하는 대금 등의 채무를 기일에 지급하지 않는 경우  
          3)  다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우  
          4)  서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우  
          5)  해당 게임이 청소년 이용불가 게임이거나 기타 청소년이 이용하기 부적절한 경우, 청소년 또는 미성년자가 회원등록을 신청할 때  
          6)   기타 해당 게임의 등급 등을 고려하여 커뮤니티 운영자가 커뮤니티 가입연령을 제한하였는데, 그 연령에 달하지 아니한 자가 회원등록을 신청할 때  
          7)  타인의 개인정보나 이를 유추할 수 있는 정보 등을 커뮤니티에 공개하는 경우  
          8)  게임의 기능이나 버그를 남용하는 행위를 방조하거나 권장하거나 이에 관한 정보를 게재하는 경우(단 이를 신고하거나 문의하는 경우는 제외)  
          9)  핵프로그램 기타 회사가 제공 승인하지 아니한 프로그램을 제작, 배포, 이용, 광고하거나 이에 관한 정보를 제개하는 경우(단 이를 신고하거나 문의하는 경우는 제외)  
        10)  작업장 운영, 메크로 프로그램 제작, 배포, 광고 등, 불법환불, 허용되지 아니한 거래소, 아이템이나 게임머니 등의 허용되지 아니한 거래에 관한 정보를 게재하는 경우  
          (단, 이를 신고하거나 문의하는 경우는 제외) 
        11)  개인정보 보호에 관한 법령을 위반하여 개인정보를 거래하는 내용의 정보  
        12)  총포ㆍ화약류(생명ㆍ신체에 위해를 끼칠 수 있는 폭발력을 가진 물건을 포함한다)를 제조할 수 있는 방법이나 설계도 등의 정보를 공개하는 경우  
        13)  사해행위에 해당하는 내용을 공개하는 경우  
        14)  영리적 목적으로 광고성 정보를 게시하는 경우  
        15)  계속하여 동일, 유사한 다수의 정보를 게시하는 경우  
        16)  회원이 해당 게임 서비스 회원인 경우, 그 해당 게임의 약관에 위반하여 제재를 받은 경우  
        17)  기타 본약관, 운영정책, 법령을 위반한 경우 및 위 열거된 사유에 준하는 행위로서 운영정책에서 정한 경우  

③ 회사가 회원에게 한시적 이용정지 조치를 하였음에도 불구하고 회원이 동일한 행위를 2회이상 반복하거나 30일이내에 그 사유를 시정하지 않는 경우 회사는 회원에게 영구적 이용정지 조치를 할 수 있습니다.
④ 회사가 회원에게 이용정지 조치를 하는 경우에는 회원에게 이를 통지하고 소명할 기회를 부여할 수 있습니다. 단, 사안의 중대성 또는 긴급성에 비추어 회원에게 이용정지 조치를 한 후 사후적으로 커뮤니티 내 연락방법을 통하여 통지하거나 소명기회를 부여할 수 있습니다. 자세한 절차는 운영정책에서 정할 수 있습니다.
⑤ 회사는 본 서비스를 이용하는 회원에 대하여 회원의 연령, 서비스 이용내용, 시간 및 회수 등에 따라 등급별로 세분하여 서비스 이용에 차등을 둘 수 있습니다. 자세한 것은 운영정책에서 정할 수 있습니다.
⑥ 회원이 해당 게임의 회원인 경우에, 회원이 본 약관을 위반하면 해당 게임의 이용도 제재를 받을 수 있습니다. [이2] 


제5조 (개인정보의 보호 및 사용, 자동 탈퇴)

① 회사는 관계법령이 정하는 바에 따라 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위해 노력합니다. 회원 개인정보의 보호 및 사용에 대해서는 관련법령 및 회사의 개인정보보호정책이 적용됩니다. 자세한 사항은 운영정책 내지는 개인정보처리방침에서 정할 수 있습니다.
② 회사는 다음과 같은 경우에 법에서 허용하는 범위 내에서 이용자의 성명, 전자우편주소 등 이용자의 개인정보를 제3자에게 제공할 수 있습니다.  

    1) 이용자가 서비스를 이용함에 있어 관련 법률을 위반하여 수사기관이나 기타 정부기관으로부터 정보제공을 요청 받는 경우 
    2) 이용자의 법률위반, 본 서비스 약관위반을 포함하여 부정행위 확인 등의 정보보호업무를 위해 필요한 경우   
    3) 기타 법률에 의해 요구되는 경우 

③ 회사의 공식사이트 외부에서 링크된 정보에 대해서는 회사의 개인정보 보호정책이 적용되지 않습니다. 또한 회사는 이용자의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.  
④ 회사는 회원의 개인정보 보호 및 계정도용 방지를 위해 1년간 한번도 접속하지 아니한 경우 계정의 보유를 중단하고, 회원은 자동으로 회원탈퇴됩니다.  
    이를 ‘자동 탈퇴’라고 합니다. 이 경우 회원이 게재한 게시물은 제8조, 제9조에 따릅니다.  
    자동 탈퇴한 회원이 재가입하더라도 자동 탈퇴 전에 게시한 게시물에 대한 접근권한을 회복하는 것은 아닙니다. 


제6조 (서비스의 제공 및 변경)

① 회사는 회원에게 아래와 같은 서비스를 제공합니다.  

    1) 개인 게시물을 작성(사진, 동영상, 음악 등 파일첨부 기능 포함)하거나 삭제할 수 있는 시스템 
     2) 커뮤니티 닉네임을 생성할 수 있는 시스템  
     3) 게임이나 게시물에 대한 의견이나 목록을 생성 및 게재할 수 있는 시스템  
     4) 회원간 정보문의 및 답변을 할 수 있는 시스템  
     5) 기타 회사가 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스  
     6) 기타 운영정책에서 정한 서비스  

② 회사는 제공서비스의 품질 또는 기술적 사양에 대한 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 서비스의 내용을 변경할 수 있습니다.  
    이 경우 변경되는 서비스의 내용 및 제공일자를 명시하여 현재의 서비스의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.
 


제7조 (서비스의 이용 및 중단)

① 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 회사는 시스템 정기점검, 증설 및 교체를 위해 회사가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시중단은 사전에 공지합니다.
② 회사는 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 회사가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
③ 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 회원에게 사전 또는 사후에 공지합니다.
④ 회사는 자신이 통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며 타인(기간통신사업자 등)의 고의, 과실로 인한 시스템 중단 등의 경우에는 통지하지 않습니다.
⑤ 회사는 서비스를 특정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다.  
⑥ 본조의 내용에 관해서는 운영정책에서 자세히 정할 수 있습니다.
 
제8조 (회원의 게시물)

① 게시물이라 함은 커뮤니티에 회원이 생성한 글, 사진, 동영상, 그림 등 각종 파일과 링크, 타인이 등록한 글에 대한 댓글, 회원간 질의응답을 위한 글, 커뮤니티 운영게시판에 등록한 글(이하 ‘게시물’이라고 합니다) 등을 포함합니다. 회원은 자신이 생성한 게시물을 회원지위를 유지하는 동안 언제든지 삭제할 수 있습니다.
② 회원이 게시하는 정보등으로 인해 발생하는 손실이나 문제는 전적으로 회원 개인의 판단에 따른 책임이며, 회사의 고의가 아닌 한, 회사는 이에 대하여 책임지지 않습니다.
③ 회원은 공공질서나 미풍양속에 위배되는 내용과 타인의 저작권을 포함한 지적재산권 및 기타 권리를 침해하는 내용물에 대하여는 등록할 수 없으며, 만일 이와 같은 내용의 게시물로 인해 발생하는 결과에 대한 모든 책임은 회원 본인에게 있습니다.
④ 회사는 커뮤니티 서비스 운영목적에 반한다고 판단되는 다음의 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다. 다만 법령에서 규정한 경우를 제외하고, 회사가 다음의 게시물이나 자료를 삭제해야 하는 의무를 부담하는 것은 아닙니다. 

      1) 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우 
       2) 타인의 권리를 침해하는 행위와 관련되거나, 그 행위를 구성하는 게시물, 자료로서 이해당사자의 삭제 등 요청이 있거나 회사가 피소, 고발 될 수 있는 근거를 제공하는 게시물  
       3) 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 사진, 그림, 이모티콘, 문장, 도형, 음향, 동영상을 전송, 게시하거나 링크 시키는 경우  
       4) 사적인 정치적 판단이나, 종교적 견해의 내용으로 회사가 서비스성격에 부합하지 않는다고 판단하는 경우  
       5) 불법복제 또는 해킹을 조장하는 내용인 경우  
       6) 영리를 목적으로 하는 광고를 게시하는 등 상업적 이용이라고 판단되는 경우  
       7) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우  
       8) 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우  
       9) 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우  
     10) 동일, 유사한 게시물을 반복하여 게재하는 경우  
     11) 회사 및 게임에 관한 미공개 정보를 공개하는 경우  
     12) 타인의 개인정보나 이를 유추할 수 있는 내용 등을 공개하는 경우  
     13) 게임의 기능이나 버그를 남용하는 행위를 방조하거나 권장하거나 이에 관한 정보를 게재하는 경우(단 이를 신고하거나 문의하는 경우는 제외)  
     14) 핵프로그램 기타 회사가 제공 승인하지 아니한 프로그램을 제작, 배포, 이용, 광고하거나 이에 관한 정보를 제개하는 경우(단 이를 신고하거나 문의하는 경우는 제외)  
     15) 작업장 운영, 메크로 프로그램 제작, 배포, 광고 등, 불법환불, 허용되지 아니한 거래소, 아이템이나 게임머니 등의 허용되지 아니한 거래에 관한 정보를 게재하는 경우  
          (단 이를 신고하거나 문의하는 경우는 제외) 

             - 개인정보 보호에 관한 법령을 위반하여 개인정보를 거래하는 내용의 정보 
              - 총포ㆍ화약류(생명ㆍ신체에 위해를 끼칠 수 있는 폭발력을 가진 물건을 포함한다)를 제조할 수 있는 방법이나 설계도 등의 정보를 공개하는 경우  
              - 사해행위에 해당하는 내용을 공개하는 경우  

     16) 기타 관계법령, 본약관, 운영정책에 위배된다고 판단되는 경우  
    1 7) 회원이 해당 게임 서비스 회원인 경우, 그 해당 게임의 약관에 위반하여 제재를 받은 경우 
     18) 기타 법령을 위반하거나 위 열거된 사유에 준하는 행위로서 운영정책에서 정한 경우  

⑤ 회사는 게임서비스 종료, 운영이나 경영상의 이유로 언제든지, 회원의 동의 없이 커뮤니티를 폐쇄할 수 있으며, 이럴 경우 커뮤니티에 게재된 게시물은 별도 보관이나 통지, 소명 없이 삭제됩니다. 

 

제9조 (게시물에 대한 저작권 등)

① 회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.
② 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙없이 복제, 송신, 출판, 전송, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
③ 회원이 등록한 게시물에 대한 저작권은 해당 저작권자에게 귀속합니다.
④ 회원은 자신이 창작, 등록한 게시물에 대하여 회사가 커뮤니티 서비스를 운영, 전시, 전송배포 또는 홍보하기 위한 목적으로 다음의 각호에 행위를 할 수 있는, 세계적이고 사용료 없는 비독점적 사용권을 회사에게 부여합니다.  

         - 커뮤니티 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포, 출판 및 2차 저작물과 편집 저작물 작성 
          - 회사에서 제공하는 관련 서비스내에서 회원 게시물의 복제, 수정, 개조, 전시, 배포, 출판 및 2차 저작물과 편집 저작물 작성  
          - 미디어, 통신사 등 커뮤니티 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 사용하게 하는 것.   
           단, 이 경우 회사는 회원의 별도 동의없이 개인정보를 제휴 파트너에게 제공하지 않습니다. 

⑤ 본조 제4항에 의해 회사가 부여받은 사용권은 회사가 커뮤니티 서비스를 운영하는 동안 확정적으로 유효하나, 저장용량 초과, 운영상의 어려움, 기타 합리적 사정이 있으면 회사가 게시물을 삭제할 수 있습니다. 회원의 탈퇴요청에 의한 탈퇴, 이용정지, 자동 탈퇴 후에도 회사가 부여받은 사용권은 유효하나, 커뮤니티 운영자의 판단으로 회원의 게시물을 삭제할 수 있습니다. 회원의 탈퇴요청에 의한 탈퇴, 이용정지, 자동탈퇴 후 회원이 다시 가입하더라도, 그 회원이 탈퇴, 이용정지 전에 게시한 게시물에 접근할 수 있는 권한을 회복하는 것은 아닙니다.
⑥ 회사는 본조 제4항 이외의 방법으로 회원의 게시물을 상업적으로 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다. 단, 회원정보에 등록된 연락처가 사실과 다르거나 회원이 회사의 연락에 응하지 않아 사전에 동의를 구하지 못한 경우, 회사는 사후에 동의 절차를 구할 수 있습니다. 회사가 본 항에 따라 회원의 게시물을 상업적으로 이용할 경우 회사는 별도의 보상제도를 운영할 수 있습니다.
⑦ 게시물에 대하여 제3자로부터 저작권 및 기타 권리의 침해 또는 명예훼손, 음란성 등의 이유로 이의가 제기된 경우 회사는 당해 게시물을 임시 삭제할 수 있으며, 이의를 제기한 자와 게시물 등록자 간에 소송, 합의 등을 통해 당해 게시물에 관한 법적 문제가 종결된 후 이를 근거로 회사에 신청이 있는 경우에만 상기 임시 삭제된 게시물은 다시 등록될 수 있습니다.

 
제10조 (정보의 제공)

① "회사는 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 전자우편이나 서신우편, 커뮤니티 내의 알림창, 기타 운영정책에서 정한 방법으로 회원에게 제공할 수 있습니다. 다만 광고성 정보에 대해서는 회사는 별도의 동의를 얻어서 회원에게 전송합니다.
② 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 추가적인 개인 정보를 요구할 수 있습니다.

 
제11조 (회사의 의무)

① 회사는 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.
② 회사는 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 한 지체없이 이를 수리 또는 복구합니다.
③ 회사는 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수합니다.
④ 회사는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 이용자에게 그 사유와 처리일정을 통보하여야 합니다.

  


제12조 (회원의 의무)

① 이용자는 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다.
② 회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등 회사가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상시키는 행위를 해서는 안됩니다.
③ 회원은 주소, 연락처, 전자우편 주소 등 이용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 회사에 즉시 알려야 합니다.
④ 회사가 관계법령 및 '개인정보 보호정책'에 의거하여 그 책임을 지는 경우를 제외하고 회원에게 부여된 ID의 비밀번호 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
⑤ 회원은 회사의 사전 승낙 없이 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동의 결과에 대해 회사는 책임을 지지 않습니다. 또한 회원은 이와 같은 영업활동으로 회사가 손해를 입은 경우, 회원은 회사에 대해 손해배상의무를 지며, 회사는 해당 회원에 대해 서비스 이용정지 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.
⑥ 회원은 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.
⑦ 회원은 회사 및 제 3자의 지적 재산권을 침해해서는 안됩니다.
⑧ 회원은 커뮤니티 서비스를 이용함에 있어 아래의 행위를 하여서는 안되며, 해당 행위를 하는 경우에는 서비스 혜택을 지급받지 못하거나 부정한 방법의 결과로 지급받은 금액에 대해서 즉시 반납해야 합니다. 

    1) 게임 내 영리적 이익을 위해 적합하지 않는 글을 쓰는 행위 
    2) 영리적 이익을 추천을 요구하거나 유도하는 행위 
    3) 기타 서비스 취지에 맞지 않은 방식으로 운영되거나 회사를 기만하는 방법을 쓰는 행위 

⑨ 회원은 다음 각 호에 해당하는 행위를 하여서는 안되며, 해당 행위를 하는 경우에 회사는 이용정지나 게시물 삭제 등의 제재를 가할 수 있습니다. 구체적인 의무위반에 따른 이용정지 및 게시물 삭제의 방법 등은 개별 게임 커뮤니티 운영정책에서 정할 수 있습니다. 

       1) 회원가입 신청 또는 회원정보 변경 시 허위내용을 등록하는 행위  
       2) 다른 이용자의 ID, 비밀번호, E-mail을 도용하는 행위  
       3) 이용자 ID를 타인과 거래하는 행위  
       4) 회사의 운영진, 직원 또는 관계자를 사칭하는 행위  
       5) 회사로부터 특별한 권리를 부여받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나,   
        웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 6변경하는 행위 
       6) 서비스에 위해를 가하거나 고의로 방해하는 행위  
       7) 본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위  
       8) 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위  
       9) 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위  
     10) 다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위  
     11) 회사의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는 저장하는 행위  
     12) 범죄와 결부된다고 객관적으로 판단되는 행위  
     13) 본 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용 조건을 위반하는 행위  
     14) 영리, 영업, 광고, 홍보, 정치활동, 선고운동 등 본래의 용도 이외의 용도로 ‘서비스’를 이용하는 행위  
     15) 개인정보 보호에 관한 법령을 위반하여 개인정보를 거래하는 내용의 정보를 공개하는 행위  
     16) 총포ㆍ화약류(생명ㆍ신체에 위해를 끼칠 수 있는 폭발력을 가진 물건을 포함한다)를 제조할 수 있는 방법이나 설계도 등의 정보를 공개하는 행위  
     17) 사해행위에 해당하는 내용을 공개하는 행위  
     18) 계속하여 동일, 유사한 다수의 정보를 게시하는 행위  
     19) 기타 관계법령에 위배되는 행위 및 본약관이나 운영정책에서 금지되는 행위  

 

제13조 (책임)

① 회사는 서비스 이용과 관련하여 회사의 고의 또는 중과실이 없는 한 회원에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다. 회사는 서비스 이용과 관련한 정보, 제품, 서비스, 소프트웨어, 그래픽, 음성, 동영상의 적합성, 정확성, 시의성, 신빙성에 관한 보증 또는 담보책임을 부담하지 않습니다.
② 회사는 회원들의 게시물을 사전 심의 및 검토하지 아니하고, 게시물에 대한 의무나 그 결과에 대한 책임을 지지 아니합니다.  
③ 회원은 회사의 고객지원용 메일과 전화를 통해서 회원정보처리에 관한 불만사항을 개진할 수 있습니다.
 


제14조 (면책조항)

① 회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
② 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.
③ 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
④ 회사는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.
⑤ 회사는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
⑥ 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.
⑦ 회사는 회원이 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다. 또한 회사는 회원이 서비스를 이용하며 타 회원으로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을 지지 않습니다.
⑧ 회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.
⑨ 회사는 이용자 상호간 및 이용자와 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.
⑩ 회사에서 회원에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지 않습니다.
 


제15조 (통지)

① 회사는 회원 개인에게 통지할 필요성이 있을 경우, ‘서비스’ 내 알림 기능 및 운영정책에서 정한 방법을 통하여 개별 통지할 수 있습니다.  
② 회사는 불특정다수 회원에게 통지할 필요성이 있을 경우, 1주일 이상 회사 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 


제16조 (재판권 및 준거법)

① 이 약관에 명시되지 않은 사항은 운영정책, 전기통신사업법 등 관계법령과 상관습에 따릅니다.
② 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 회사의 본사 소재지를 관할하는 법원을 관할 법원으로 합니다.
									</textarea></td>
										</tr>
										<tr>
											<td colspan="2" style="float: right;"><input
												type="checkbox" name="agree" value="N" id="agree"><label
												for="agree">회원가입약관의 내용에 동의합니다.</label></td>
										</tr>
									</tbody>
								</table>
							</div>


						</section>
					</div>
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/js/join/jquery-3.3.1.min.js"></script>
	<script src="resources/js/join/jquery.steps.js"></script>
	<script src="resources/js/join/jquery-ui.min.js"></script>
	<!-- 로딩바 -->
	<script src="resources/js/join/loadingbar.js"></script>

	<script src="resources/js/join/main.js"></script>
	<script src="resources/js/join/address_api.js"></script>
	<script src="resources/js/join/email.js"></script>
	<script src="resources/js/join/sms.js"></script>

	<script>
		function resize(obj) {
			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		}
	</script>


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