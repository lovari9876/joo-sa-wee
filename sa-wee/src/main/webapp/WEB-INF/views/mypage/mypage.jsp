<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<link rel="stylesheet" type="text/css" href="/css/mypage/liststyle.css" />

<link rel="stylesheet" type="text/css" href="/css/mypage/cassie/mypagestyle.css" />

</head>

<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>
	
	<div class="container-fluid">
		<div class="cover">
			<div class="cover-layer">
				<div class="container web-portion">
					<div class="row top-det">
						<div class="col-md-4">
							<div class="profil-det-img d-flex JSD-Bold-12">
								<div class="dp">
									<img src="images/bl_share/icons/login/wolf_logo.png" alt="">
								</div>
								<div class="pd">
									<h2>${member.m_nick}</h2>
									<p>
										${member.getR_name(member.r_no)}
										<%-- <c:if test="${member.r_no == 1}">
                                        	보드대마왕
                                        </c:if>
										<c:if test="${member.r_no == 2}">
                                      		보드마스터
                                        </c:if>
										<c:if test="${member.r_no == 3}">
                                        	보드게이머
                                        </c:if>
										<c:if test="${member.r_no == 4}">
                                       		표류자
                                        </c:if> --%>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 eml-mob JSD-Bold-12" style="border-right: none;">
							<ul>
								<li>작성글 수 : ${myWriteCount}</li>
								<li>댓글 수 : ${myReplyCount}</li>
							</ul>
						</div>
						<div class="col-md-4 eml-mob JSD-Bold-12" style="border-right: none;">
							<ul>
								<li>포인트 : ${member.m_point}</li>
								<li>안 본 쪽지 :</li>
							</ul>
						</div>
					</div>
					<div class="nav-detail">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">내 정보</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile"
								<c:out value="${cate == 'board' ? 'aria-selected=\"true\"' : 'aria-selected=\"false\"'}"/>>내
									글</a></li>
							<li class="nav-item"><a class="nav-link" id="education-tab"
								data-toggle="tab" href="#education" role="tab"
								aria-controls="contact" aria-selected="false">내 댓글</a></li>
							<li class="nav-item"><a class="nav-link" id="portfolio-tab"
								data-toggle="tab" href="#portfolio" role="tab"
								aria-controls="contact" aria-selected="false">내 스크랩</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#contact" role="tab"
								aria-controls="contact" aria-selected="false">내 후원/신고 </a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#trade" role="tab"
								aria-controls="contact" aria-selected="false">내 거래 </a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active JSD-Bold-12" id="home"
								role="tabpanel" aria-labelledby="home-tab">
								<div class="row no-margin home-det">
									<div class="col-md-4 eml-mob">
										<ul>
											<li>아이디 : ${member.m_id}</li>
											<br />
											<li>이메일 : ${member.m_email}</li>
											<br />
											<li>핸드폰 : ${member.m_phone}</li>
											<br />
											<li>주소 : ${member.m_addr1}, ${member.m_addr2}</li>
											<br />
											<li>가입일 : <fmt:formatDate value="${member.m_indate}"
													pattern="yyyy.MM.dd" />
											</li>
											<br />
											<li>신고당한 수 : ${member.m_report_num}</li>
											<br />
										</ul>
									</div>
									<div class="col-md-8 home-dat">
										<div class="detal-jumbo">
											<h3>자기소개</h3>
											<p>${member.m_self}</p>
											<br /> <br /> <br /> <br /> <br />
										</div>

										<div class="jumbo-address">
											<div class="row no-margin">
												<div class="col-lg-6 no-padding">

													<table class="addrss-list">
														<tbody>
															<tr>
																<th>sms수신여부</th>
																<td>${member.m_re_sms}</td>
															</tr>
															<tr>
																<th>메일수신여부</th>
																<td>${member.m_re_notice}</td>
															</tr>
														</tbody>
													</table>

												</div>
												<div class="col-lg-6 no-padding">
													<table class="addrss-list">
														<tbody>
															<tr>
																<th>쪽지수신여부</th>
																<td>${member.m_re_message}</td>
															</tr>
															<tr>
																<th>회원정보공개여부</th>
																<td>${member.m_info}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>

										<div class="links">
											<div class="row ">
												<div class="col-xl-6 col-md-12">
													<ul class="btn-link">
														<li><a href="/message"><i
																class="fas fa-paper-plane"></i> 쪽지함</a></li>
														<li><a href="/mypage_modifyview"> <i
																class="fas fa-address-card"></i> 회원정보수정
														</a></li>
														<!-- <li><a href="#modify_mypage"> <i class="fas fa-cloud-download-alt"></i>
																수정
														</a></li> -->
													</ul>
												</div>
												<div class="col-xl-6 col-md-12">
													<ul class="social-link">
														<li><i class="fab fa-facebook-f"></i></li>
														<li><i class="fab fa-twitter"></i></li>
														<li><i class="fab fa-pinterest-p"></i></li>
														<li><i class="fab fa-linkedin-in"></i></li>
														<li><i class="fab fa-youtube"></i></li>
													</ul>
												</div>
											</div>
										</div>

									</div>
								</div>

							</div>
							<div class="tab-pane tab-pane2 fade profile-tab " id="profile"
								role="tabpanel" aria-labelledby="profile-tab">
								<div class="table-mypage JSD-Bold-12.5">
									<table class="table ">
										<tr class="table_row header">
											<td class="cell text-center">글<br /> 번호
											</td>
											<td class="cell table-width-30 text-center">카테고리 제목</td>
											<td class="cell text-center">글 제목</td>
											<td class="cell text-center">작성일</td>
										</tr>
										<c:forEach items="${myBoardList}" var="board">
											<tr class="trow">
												<td class="cell">${board['RNUM']}</td>
												<td><c:choose>
														<c:when test="${board['BT_NO'] eq 1}">보드이야기</c:when>
														<c:when test="${board['BT_NO'] eq 2}">개봉기 및 리뷰</c:when>
														<c:when test="${board['BT_NO'] eq 3}">보드게임 모임</c:when>
														<c:when test="${board['BT_NO'] eq 4}">보드 뉴스</c:when>
														<c:when test="${board['BT_NO'] eq 5}">질문&답변</c:when>
														<c:when test="${board['BT_NO'] eq 6}">창작 보드게임</c:when>
														<c:when test="${board['BT_NO'] eq 8}">일대일 문의</c:when>
														<c:when test="${board['BT_NO'] eq 9}">보부상</c:when>
														<c:when test="${board['BT_NO'] eq 11}">카페 리뷰</c:when>
														<c:otherwise>불명확</c:otherwise>
													</c:choose></td>
												<td class="cell title text-left"><a
													href="/content_view_i?i_no=${board['I_NO']}&bt_no=${board['BT_NO']}">${board['I_TITLE']}</a></td>

												<td>
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <jsp:useBean
														id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
													<fmt:formatDate value="${today}" pattern="yyyy.MM.dd"
														var="now" /> <fmt:formatDate
														value="${board['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${board['I_WRITTEN_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<!-- 내가쓴글 끝, 댓글 시작 -->


							<div class="tab-pane tab-pane2 education-detail fade" id="education"
								role="tabpanel" aria-labelledby="contact-tab">
								<div class="table-mypage JSD-Bold-12.5">
									<table class="table">
										<tr class="table_row header">
											<td class="cell text-center">댓글<br/> 번호
											</td>
											<td class="cell text-center">댓글 내용</td>
											<td class="cell text-center">작성일</td>
										</tr>
										<c:forEach items="${myCommentList}" var="cm">
											<tr class="trow">
												<td class="cell">${cm['RNUM']}</td>
												<td class="cell title text-left"><c:choose>
														<c:when test="${cm['CM_TYPE'] == '게시판'}">
															<a href="/content_view?bw_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${cm['CM_TYPE'] == '카페리뷰'}">
															<a href="/content_view_cr?cr_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${cm['CM_TYPE'] == '증고거래'}">
															<a href="/content_view_t?t_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
													</c:choose></td>
												<td>
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
														value="${today}" pattern="yyyy.MM.dd" var="now" /> <fmt:formatDate
														value="${cm['CM_WRITTEN_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${cm['CM_WRITTEN_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>

											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="tab-pane tab-pane2 portfolio-detail fade" id="portfolio"
								role="tabpanel" aria-labelledby="contact-tab">
								<div class="table-mypage JSD-Bold-12.5">
									<table class="table">
										<tr class="table_row header">
											<td class="cell table-width-100 text-center" style="padding: 13px 5px;">카테고리</td>
											<td class="cell text-center" style="width:400px;">글제목</td>
											<td class="cell text-center">작성일</td>
											<td class="cell text-center">삭제</td>
										</tr>
										<c:forEach items="${myScrap}" var="myScrap">
											<tr class="trow">
												<td class="cell table-width-100 text-center">${myScrap['SC_BOARDTYPE']}</td>
												<td class="cell title text-left"><c:choose>
														<c:when test="${myScrap['SC_BOARDTYPE'] eq '카페 리뷰'}">
															<a href="content_view_cr?cr_no=${myScrap['SC_NO']}">${myScrap['BW_TITLE']}</a>
														</c:when>
														<c:otherwise>
															<a href="content_view?bw_no=${myScrap['SC_NO']}">${myScrap['BW_TITLE']}</a>
														</c:otherwise>
													</c:choose></td>
												<td class="text-center">
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
														value="${today}" pattern="yyyy.MM.dd" var="now" /> <fmt:formatDate
														value="${myScrap['SC_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${myScrap['SC_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>
												<td class="cell text-center"><button class="scrap_delete btn-min btn-lavender-min"
														data-bt="${myScrap['SC_BOARDTYPE']}"
														data-no="${myScrap['SC_NO']}">삭제</button></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="tab-pane tab-pane2 portfolio-detail contact-tab fade"
								id="contact" role="tabpanel" aria-labelledby="contact-tab">
								<div class="mypage-sponsor table-mypage">
									<div class="sec-title">
										<h5>내 후원</h5>
									</div>
									<table class="table">
										<tr class="table_row header">
											<td class="cell">후원<br/>번호</td>
											<td class="cell">후원 금액</td>
											<td class="cell">후원일</td>
										</tr>
										<c:forEach items="${sponsorList}" var="spItem" varStatus="status">
											<tr class="table_row">
												<td class="cell">${spItem['SP_NO']}</td>
												<td class="cell">${spItem['SP_MONEY']}</td>
												<td class="cell">
													<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
													<fmt:formatDate value="${spItem['SP_DATE']}" pattern="yyyy.MM.dd" var="date"/>
													<c:choose>
														<c:when test="${now ne date}">${date}</c:when> 
														<c:otherwise>
															<fmt:formatDate value="${spItem['SP_DATE']}" pattern="HH:mm"/>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div class="mypage-report table-mypage">
									<div class="sec-title">
										<h5>내 신고</h5>
									</div>
									<table class="table">
										<tr class="table_row header">
											<td class="cell table-width-20 text-center">신고<br/>번호</td>
											<td class="cell table-width-60 text-center">신고대상</td>
											<td class="cell table-width-160 text-center">신고내용</td>
											<td class="cell text-center">신고일</td>
										</tr>

										<c:forEach items="${myReport}" var="myReport">
											<tr class="trow">
												<td class="cell table-width-20 ">${myReport['RNUM']}</td>
												<td class="cell table-width-60 title">${myReport['R_TYPE']}</td>
												<td class="cell table-width-160 title text-left">${myReport['R_CONTENT']}</td>
												<td>
														<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
													<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
													<fmt:formatDate value="${myReport['R_REPORT_DATE']}" pattern="yyyy.MM.dd" var="date"/>
													<c:choose>
														<c:when test="${now ne date}">${date}</c:when> 
														<c:otherwise>
															<fmt:formatDate value="${myReport['R_REPORT_DATE']}" pattern="HH:mm"/>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>

							</div>

							<!-- 내 거래 include start -->
							<%@ include
								file="/WEB-INF/views/mypage/mytrade/mypage_mytrade.jsp"%>
							<!-- 내 거래 include end -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ========== 판매자 모달 ================================================ -->

	<!-- 내 판매-판매자 [1. 거래확인] include start -->
	<!-- /WEB-INF/ 로 시작하면 절대 경로 써줘야함!!!(jsp 파일 단순 import할 경우!)  -->
	<!-- 반드시 controller가 실행 후 return해서 와줄 장소 필요.. 그래서 동적인 거 노노
		 정적인 include 필수 ㅠㅠㅠ -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/sell_modal_view.jsp"%>
	<!-- 내 판매-판매자 [1. 거래확인] include end -->

	<!-- 내 판매-판매자 [2. 운송장 입력] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/sell2_modal_view.jsp"%>
	<!-- 내 판매-판매자 [2. 운송장 입력] include end -->

	<!-- 내 판매-판매자 [3. 배송중: 운송장 수정] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/sell3_modal_view.jsp"%>
	<!-- 내 판매-판매자 [3. 배송중: 운송장 수정] include end -->

	<!-- 내 판매-판매자 [4. 배송완료=> 상세정보+운송장] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/sell4_modal_view.jsp"%>
	<!-- 내 판매-판매자 [4. 배송완료=> 상세정보+운송장] include end -->

	<!-- 내 판매-판매자 [7. 거래취소=> 상세정보] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/sell7_modal_view.jsp"%>
	<!-- 내 판매-판매자 [7. 거래취소=> 상세정보] include end -->


	<!-- ========== 구매자 모달 ================================================ -->

	<!-- 내 구매-구매자 [1. 결제] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/buy_modal_view.jsp"%>
	<!-- 내 구매-구매자 [1. 결제] include end -->

	<!-- 내 구매-구매자 [2. 배송 준비] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/buy2_modal_view.jsp"%>
	<!-- 내 구매-구매자 [2. 배송 준비] include end -->

	<!-- 내 구매-구매자 [3. 수취확인] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/buy3_modal_view.jsp"%>
	<!-- 내 구매-구매자 [3. 수취확인] include end -->

	<!-- 내 구매-구매자 [4. 배송완료=> 상세정보] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/buy4_modal_view.jsp"%>
	<!-- 내 구매-구매자 [4. 배송완료=> 상세정보] include end -->

	<!-- 내 구매-구매자 [7. 거래취소=> 상세정보] include start -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/buy7_modal_view.jsp"%>
	<!-- 내 구매-구매자 [7. 거래취소=> 상세정보] include end -->

	<!-- ====== js ===================================================================== -->
	<!-- mytrade_buy_modal.js => jstl과 el 못써서...-->
	<script type="text/javascript">
		/*
		 * mytrade_modal
		 * 마이페이지- 내 거래- 내 구매에서 구매 모달 띄우게 하는 js
		 */

		// Get the modal
		var modal = document.getElementById('buy-modal');

		var sum = 0;
		var product = '';
		var products = '';
		var count = 0;
		var pno = 0;

		// button의 name="${payment['P_STATUS']}" 값
		var buyBtnName = 0;

		var p_courier = "";
		var p_tracking = "";

		function buyModal(buyBtn) {

			console.log("onclick 진입 성공");

			// 택배사, 운송장 가져와
			p_courier = $(buyBtn).data('courier');
			p_tracking = $(buyBtn).data('tracking');
			console.log("courier:" + p_courier + ", tracking" + p_tracking);

			//버튼의 name=p_status 얻어오기
			buyBtnName = $(buyBtn).attr("name"); // p_status			
			console.log("buyBtnName: " + buyBtnName);

			// 1. 결제 단계
			if (buyBtnName == 1) {
				$("#buy-modal").css("display", "block");
				$("#buy-modal").css('z-index', 200);

				// 게임, 가격 정보 부르기
				pno = $(buyBtn).val();
				buyAjax(pno);

				// 2. 배송 준비 단계	
			} else if (buyBtnName == 2) {
				$("#buy2-modal").css("display", "block");
				$("#buy2-modal").css('z-index', 200);

				// 게임, 가격 정보 부르기
				pno = $(buyBtn).val();
				buyAjax(pno);

				// 3. 수취확인 단계
			} else if (buyBtnName == 3) {

				$("#buy3-modal").css("display", "block");
				$("#buy3-modal").css('z-index', 200);

				// 게임, 가격 정보 부르기
				pno = $(buyBtn).val();
				buyAjax(pno);

				// 택배사, 운송장 가져와			    
				$(".buy3-courier").empty().text(p_courier);
				$(".buy3-tracking").empty().text(p_tracking);

				// 4. 배송완료=> 상세정보 || 5. 거래완료=> 상세정보
			} else if (buyBtnName == 4 || buyBtnName == 5) {

				$("#buy4-modal").css("display", "block");
				$("#buy4-modal").css('z-index', 200);

				// 게임, 가격 정보 부르기
				pno = $(buyBtn).val();
				buyAjax(pno);

				// 택배사, 운송장 가져와			    
				$(".buy4-courier").empty().text(p_courier);
				$(".buy4-tracking").empty().text(p_tracking);

				// modal--info에다 값 넣기..
				if (buyBtnName == 4) {
					$(".buy4_5_info_up").empty().html(
							"배송이 완료되었습니다.<br/>상세정보는 아래에서 확인하실 수 있습니다.");
					$(".buy4_5_info_down").empty().html("수취 확인하신 운송장입니다.");
				} else if (buyBtnName == 5) {
					$(".buy4_5_info_up").empty().html(
							"거래가 완료되었습니다.<br/>상세정보는 아래에서 확인하실 수 있습니다.");
					$(".buy4_5_info_down").empty().html("운송장 정보입니다.");
				}

				// 7. 거래취소=> 상세정보
			} else if (buyBtnName == 7) {

				$("#buy7-modal").css("display", "block");
				$("#buy7-modal").css('z-index', 200);

				// 게임, 가격 정보 부르기
				pno = $(buyBtn).val();
				buyAjax(pno);
			}

		}

		// 거래확인 버튼과 같은 라인의 p_no 받아서 controller로 넘긴 뒤
		// hashmap list를 받아 foreach 돌린다.
		function buyAjax(pno) {

			// alert(pno); 받아옴

			$.ajax({
				type : "GET",
				url : "/buy_modal_view/" + pno,
				cache : false,
				dataType : "json",
				success : function(data) { /* 컨트롤러에서 넘긴 값이 여기로 온다 */
					console.log("SUCCESS: ", pno);

					// 결제에서 쓸 변수 초기화 및 대입
					sum = 0; // 초기화
					product = data[0]['TG_NAME']; // 잘 가져옴

					var tag = "";
					$.each(data, function(key, ptgItem) {

						tag += '<tr class = "table--row">';
						tag += '<td class = "table--cell">'
								+ ptgItem['TG_NAME'];
						tag += '</td>';
						tag += '<td class="table--cell">' + ptgItem['TG_PRICE']
								+ '원</td>';
						tag += '</tr>';

						console.log("=end=");

						sum += ptgItem['TG_PRICE'];
						count += 1;

						// 1. 결제 단계
						if (buyBtnName == 1) {
							$("#ajax-buy").empty().append(tag);

							// 2. 배송 준비 단계	
						} else if (buyBtnName == 2) {
							$("#ajax-buy2").empty().append(tag);

							// 3. 수취확인 단계	
						} else if (buyBtnName == 3) {
							$("#ajax-buy3").empty().append(tag);

							// 4. 배송완료=> 상세정보 || 5. 거래완료=> 상세정보
						} else if (buyBtnName == 4 || buyBtnName == 5) {
							$("#ajax-buy4").empty().append(tag);

							// 7. 거래취소=> 상세정보
						} else if (buyBtnName == 7) {
							$("#ajax-buy7").empty().append(tag);
						}

					});
					// 총액 표시해주고 결제버튼 만들기

					// 1. 결제 단계
					if (buyBtnName == 1) {
						$("#ajax-sum-buy").empty().append(sum + '원');

						// input value 할당: 거래취소 위해...
						$(".buy-modal-p_no").val(pno);

						// 2. 배송 준비 단계	
					} else if (buyBtnName == 2) {
						$("#ajax-sum-buy2").empty().append(sum + '원');

						// 3. 수취확인 단계
					} else if (buyBtnName == 3) {
						$("#ajax-sum-buy3").empty().append(sum + '원');

						// input value 할당
						$(".buy3-modal-p_no").val(pno);

						// 4. 배송완료=> 상세정보 || 5. 거래완료=> 상세정보
					} else if (buyBtnName == 4 || buyBtnName == 5) {
						$("#ajax-sum-buy4").empty().append(sum + '원');

						// input value 할당
						$(".buy3-modal-p_no").val(pno);

						// 7. 거래취소=> 상세정보
					} else if (buyBtnName == 7) {
						$("#ajax-sum-buy7").empty().append(sum + '원');
					}

					console.log("합계 나와:" + sum);

					// 상품명 만들기// 성공
					if (count > 1) {
						console.log(" if문"); // 성공
						products = product + " 외 " + (count - 1) + '개';
						console.log(products); // 성공

					} else {
						products = product;
					}
					count = 0; // count 초기화
					// 상품평 만들기 끝

				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				},
				done : function(e) {
					console.log("DONE");
				}
			});
		};

		/* 	 PG사 테스트 계정은 실제 계정과 동일하게 결제승인이 이루어지지만 
		 * 결제 후 일정 시간 간격으로 또는 매일 자정직전에 일괄 취소됩니다.
		 */

		// 결제용 변수 만들기
		var IMP = window.IMP;
		IMP.init('imp42437735'); // 가맹점 식별코드

		function payNow() {
			console.log(products); // 성공

			var answer = confirm('결제하시겠습니까?');

			// 발표 후 만지기
			// var sendData = JSON.stringify({imp_uid: rsp.imp_uid, p_no : pno});
			// console.log(sendData);

			if (answer) {
				IMP
						.request_pay(
								{
									merchant_uid : pno, // 걍 p_no..// 가맹점에서 생성/관리하는 고유 주문번호
									name : products,
									amount : sum,
									buyer_email : '${member.m_email}',
									buyer_name : "${member.m_name}", // 선택
									buyer_tel : '${member.m_phone}', // 필수
								},
								function(rsp) {
									if (rsp.success) {
										// alert("성공"); // 여기로 도착함			

										console.log(pno);

										//************************************************
										// 여기부터는 발표 후에 합시다!!!
										//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
										jQuery
												.ajax({

													// cross-domain 에러 발생... 
													url : "/payments/complete?p_no="
															+ pno, //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
													method : 'POST',
													dataType : 'text',
													/* headers: { "Content-Type": "application/json" }, */
													data : {
														imp_uid : rsp.imp_uid,
														price : rsp.paid_amount
													//최종적으로 결제한 가격

													//기타 필요한 데이터가 있으면 추가 전달							
													},
													success : function(data) {

														//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
														console
																.log("서버에서 REST API로 결제정보확인 및 서비스루틴이 정상");
														console.log(data);

														// 결제 모달 닫기
														$("#buy-modal").css(
																"display",
																"none");

														alert("결제 완료되었습니다. 마이페이지에서 확인하실 수 있습니다.");

														// 성공하면 페이지 이동해!
														location.reload(); // 새로고침 후
														location.href = "/mypage#trade"; // 내 거래 고

													},
													error : function(request,
															status, error) {
														console.log(request);
														console.log(status);
														console.log(error);
													}
												/* 		}).done(function(data) {
															//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
															if (everythings_fine) {
																var msg = '결제가 완료되었습니다.';
																msg += '\n고유ID : ' + rsp.imp_uid;
																msg += '\n상점 거래ID : ' + rsp.merchant_uid;
																msg += '\결제 금액 : ' + rsp.paid_amount;
																msg += '카드 승인번호 : ' + rsp.apply_num;
												
																alert(msg);
																
																
															} else {
																
																console.log("결제는 성공했는데 정보는 못받아옴");
																//[3] 아직 제대로 결제가 되지 않았습니다.
																//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
															} */
												});

									} else {
										var msg = '결제에 실패하였습니다.';
										msg += '에러내용 : ' + rsp.error_msg;

										alert(msg);

										// 결제 모달 닫기
										$("#buy-modal").css("display", "none");
									}

								});
			}
			;
		};

		// When the user clicks on <span> (x), close the modal
		function closeBuyModal() {
			$("#buy-modal").css("display", "none");
			$("#buy2-modal").css("display", "none");
			$("#buy3-modal").css("display", "none");
			$("#buy4-modal").css("display", "none");
			$("#buy7-modal").css("display", "none");
		}
	</script>
</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="/js/header/jquery.slicknav.min.js"></script>
<script src="/js/header/header_hyesoo.js"></script>
<!-- ====================스크랩삭제 ============================== -->
<script src="js/admin/scrap_delete.js"></script>

<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>
<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js"
	integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8="
	crossorigin="anonymous"></script>

<!-- Java Script for 내 거래 - 모달  ================================================== -->
<script src="/js/cassie/mytrade_sell_modal.js"></script>
<!-- 내판매-거래확인 -->
<script src="/js/cassie/mytrade_buy_modal.js"></script>
<!-- 내구매-결제 -->


</html>