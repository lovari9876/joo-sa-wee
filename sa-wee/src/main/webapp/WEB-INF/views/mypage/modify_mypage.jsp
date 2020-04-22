<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>내 사위는 주사위</title>

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="/css/mypage/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/mypage/style.css" />
<!-- 403 에러 / csrf 토큰 문제 -->
<%-- <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" /> --%>
<!-- 우편번호 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>

	<div class="container-fluid">
		<div class="cover">
			<div class="cover-layer">
				<div class="container web-portion">
					<form id="viewForm" class="form-register" action="/mypage_modify"
						method="post">
						<div class="row top-det">
							<div class="col-md-4">
								<div class="profil-det-img d-flex JSD-Bold-12">
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
							<div class="col-md-4 eml-mob JSD-Bold-12"
								style="border-right: none;">
								<div class="pd">
									<br />
									<p>
										<label>아이디</label> <input class="form-control" type="text"
											id="m_id" name="m_id" readonly value="${ member.m_id }">
									</p>
								</div>
							</div>
							<div class="col-md-4 eml-mob JSD-Bold-12"
								style="border-right: none;">
								<div class="pd">
									<br />
									<p>
										<label>닉네임</label> <input class="form-control" type="text"
											id="m_nick" name="m_nick" value="${member.m_nick}">
									</p>
									<div class="check_font" id="m_nick_check"></div>
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
								<div class="tab-pane fade show active JSD-Bold-12" id="home"
									role="tabpanel" aria-labelledby="home-tab">
									<div class="row no-margin home-det">
										<div class="col-md-4 eml-mob">
											<br />

											<p>
												<label>우편번호</label> <input type="text" class="form-control"
													id="m_post" name="m_post" required
													value="${ member.m_post }">
											</p>
											<input type="button" onclick="sample4_execDaumPostcode()"
												value="우편번호 찾기"> <br />
											<p>
												<label>주소</label> <input class="form-control" type="text"
													id="m_addr1" name="m_addr1" value="${ member.m_addr1 }">
											</p>

											<p>
												<label>상세주소</label> <input class="form-control" type="text"
													id="m_addr2" name="m_addr2" value="${ member.m_addr2 }">
											</p>
											<br /> <br />
											<p>
												<label>은행</label> <input class="form-control" type="text"
													id="m_bank" name="m_bank" value="${ member.m_bank }">
											</p>
											<p>
												<label>계좌번호</label> <input class="form-control" type="text"
													id="m_account" name="m_account"
													value="${ member.m_account }">
											</p>

										</div>
										<div class="col-md-8 home-dat">
											<div class="detal-jumbo">
												<h3>자기소개</h3>
												<p>
													<textarea name="m_self" id="m_self" rows="7"
														class="form-control" style="resize: none;">${ member.m_self }</textarea>
												</p>
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

											<%-- <input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> --%>

											<div class="row no-margin home-det">
												<div class="col-md-4 eml-mob" style="border-right: none;">
													<div class="pd">
														<br /> <br /> <label>이메일</label> <input
															class="form-control" type="text" id="m_email"
															name="m_email" value="${ member.m_email }" readonly>
														<div class="check_font" id="m_email_check"></div>
														<a href="#" class="btn btn-lavender"
															onclick="window.open(this.href, '', 'width=500, height=630, left=600, top=200'); return false;"><i
															class="fas fa-circle-notch"></i>이메일 변경</a>

													</div>
												</div>
												<div class="col-md-4 eml-mob" style="border-right: none;">
													<div class="pd">
														<br /> <br /> <label>핸드폰</label> <input
															class="form-control" type="text" id="m_phone"
															name="m_phone" value="${ member.m_phone }" readonly>
														<div class="check_font" id="m_phone_check"></div>
														<a href="#" class="btn btn-lavender"
															onclick="window.open(this.href, '', 'width=500, height=630, left=600, top=200'); return false;"><i
															class="fas fa-circle-notch"></i>핸드폰 변경</a>
													</div>
												</div>
												<%-- <div class="col-md-4 eml-mob" style="border-right: none;">
													<div class="pd">
														<br /> <label>이메일</label> <input class="form-control"
															type="text" id="m_email" name="m_email"
															value="${ member.m_email }">

														<div class="check_font" id="m_email_check"></div>

														<br /> <label>핸드폰</label> <input class="form-control"
															type="text" id="m_phone" name="m_phone"
															value="${ member.m_phone }">

														<div class="check_font" id="m_phone_check"></div>
														<br />

													</div>
												</div>
												<div class="col-md-4 eml-mob" style="border-right: none;">
													<div class="pd">
														<br /> <label>비밀번호</label> <input placeholder="password"
															class="form-control" type="password" id="m_pw"
															name="m_pw" value="">
														<div class="check_font" id="m_pw_check"></div>
														<br /> <label>비밀번호 확인</label> <input
															placeholder="comfirm password" class="form-control"
															type="password" id="comfirm_password"
															name="comfirm_password" value="">
														<div class="check_font" id="comfirm_password_check"></div>
													</div>
												</div> --%>
												<div class="col-md-4 eml-mob">
													<div class="pd">
														<div class="links">
															<div class="row">
																<ul class="">
																	<li><a href="/pw_modifyview"
																		class="btn btn-lavender margin-left-11"
																		onclick="window.open(this.href, '', 'width=500, height=500, left=600, top=300'); return false;"><i
																			class="fas fa-circle-notch"></i>비밀번호 변경</a></li>
																	<li><button
																			class='btn-a btn btn-lavender margin-left-11'
																			onclick="m_update()">
																			<i class="fas fa-circle-notch"></i>수정하기
																		</button></li>

																	<li style="cursor: pointer;"><a href="/mypage"
																		class="btn btn-lavender margin-left-11"><i
																			class="fas fa-address-card"></i>돌아가기</a></li>
																	<li class="btn-shake"><a href="/outview"
																		class="btn btn-lavender margin-left-11"
																		onclick="window.open(this.href, '', 'width=500, height=500, left=600, top=200'); return false;"><i
																			class="fas fa-times"></i>탈퇴</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="links">
											<div class="row ">
												<ul class="btn-link">
													<li class="btn-shake" ><a onclick='m_out()'><i
															class="fas fa-times" ></i>탈퇴</a></li>
												</ul>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<!-- <script src="js/mypage/file.js"></script> -->
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>
<script src="js/mypage/main.js"></script>
<script src="js/join/address_api.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="/js/header/jquery.slicknav.min.js"></script>
<script src="/js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>
<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js"
	integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8="
	crossorigin="anonymous"></script>


</html>