<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <link rel="stylesheet" href="css/secondhand/base.css">
    <link rel="stylesheet" href="css/secondhand/vendor.css">
    <link rel="stylesheet" href="css/secondhand/main.css">

    <!-- script
    ================================================== -->
    <script src="js/cassie/modernizr.js"></script>    
    <script src="js/cassie/jquery-3.2.1.min.js"></script>
    <script src="js/cassie/change-view.js"></script>

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

<body id="top">

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	
    
    <!-- s-content
    ================================================== -->
    <section class="s-content">

        <div class="row narrow">
            <div class="col-full s-content__header" data-aos="fade-up">
                <h1><a href="/tlist" style="color:black">보부상</a></h1>

                <p class="lead">보부상은 중고거래 게시판입니다. 
                	<br>당신은 어떤 보드게임을 원하시나요? 당신이 원하던 그것. 바로 이 곳에 있습니다.
                	<br>당신의 소망이 현실이 되는 곳, 보부상.
                </p>    
                                
            </div>            
        </div>            
        
        <!-- 검색 -->
		<div class="search--bar search--row">
		  <div class="mx-auto">
		
		    <div class="search--box rounded">
		    
		     <!-- **** change view -->
		      <!-- 리스트 뷰와 masonry 뷰를 switch하기 위한 버튼 -->
		      <button id="view-btn" ><i class="fa fa-bars"></i></button>
		
		      <!-- Custom rounded search bars with input group -->
		      <form role="form">		
		      
		        <div class="search--div p-1 bg-white rounded rounded-pill shadow-sm mb-4">
		          <div class="input-group">	  
		            <div class="input-group-prepend">	              
		             
		              <!-- 엔터 안되고 버튼으로만 검색가능 -->
	            		<script>
					      $(function(){
					        $('#searchBtn').click(function() {
					        	event.preventDefault(); // event canceled 막기!
					          	self.location = "/tlist" 
					          				+ '${pageMaker.makeQuery(1)}' 
					          				+ "&s_content="
					          				+ $("#s_content option:selected").val() 
					          				+ "&searchType=" 
					          				+ $("#searchType option:selected").val() 
					          				+ "&keyword=" 
					          				+ encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
		              
		            </div>	
		            <div class="custom-select">
		              <select id="s_content" name="s_content"><!-- data-trigger="" name="choices-single-defaul" -->
						  <option value="n" <c:out value="${s_content == null ? 'selected' : ''}"/>>말머리</option>
					      <option value="s" <c:out value="${s_content eq 's' ? 'selected' : ''}"/>>판매중</option>
					      <option value="b" <c:out value="${s_content eq 'b' ? 'selected' : ''}"/>>구매중</option>
					      <option value="c" <c:out value="${s_content eq 'c' ? 'selected' : ''}"/>>거래완료</option>
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
		            	        		           
		            <div>
		            	<input type="search" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="검색어를 입력하세요"
		           		 		aria-describedby="button-addon2" class="form-control border-0 ">
		            </div>
		            <button id="searchBtn" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
		          </div>
		        </div>
		        		
		      </form>
		      <!-- End -->
		
		    </div>
		  </div>
		</div>  
		<!-- 검색 끝 -->       
              
        
        <!-- 리스트 시작! -->
		<div class="switch-view">

          <div id="view1" class="view--content">
        
	        <div class="row masonry-wrap">
	            <div class="masonry">
	            
	                <div class="grid-sizer"></div>
					
					<!-- 자바스크립트로 조건 2가지 넣어줘야 masonry가 예쁘게 작동! -->
					<!-- 1. 사진이 2장 이상이면 갤러리 타입, 사진 1장: standard 타입, 사진 없으면 이미지 부분 태그 통으로 빼서 벽돌리스트 이쁘게 해야함 -->
					<!-- 2. data-aos="fade-up"을 세번째 아이템에게 넣어줘야함; list[2]에 article param으로 넣을것!!-->
					<!--  data-aos="fade-up" -->
					<c:forEach items="${tList}" var="tItem" varStatus="status">
					<c:choose>
					<c:when test="${tItem['F_NAME'] eq null}">
						<article class="masonry__brick entry format-standard">	                 
		    
		                    <div class="entry__text">
		                        <div class="entry__header">
		                        	<div class="entry__excerpt">${tItem['T_NO']} | ${tItem['S_CONTENT']}</div>
		                       		<div class="entry__date">
		                                <a href="content_view_t?t_no=${tItem['T_NO']}">	                                
		                                	<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>										
		                                </a>
		                            </div>
		                            <h1 class="entry__title"><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_TITLE']}</a></h1>
		                            
		                        </div>
		                        <div class="entry__excerpt" >		                            
		                            <sec:authorize access="isAuthenticated()">	
										<a  class="pointer" role = "button" class="pop_btn popovers"
										data-toggle="popover" 
										data-content="<a href='#' id='other_page' data-nick='${tItem["M_NICK"]}' onclick='return false;' >회원정보보기</a>
										<br/>
														<a href='#' id='send_message' data-nick='${tItem["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
										<br/>			
														<a href='report_view_m?m_no=${tItem["M_NO"]}&bw_no=${tItem["T_NO"]}'>신고하기</a>">
										${tItem['M_NICK']}
										</a>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										${tItem['M_NICK']}
									</sec:authorize>	
		                        </div>
		                        <div class="entry__excerpt" style="font-weight:50;">
		                            조회수 ${tItem['T_HIT']} | 추천수 ${tItem['T_RECOMMEND_NUM']}  | 댓글수 ${tItem['CM']}
		                        </div>
		                        <br/>
		                        <!-- 파란색 태그 부분=> 여기에다가 관련게임이름과 링크 박기 -->
			                        	<c:import url="/tListGame">
			                        		<c:param name="t_no" value =  "${tItem['T_NO']}"></c:param>
			                        	</c:import>
		                    </div>
		    
		                </article> <!-- end article -->
					</c:when>
					<c:otherwise>
		                <article class="masonry__brick entry format-standard" >
		                        
		                    <div class="entry__thumb">
		                        <a href="content_view_t?t_no=${tItem['T_NO']}" class="entry__thumb-link">
		                          <img src="<c:url value="/img/${tItem['F_NAME']} "/>">
		                          
		                          <!--   <img src="images/cassie/thumbs/masonry/lamp-400.jpg" 
		                                 srcset="images/cassie/thumbs/masonry/lamp-400.jpg 1x, images/cassie/thumbs/masonry/lamp-800.jpg 2x" alt=""> -->
		                        </a>
		                    </div>
		    
		                    <div class="entry__text">
		                        <div class="entry__header">
		                            <div class="entry__excerpt">${tItem['T_NO']} | ${tItem['S_CONTENT']}</div>
		                            <div class="entry__date">
		                                <a href="content_view_t?t_no=${tItem['T_NO']}">
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>
		                                </a>
		                            </div>
		                            <h1 class="entry__title"><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_TITLE']} </a></h1>
		                            
		                        </div>
								<div class="entry__excerpt" >
		                            <sec:authorize access="isAuthenticated()">	
										<a  class="pointer" role = "button" class="pop_btn popovers"
										data-toggle="popover" 
										data-content="<a href='#' id='other_page' data-nick='${tItem["M_NICK"]}' onclick='return false;' >회원정보보기</a>
										<br/>
														<a href='#' id='send_message' data-nick='${tItem["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
										<br/>			
														<a href='report_view_m?m_no=${tItem["M_NO"]}&bw_no=${tItem["T_NO"]}'>신고하기</a>">
										${tItem['M_NICK']}
										</a>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										${tItem['M_NICK']}
									</sec:authorize>	
		                        </div>
		                        <div class="entry__excerpt" style="font-weight:50;">
		                            조회수 ${tItem['T_HIT']} | 추천수 ${tItem['T_RECOMMEND_NUM']} | 댓글수 ${tItem['CM']}
		                        </div>
		                        <br/>
		                      		<!-- 태그 부분 -->
		                        	<c:import url="/tListGame">
			                        	<c:param name="t_no" value =  "${tItem['T_NO']}"></c:param>
			                        </c:import>
		                    </div>
		    
		                </article> <!-- end article -->
		                </c:otherwise>
		                </c:choose>
	                </c:forEach>
	                
	            </div> <!-- end masonry -->
	        </div> <!-- end masonry-wrap -->     
	        
		  </div> <!-- end view1 -->
			
			
		  <div id="view2" class="view--content">
			
			<!-- 테이블 시작! -->
	        <div class="row add-bottom">	
	            <div class="col-twelve">	
	                <div class="table-responsive">
	
	                    <table class="trade--table">
	                            <thead>
		                            <tr class="table-header">	                                
		                                <th>글 번호</th>
		                                <th>말머리</th>
		                                <th>작성자</th>
		                                <th>제목</th>
		                                <th>작성일</th>
		                                <th>조회수</th>
		                                <th>추천수</th>	                                                               
		                            </tr>
	                            </thead>
	                            <tbody>
		              				<c:forEach items="${tList}" var="tItem">
										<tr>											
											<td><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_NO']}</a></td>
											<td>${tItem['S_CONTENT']}</td>
											<td>
												<sec:authorize access="isAuthenticated()">	
													<a  class="pointer" role = "button" class="pop_btn popovers"
													data-toggle="popover" 
													data-content="<a href='#' id='other_page' data-nick='${tItem["M_NICK"]}' onclick='return false;' >회원정보보기</a>
													<br/>
																	<a href='#' id='send_message' data-nick='${tItem["M_NICK"]}' onclick='return false;' >쪽지보내기</a>
													<br/>			
																	<a href='report_view_m?m_no=${tItem["M_NO"]}&bw_no=${tItem["T_NO"]}'>신고하기</a>">
													${tItem['M_NICK']}
													</a>
												</sec:authorize>
												<sec:authorize access="isAnonymous()">
													${tItem['M_NICK']}
												</sec:authorize>
											</td>
											<td><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_TITLE']}  [${tItem['CM']}]</a></td>
											<td>
												<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
												<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
												<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
												<c:choose>
													<c:when test="${now ne date}">${date}</c:when> 
													<c:otherwise>
														<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="HH:mm"/>
													</c:otherwise>
												</c:choose>
											</td>
											<td>${tItem['T_HIT']}</td>
											<td>${tItem['T_RECOMMEND_NUM']}</td>															
										</tr>
									</c:forEach>
	                            </tbody>
	                    </table>
	
	                </div>
	
	            </div>
	            
	        </div> <!-- end row -->
 
			
		  </div> <!-- end view2 -->
		
		</div>


		<!-- 페이징 -->
        <div class="row">
            <div class="col-full">
                <nav class="pgn">
                    <ul class="pagination">
					    <!-- 검색 결과에 대해 페이징 처리된 페이지 번호 목록 -->
					    <c:if test="${pageMaker.prev}">
					        <li>
					            <a class="pgn__prev" href="tlist${pageMaker.makeSearch(pageMaker.startPage - 1)}&s_content=${s_content}">
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
					        			<a class="pgn__num" href="tlist${pageMaker.makeSearch(idx)}&s_content=${s_content}">${idx}</a>
					        		</c:otherwise>					        
					        	</c:choose>
					        </li>
					    </c:forEach>
					 
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					        <li>
					            <a class="pgn__next" href="tlist${pageMaker.makeSearch(pageMaker.endPage +1)}&s_content=${s_content}">
					                &raquo;
					            </a>
					        </li>
					    </c:if>					   
					</ul>
					<!-- 글쓰기 버튼 -->
					<!-- 표류자 신분(r_no=4)이면 보이지 않도록.. && 로그인 안하면 로그인 뷰로 보내기 -->
					<c:if test="${memberVO.r_no != 4 && memberVO.m_no ne null}">
						<button class="btn btn-primary write-btn lavender-btn" type="button"
								onclick="location.href='write_view_t'">글쓰기</button>
					</c:if>
					<c:if test="${memberVO.m_no eq null}">
						<button class="btn btn-primary write-btn lavender-btn" type="button"
								onclick="location.href='loginview'">글쓰기</button>
					</c:if>
                </nav>
            </div>
        </div>

    </section> <!-- s-content --> 

   
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