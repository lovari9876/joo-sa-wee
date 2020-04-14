<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
							<div class="profil-det-img d-flex">
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
						<div class="col-md-4 eml-mob">
							<ul>
								<li>작성글 수 : ${myWriteCount}</li>
								<li>댓글 수 : ${myReplyCount}</li>
							</ul>
						</div>
						<div class="col-md-4 eml-mob">
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
								aria-controls="profile"  <c:out value="${cate == 'board' ? 'aria-selected=\"true\"' : 'aria-selected=\"false\"'}"/>>내 글</a></li>
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
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
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
											<li>가입일 : 
												<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
												<jsp:useBean id="today" class="java.util.Date" /> 
												<!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
												<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
												<fmt:formatDate value="${member.m_indate}" pattern="yyyy.MM.dd" var="date"/>
												<c:choose>
													<c:when test="${now ne date}">${date}</c:when> 
													<c:otherwise>
														<fmt:formatDate value="${member.m_indate}" pattern="HH:mm"/>
													</c:otherwise>
												</c:choose>
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
							<div class="tab-pane fade profile-tab " id="profile"
								role="tabpanel" aria-labelledby="profile-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">카테고리 제목</td>
										<td class="cell">글 제목</td>
										<td class="cell">작성일</td>
									</tr>
									<c:forEach items="${myBoardList}" var="board">
									<tr class="trow">
										<td class="cell">${board['RNUM']}</td>
										<td>
											<c:choose>				
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
												</c:choose>
											</td>
										<td class="cell title"><a href="/content_view_i?i_no=${board['I_NO']}&bt_no=${board['BT_NO']}">${board['I_TITLE']}</a></td>
									
										<td>
												<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${board['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${board['I_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
										</td>
										
									</tr>
								</c:forEach>
									

								</table>
								
							</div>
							
							<!-- 내가쓴글 끝, 댓글 시작 -->
							
							
							<div class="tab-pane education-detail fade" id="education"
								role="tabpanel" aria-labelledby="contact-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">댓글 번호</td>
										<td class="cell">댓글 내용</td>
										<td class="cell">작성일</td>
									</tr>
									<c:forEach items="${myCommentList}" var="cm">
									<tr class="trow">
										<td class="cell">${cm.cm_no}</td>
										<td class="cell title">
										
													<c:choose>
														<c:when test="${cm.cm_type == '게시판'}">
															<a href="/content_view?bw_no=${cm.cm_no2}">${cm.cm_content}</a>
														</c:when>
														<c:when test="${cm.cm_type == '카페리뷰'}">
															<a href="/content_view_cr?cr_no=${cm.cm_no2}">${cm.cm_content}</a>
														</c:when>
														<c:when test="${cm.cm_type == '증고거래'}">
															<a href="/content_view_t?t_no=${cm.cm_no2}">${cm.cm_content}</a>
														</c:when>
													</c:choose>
										</td>
										<td>
												<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${cm.cm_written_date}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${cm.cm_written_date}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
										</td>
										
									</tr>
								</c:forEach>
								</table>
							</div>
							<div class="tab-pane portfolio-detail fade" id="portfolio"
								role="tabpanel" aria-labelledby="contact-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">글 제목</td>
										<td class="cell">작성자</td>
										<td class="cell">작성일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane portfolio-detail contact-tab fade"
								id="contact" role="tabpanel" aria-labelledby="contact-tab">
								<div class="sec-title">
									<h2>내 후원</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">후원금액</td>
										<td class="cell">후원일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
								<br />
								<div class="sec-title">
									<h2>내 신고</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">신고 대상</td>
										<td class="cell">신고 내용</td>
										<td class="cell">신고일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
							</div>
							
							<!-- 내 거래 include start -->
							<%@ include file="/WEB-INF/views/mypage/mytrade/mypage_mytrade.jsp"%>
							<!-- 내 거래 include end -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 내 판매-판매자 [가격확정] import start -->
	<!-- /WEB-INF/ 로 시작하면 절대 경로 써줘야함!!!(jsp 파일 단순 import할 경우!)  -->
	<!-- 반드시 controller가 실행 후 return해서 와줄 장소 필요.. 그래서 동적인 거 노노
		 정적인 include 필수 ㅠㅠㅠ -->
	<%@ include file="/WEB-INF/views/mypage/mytrade/price_modal_view.jsp"%>
	<!-- 내 판매-판매자 [가격확정] import end -->	
	
	<script>
		// Get the modal
		var modal = document.getElementById('price-modal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("price-btn");
		
		 
		
		// Get the <span> element that closes the modal
		var span = document.getElementById("modal--close");                                          
		
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			
			//alert(this.value); 성공			
			sendViaAjax(this.value);
			
		    modal.style.display = "block";	    
		    
		}
		
		// 거래확인 버튼과 같은 라인의 p_no 받아서 controller로 넘긴 뒤
		// hashmap list를 받아 foreach 돌린다.
		function sendViaAjax(pno) { 
			
			// alert(pno); 받아옴
			
			$.ajax({ 
				type : "GET", 
				url : "/price_modal_view/"+pno, 
				cache : false,
				dataType : "json",
				success : function(data) { /* 컨트롤러에서 넘긴 값이 여기로 온다 */
					 console.log("SUCCESS: ", pno); 
					
					var tag = "";
					$.each(data, function(key, ptgItem) {
						
						tag += '<tr class = "table--row">';
						tag += '<td class = "table--cell">'+ptgItem['TG_NAME'];
						tag += '</td>';
						tag += '<td class="table--cell">'+ ptgItem['TG_PRICE']+ '원</td>';
						tag += '</tr>';
						
						console.log("=end=");
						
						$("#ajax-sell").empty().append(tag);
					});
					
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
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
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
<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>
<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js"
	integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8="
	crossorigin="anonymous"></script>



</html>