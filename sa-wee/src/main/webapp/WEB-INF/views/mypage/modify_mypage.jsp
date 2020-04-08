<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SON-IN-RAW IS DICE - my page</title>

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="/css/mypage/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/mypage/style.css" />

<link rel="stylesheet" type="text/css" href="/css/mypage/liststyle.css" />
<!-- 403 에러 / csrf 토큰 문제 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- 우편번호 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('m_post').value = data.zonecode;
						document.getElementById("m_addr1").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
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
	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>

	<div class="container-fluid">
		<div class="cover">
			<div class="cover-layer">
				<div class="container web-portion">
					<form id="viewForm" class="form-register" action="/join"
						method="post">
						<div class="row top-det">
							<div class="col-md-4">
								<div class="profil-det-img d-flex">
									<div class="dp">
										<img src="images/bl_share/icons/login/wolf_logo.png" alt="">
									</div>
									<div class="pd">
										<h5>내 이미지</h5>
										<br />
										<p>
											<input type="file" name="file" id="fileCheck" />
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 eml-mob">
								<div class="pd">
									<br />
									<p>
										<label>닉네임</label> <input placeholder="Nickname..."
											class="w3-input" type="text" id="m_nick" name="m_nick"
											value="${ member.m_nick }">
									</p>
								</div>
							</div>
							<div class="col-md-4 eml-mob">
								<div class="pd">
									<br />
									<p>
										<label>비밀번호</label> <input placeholder="password"
											class="w3-input" type="password" id="m_pw" name="m_pw"
											value="">
									</p>
									<p>
										<label>비밀번호 확인</label> <input placeholder="password check"
											class="w3-input" type="password" id="m_pw2" name="m_pw2"
											value="">
									</p>
								</div>
							</div>
						</div>
						<div class="nav-detail">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="home-tab" data-toggle="tab" href="#home" role="tab"
									aria-controls="home" aria-selected="true">내 정보 수정</a></li>
							</ul>


							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row no-margin home-det">
										<div class="col-md-4 eml-mob">
											<br /> <br />
											<p>
												<label>아이디</label> <input class="w3-input" type="text"
													id="m_id" name="m_id" readonly value="${ member.m_id }">
											</p>
											<br />
											<p>
												<label>이메일</label> <input class="w3-input" type="text"
													id="m_email" name="m_email" value="${ member.m_email }">
											</p>
											<br />
											<p>
												<label>핸드폰</label> <input class="w3-input" type="text"
													id="m_phone" name="m_phone" value="${ member.m_phone }">
											</p>
											<br /> <br /> <br />

											<p>
												<label>우편번호</label> <input class="w3-input" type="text"
													id="m_nick" name="m_nick" value="${ member.m_post }">
											</p>
											<br />
											<p>
												<label>주소</label> <input class="w3-input" type="text"
													id="m_addr1" name="m_addr1" value="${ member.m_addr1 }">
											</p>
											<br />
											<p>
												<label>상세주소</label> <input class="w3-input" type="text"
													id="m_addr2" name="m_addr2" value="${ member.m_addr2 }">
											</p>
											<br />




										</div>
										<div class="col-md-8 home-dat">
											<div class="detal-jumbo">
												<h3>자기소개</h3>
												<p>
													<input class="w3-input" type="text" id="m_self"
														name="m_self" value="${ member.m_self }">
												</p>
												<br /> <br /> <br /> <br /> <br />
											</div>

											<div class="jumbo-address">
												<div class="row no-margin">
													<div class="col-lg-6 no-padding">

														<table class="addrss-list">
															<tbody>
																<tr>
																	<th>SMS수신여부</th>


																	<td><div id="radio">
																			<input type="radio" name="m_re_sms" value="y"
																				<c:if test='${member.m_re_sms.equals("y")}'> checked
																				class="radio-1"</c:if>>
																			Yes <input type="radio" name="m_re_sms" value="n"
																				<c:if test='${member.m_re_sms.equals("n")}'> checked class="radio-1"</c:if>>
																			No
																		</div></td>
																</tr>
																<tr>
																	<th>메일수신여부</th>
																	<td><div id="radio">
																			<input type="radio" name="m_re_notice" value="y"
																				<c:if test='${member.m_re_notice.equals("y")}'> checked
																				class="radio-1"</c:if>>
																			Yes <input type="radio" name="m_re_notice" value="n"
																				<c:if test='${member.m_re_notice.equals("n")}'> checked class="radio-1"</c:if>>
																			No
																		</div></td>
																</tr>
															</tbody>
														</table>

													</div>
													<div class="col-lg-6 no-padding">
														<table class="addrss-list">
															<tbody>
																<tr>
																	<th>쪽지수신여부</th>
																	<td><div id="radio">
																			<input type="radio" name="m_re_message" value="y"
																				<c:if test='${member.m_re_message.equals("y")}'> checked class="radio-1"</c:if>>
																			Yes <input type="radio" name="m_re_message" value="n"
																				<c:if test='${member.m_re_message.equals("n")}'> checked class="radio-1"</c:if>>
																			No
																		</div></td>
																</tr>
																<tr>
																	<th>회원정보공개여부</th>
																	<td><div id="radio">
																			<input type="radio" name="m_info" value="y"
																				<c:if test='${member.m_info.equals("y")}'> checked class="radio-1"</c:if>>
																			Yes <input type="radio" name="m_info" value="n"
																				<c:if test='${member.m_info.equals("n")}'> checked class="radio-1"</c:if>>
																			No
																		</div></td>
																</tr>
															</tbody>
														</table>													
													</div>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<div class="links">
												<div class="row ">
													<div class="col-xl-6 col-md-12">
														<ul class="btn-link">

															<li><a href="/mypage_modifyview"><i
																	class="fas fa-circle-notch"></i> 처음으로</a></li>

															<li><a href="#" onclick='m_update()'><i
																	class="fas fa-circle-notch"></i> 수정하기</a></li>
														</ul>
														<br /> <br />
														<ul class="btn-link">
															<li><a href="/mypage"><i
																	class="fas fa-address-card"></i> 마이페이지</a></li>

															<li class="btn-shake"><a href="#" onclick='m_out()'><i
																	class="fas fa-times"></i> 탈퇴</a></li>
														</ul>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function m_update() {
			var modify = document.getElementById("viewForm");
			modify.action = "<c:url value='/mypage_modify'/>";
			/* modify.setUrl("<c:url value='/admin/updateMember'/>"); */
			modify.submit();
			console.log("modify");
		}

		function m_out() {
			var out = document.getElementById("viewForm");
			out.action = "<c:url value='/admin/outMember_user'/>";
			out.submit();
			console.log("out");
			alert("해당 회원이 탈퇴처리 되었습니다.");
		}
	</script>

</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<script src="js/mypage/file.js"></script>
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="/js/header/jquery.slicknav.min.js"></script>
<script src="/js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>
<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js"
	integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8="
	crossorigin="anonymous"></script>


</html>