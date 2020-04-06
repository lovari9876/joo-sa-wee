<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html class="no-js" lang="UTF-8">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>secondhand_trade_list</title>
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
              
        
		<div class="switch-view">

          <div id="view1" class="view--content">
        
	        <div class="row masonry-wrap">
	            <div class="masonry">
	            
	                <div class="grid-sizer"></div>
					
					<!-- 자바스크립트로 조건 2가지 넣어줘야 masonry가 예쁘게 작동! -->
					<!-- 1. 사진이 2장 이상이면 갤러리 타입, 사진 1장: standard 타입, 사진 없으면 이미지 부분 태그 통으로 빼서 벽돌리스트 이쁘게 해야함 -->
					<!-- 2. data-aos="fade-up"을 세번째 아이템에게 넣어줘야함; list[2]에 article param으로 넣을것!!-->
					<c:forEach items="${tList}" var="tItem">
					<c:choose>
					<c:when test="${tItem eq tList[0]}">
						<article class="masonry__brick entry format-standard" data-aos="fade-up">	                 
		    
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
		                        <div class="entry__excerpt" style="font-family:ariel;">
		                            ${tItem['M_NICK']}
		                        </div>
		                        <div class="entry__excerpt" style="font-weight:50;">
		                            조회수 ${tItem['T_HIT']} | 추천수 ${tItem['T_RECOMMEND_NUM']}
		                        </div>
		                        
		                        <div class="entry__meta">
		                            <span class="entry__meta-links">
		                                <a href="category.html">Design</a> 
		                                <a href="category.html">Photography</a>
		                            </span>
		                        </div>
		                    </div>
		    
		                </article> <!-- end article -->
					</c:when>
					<c:otherwise>
		                <article class="masonry__brick entry format-standard" >
		                        
		                    <div class="entry__thumb">
		                        <a href="content_view_t?t_no=${tItem['T_NO']}" class="entry__thumb-link">
		                            <img src="images/cassie/thumbs/masonry/lamp-400.jpg" 
		                                 srcset="images/cassie/thumbs/masonry/lamp-400.jpg 1x, images/cassie/thumbs/masonry/lamp-800.jpg 2x" alt="">
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
		                            <h1 class="entry__title"><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_TITLE']}</a></h1>
		                            
		                        </div>
								<div class="entry__excerpt" style="font-family:ariel;">
		                            ${tItem['M_NICK']}
		                        </div>
		                        <div class="entry__excerpt" style="font-weight:50;">
		                            조회수 ${tItem['T_HIT']} | 추천수 ${tItem['T_RECOMMEND_NUM']}
		                        </div>
		                        
		                        <div class="entry__meta">
		                            <span class="entry__meta-links">
		                                <a href="category.html">Design</a> 
		                                <a href="category.html">Photography</a>
		                            </span>
		                        </div>
		                    </div>
		    
		                </article> <!-- end article -->
		                </c:otherwise>
		                </c:choose>
	                </c:forEach>
	                
	            </div> <!-- end masonry -->
	        </div> <!-- end masonry-wrap -->               
	
	
	                <%-- <article class="masonry__brick entry format-quote" data-aos="fade-up">
	                        
	                    <div class="entry__thumb">
	                        <blockquote>
	                                <p>Good design is making something intelligible and memorable. Great design is making something memorable and meaningful.</p>
	    
	                                <cite>Dieter Rams</cite>
	                        </blockquote>
	                    </div>   
	    
	                </article> <!-- end article -->
	
	                <article class="masonry__brick entry format-video" data-aos="fade-up">
	                        
	                    <div class="entry__thumb video-image">
	                        <a href="https://player.vimeo.com/video/117310401?color=01aef0&title=0&byline=0&portrait=0" data-lity>
	                            <img src="images/cassie/thumbs/masonry/shutterbug-400.jpg" 
	                                 srcset="images/cassie/thumbs/masonry/shutterbug-400.jpg 1x, images/cassie/thumbs/masonry/shutterbug-800.jpg 2x" alt="">
	                        </a>
	                    </div>
	    
	                    <div class="entry__text">
	                        <div class="entry__header">
	                            
	                            <div class="entry__date">
	                                <a href="single-video.html">December 10, 2017</a>
	                            </div>
	                            <h1 class="entry__title"><a href="single-video.html">Key Benefits Of Family Photography.</a></h1>
	                            
	                        </div>
	                        <div class="entry__excerpt">
	                            <p>
	                                Lorem ipsum Sed eiusmod esse aliqua sed incididunt aliqua incididunt mollit id et sit proident dolor nulla sed commodo est ad minim elit reprehenderit nisi officia aute incididunt velit sint in aliqua...
	                            </p>
	                        </div>
	                        <div class="entry__meta">
	                            <span class="entry__meta-links">
	                                <a href="category.html">Family</a> 
	                                <a href="category.html">Photography</a>
	                            </span>
	                        </div>
	                    </div>
	    
	                </article> <!-- end article -->
	
	
	                <article class="masonry__brick entry format-gallery" data-aos="fade-up">
	                        
	                    <div class="entry__thumb slider">
	                        <div class="slider__slides">
	                            <div class="slider__slide">
	                                <img src="images/cassie/thumbs/masonry/gallery/gallery-1-400.jpg" 
	                                     srcset="images/cassie/thumbs/masonry/gallery/gallery-1-400.jpg 1x, images/cassie/thumbs/masonry/gallery/gallery-1-800.jpg 2x" alt=""> 
	                            </div>
	                            <div class="slider__slide">
	                                <img src="images/cassie/thumbs/masonry/gallery/gallery-2-400.jpg" 
	                                     srcset="images/cassie/thumbs/masonry/gallery/gallery-2-400.jpg 1x, images/cassie/thumbs/masonry/gallery/gallery-2-800.jpg 2x" alt=""> 
	                            </div>
	                            <div class="slider__slide">
	                                <img src="images/cassie/thumbs/masonry/gallery/gallery-3-400.jpg" 
	                                     srcset="images/cassie/thumbs/masonry/gallery/gallery-3-400.jpg 1x, images/cassie/thumbs/masonry/gallery/gallery-3-800.jpg 2x" alt="">  
	                            </div>
	                        </div>
	                    </div>
	    
	                    <div class="entry__text">
	                        <div class="entry__header">
	                            
	                            <div class="entry__date">
	                                <a href="single-gallery.html">December 10, 2017</a>
	                            </div>
	                            <h1 class="entry__title"><a href="single-gallery.html">Workspace Design Trends and Ideas.</a></h1>
	                            
	                        </div>
	                        <div class="entry__excerpt">
	                            <p>
	                                Lorem ipsum Sed eiusmod esse aliqua sed incididunt aliqua incididunt mollit id et sit proident dolor nulla sed commodo est ad minim elit reprehenderit nisi officia aute incididunt velit sint in aliqua...
	                            </p>
	                        </div>
	                        <div class="entry__meta">
	                            <span class="entry__meta-links">
	                                <a href="category.html">Work</a> 
	                                <a href="category.html">Management</a>
	                            </span>
	                        </div>
	                    </div>
	    
	                </article> <!-- end article -->
	
	                <article class="masonry__brick entry format-audio" data-aos="fade-up">
	
	                    <div class="entry__thumb">
	                        <a href="single-audio.html" class="entry__thumb-link">
	                            <img src="images/cassie/thumbs/masonry/guitarman-400.jpg" 
	                                 srcset="images/cassie/thumbs/masonry/guitarman-400.jpg 1x, images/cassie/thumbs/masonry/guitarman-800.jpg 2x" alt="">
	                        </a>
	                        <div class="audio-wrap">
	                            <audio id="player" src="media/AirReview-Landmarks-02-ChasingCorporate.mp3" width="100%" height="42" controls="controls"></audio>
	                        </div>
	                    </div>
	
	                    <div class="entry__text">
	                        <div class="entry__header">
	                            
	                            <div class="entry__date">
	                                <a href="single-audio.html">December 10, 2017</a>
	                            </div>
	                            <h1 class="entry__title"><a href="single-audio.html">What Your Music Preference Says About You and Your Personality.</a></h1>
	                            
	                        </div>
	                        <div class="entry__excerpt">
	                            <p>
	                                Lorem ipsum Sed eiusmod esse aliqua sed incididunt aliqua incididunt mollit id et sit proident dolor nulla sed commodo est ad minim elit reprehenderit nisi officia aute incididunt velit sint in aliqua...
	                            </p>
	                        </div>
	                        <div class="entry__meta">
	                            <span class="entry__meta-links">
	                                <a href="category.html">Music</a> 
	                                <a href="category.html">Lifestyle</a>
	                            </span>
	                        </div>
	                    </div>
	
	                </article> <!-- end article -->
	
	                <article class="masonry__brick entry format-link" data-aos="fade-up">
	                    
	                    <div class="entry__thumb">
	                        <div class="link-wrap">
	                            <p>The Only Resource You Will Need To Start a Blog Using WordPress.</p>
	                            <cite>
	                                <a target="_blank" href="https://colorlib.com/">https://colorlib.com</a>
	                            </cite>
	                        </div>
	                    </div>
	                    
	                </article> <!-- end article -->
	
	                 --%>

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
											<td>${tItem['M_NICK']}</td>
											<td><a href="content_view_t?t_no=${tItem['T_NO']}">${tItem['T_TITLE']}</a></td>
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
					            <a class="pgn__prev" href="tlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">
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
					        			<a class="pgn__num" href="tlist${pageMaker.makeSearch(idx)}">${idx}</a>
					        		</c:otherwise>					        
					        	</c:choose>
					        </li>
					    </c:forEach>
					 
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					        <li>
					            <a class="pgn__next" href="tlist${pageMaker.makeSearch(pageMaker.endPage +1)}">
					                &raquo;
					            </a>
					        </li>
					    </c:if>					   
					</ul>
					<!-- 글쓰기 버튼 -->
					<button class="btn btn-primary write-btn lavender-btn" type="button"
							onclick="location.href='write_view_t?bt_no=9'">글쓰기</button>
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