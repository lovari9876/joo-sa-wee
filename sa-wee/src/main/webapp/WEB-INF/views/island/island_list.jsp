<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html class="no-js" lang="UTF-8">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>내 사위는 주사위</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/island/base.css">
    <link rel="stylesheet" href="css/island/vendor.css">
    <link rel="stylesheet" href="css/island/main.css">

    <!-- script
    ================================================== -->
    <script src="js/cassie/modernizr.js"></script>
    <script src="js/cassie/jquery-3.2.1.min.js"></script>

    <!-- favicons
    ================================================== -->
	<link rel="icon" type="image/png" href="resources/images/share/wolf_logo.ico" />
	
	<!-- 다른 회원 정보 보기 팝업 
    ================================================== -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hj/popover.js"></script>	
	<script src="js/mypage/other_page.js"></script>
    <link rel="stylesheet" href="css/secondhand/popover_bootstrap.css">

</head>

<body id="top" >

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	
	
    <!-- styles // 본문 테이블
    ================================================== -->
    <section id="styles" class="s-styles">
    
        <div class="row narrow section-intro add-bottom text-center s-styles-header">

            <div class="col-twelve tab-full">

                <h1><a href="/island_list" style="color:black">무인도</a></h1>

                <p class="lead">무인도에 갇히셨나요?
                	<br>얼른 수정해서 있어야 할 곳으로 돌아가세요.
                	<br>그렇지 않으면..... 영원히 이 곳에서 벗어날 수 없을 것입니다.
                </p>  
            </div>

        </div>
        
         <!-- 검색 -->
		<div class="search--bar row search--island">
		  <div class=" mx-auto">
		
		    <div class="search--box rounded">
		
		      <!-- Custom rounded search bars with input group -->
		      <form action="">		
		      
		        <div class="search--div p-1 bg-island rounded rounded-pill shadow-sm mb-4">
		          <div class="input-group">
		            <div class="input-group-prepend">
		              <button id="searchBtn" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
		              
		              <!-- 엔터 안되고 버튼으로만 검색가능 -->
	            		<script>
					      $(function(){
					        $('#searchBtn').click(function() {
					        	event.preventDefault(); // event canceled 막기!
					          	self.location = "/island_list" 
					          				+ '${pageMaker.makeQuery(1)}' 
					          				+ "&bt_no="
					          				+ $("#bt_no option:selected").val()  
					          				+ "&searchType=" 
					          				+ $("#searchType option:selected").val() 
					          				+ "&keyword=" 
					          				+ encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
		              
		            </div>
			            
	          		<div class="custom-select">
		              <select id="bt_no" name="bt_no"><!-- data-trigger="" name="choices-single-defaul" -->
						<option value="0" <c:out value="${bt_no == null ? 'selected' : ''}"/>>전체게시판</option>
						<option value="1" <c:out value="${bt_no eq 1 ? 'selected' : ''}"/>>보드이야기</option>
						<option value="2" <c:out value="${bt_no eq 2 ? 'selected' : ''}"/>>개봉기 및 리뷰</option>
						<option value="3" <c:out value="${bt_no eq 3 ? 'selected' : ''}"/>>보드게임 모임</option>
						<option value="4" <c:out value="${bt_no eq 4 ? 'selected' : ''}"/>>보드뉴스</option>
						<option value="5" <c:out value="${bt_no eq 5 ? 'selected' : ''}"/>>질문과 답변</option>
						<option value="6" <c:out value="${bt_no eq 6 ? 'selected' : ''}"/>>창작 보드게임</option>
						<option value="8" <c:out value="${bt_no eq 8 ? 'selected' : ''}"/>>일대일 문의</option>
						<option value="9" <c:out value="${bt_no eq 9 ? 'selected' : ''}"/>>보부상</option>
						<option value="10" <c:out value="${bt_no eq 10 ? 'selected' : ''}"/>>카페</option>
						<option value="11" <c:out value="${bt_no eq 11 ? 'selected' : ''}"/>>카페리뷰</option>
		              </select>		      
		              <div class="select__arrow"></div>
		            </div>  
		            <div class="custom-select">
		              <select id="searchType" name="searchType"><!-- data-trigger="" name="choices-single-defaul" -->
						 <option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택하세요</option>
					     <option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					     <option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					     <option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					     <option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		              </select>		      
		              <div class="select__arrow"></div>        
		              
		            </div>	
		            
		            <input type="search" id="keywordInput" value="${scri.keyword}" placeholder="검색어를 입력하세요" 
		            	   aria-describedby="button-addon2" class="form-control border-0 ">
		          </div>
		        </div>
		        		
		      </form>
		      <!-- End -->
		
		    </div>
		  </div>
		</div>  
		<!-- 검색 끝 -->  
         
        
  		<!-- 테이블 시작! -->
        <div class="row add-bottom">

            <div class="col-twelve">
                <div class="table-responsive">

                    <table class="island--table">
                            <thead>
	                            <tr class="table-header">	                                
	                                <th>글 번호</th>
	                                <th>게시판</th>
	                                <th>작성자</th>
	                                <th>제목</th>
	                                <th>작성일</th>
	                                <th>조회수</th>
	                                <th>상태</th>	                                                               
	                            </tr>
                            </thead>
                            <tbody>
	              				<c:forEach items="${iList}" var="IMap">
									<tr>											
										<td> <!-- 컨텐트 뷰 링크 -->
											<a href="/content_view_i?i_no=${IMap['I_NO']}&bt_no=${IMap['BT_NO']}">${IMap['RNUM']}</a>
										</td>										
										<td>
											<c:choose>				
												<c:when test="${IMap['BT_NO'] eq 1}">보드이야기</c:when>		
												<c:when test="${IMap['BT_NO'] eq 2}">개봉기 및 리뷰</c:when>
												<c:when test="${IMap['BT_NO'] eq 3}">보드게임 모임</c:when>
												<c:when test="${IMap['BT_NO'] eq 4}">보드 뉴스</c:when>
												<c:when test="${IMap['BT_NO'] eq 5}">질문&답변</c:when>
												<c:when test="${IMap['BT_NO'] eq 6}">창작 보드게임</c:when>
												<c:when test="${IMap['BT_NO'] eq 8}">일대일 문의</c:when>
												<c:when test="${IMap['BT_NO'] eq 9}">보부상</c:when>
												<c:when test="${IMap['BT_NO'] eq 11}">카페 리뷰</c:when>
												<c:otherwise>불명확</c:otherwise>
											</c:choose>
										</td>
										<td>
											<sec:authorize access="isAuthenticated()">	
												<a  class="pointer" role = "button" class="pop_btn popovers"
												data-toggle="popover" 
												data-content="<a href='#' id='other_page' data-nick='${IMap["M_NICK"]}' onclick='return false;' >회원정보보기</a>
												<br/>
																<a href='#' id='send_message' data-nick='${IMap["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
												<br/>			
																<a href='report_view_m?m_no=${IMap["M_NO"]}&bw_no=${IMap["I_NO"]}'>신고하기</a>">
												${IMap["M_NICK"]}
												</a>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												${tItem['M_NICK']}
											</sec:authorize>
										</td>
										<td> <!-- 컨텐트 뷰 링크 -->
											<a href="/content_view_i?i_no=${IMap['I_NO']}&bt_no=${IMap['BT_NO']}">${IMap['I_TITLE']}</a>
										</td>
										<td>
											<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${IMap['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${IMap['I_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${IMap['I_HIT']}</td>
										
										<!-- 관리자가 상태 보려면 이거 추가 -->
										<td>
											<c:if test="${IMap['I_ISLAND'] eq 2}">수정 완료</c:if>
											<c:if test="${IMap['I_ISLAND'] eq 1}">수정 전</c:if>
										</td>																		
									</tr>
								</c:forEach>
                            </tbody>
                    </table>
                </div>

            </div>
            
        </div> <!-- end row -->
    
        <div class="row">
            <div class="col-full">
                <nav class="pgn">
                    <ul class="pagination">
					    <!-- 검색 결과에 대해 페이징 처리된 페이지 번호 목록 -->
					    <c:if test="${pageMaker.prev}">
					        <li>
					            <a class="pgn__prev" href="island_list${pageMaker.makeSearch(pageMaker.startPage - 1)}&bt_no=${bt_no}">
					                &laquo;
					            </a>
					        </li>
					    </c:if>
					 
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					        <li>
					        	<c:choose>
					        		<c:when test="${pageMaker.cri.page == idx}">
					        			<span class="pgn__num current">${idx}</span>
					        		</c:when>
					        		<c:otherwise>
					        			<a class="pgn__num" href="island_list${pageMaker.makeSearch(idx)}&bt_no=${bt_no}">${idx}</a>
					        		</c:otherwise>					        
					        	</c:choose>
					        </li>
					    </c:forEach>
					 
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					        <li>
					            <a class="pgn__next" href="island_list${pageMaker.makeSearch(pageMaker.endPage +1)}&bt_no=${bt_no}">
					                &raquo;
					            </a>
					        </li>
					    </c:if>					   
					</ul>
					<!-- 글쓰기 버튼... 아니 무인도에서 글을 왜 쓰냐!! -->
					<!-- <button class="btn btn-primary write-btn lavender-btn ">글쓰기</button> -->
                </nav>
            </div>
        </div>    
    
    
    </section> <!-- end styles -->


	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->


    <!-- Java Script
    ================================================== -->    
    <script src="js/cassie/plugins.js"></script>
    <script src="js/cassie/main.js"></script>
    <!-- header -->
    <script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<script src="js/header/scroll.js"></script>
	<!-- footer -->
	<!-- <script src="js/footer/footer_hee.js"></script> --> <!-- scroll to top 이미 있음 -->


</body>

</html>