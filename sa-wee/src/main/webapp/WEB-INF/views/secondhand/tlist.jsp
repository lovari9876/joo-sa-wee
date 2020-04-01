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
                <h1>보부상</h1>

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
		
		      <!-- Custom rounded search bars with input group -->
		      <form role="form">		
		      
		        <div class="search--div p-1 bg-white rounded rounded-pill shadow-sm mb-4">
		          <div class="input-group">	  
		            <div class="input-group-prepend">
		              <button id="searchBtn" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
		             
		              <!-- 엔터 안되고 버튼으로만 검색가능 -->
	            		<script>
					      $(function(){
					        $('#searchBtn').click(function() {
					        	event.preventDefault(); // event canceled 막기!
					          	self.location = "/tlist" 
					          				+ '${pageMaker.makeQuery(1)}' 
					          				+ "&searchType=" 
					          				+ $("select option:selected").val() 
					          				+ "&keyword=" 
					          				+ encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
		              
		            </div>	
		            	            
		            <div class="custom-select">
		              <select><!-- data-trigger="" name="choices-single-defaul" -->
						  <option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택하세요</option>
					      <option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		                  <option>말머리</option>
		              </select>		      
		              <div class="select__arrow"></div>     
		            </div>		
		            	        		           
		            <input type="search" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="검색어를 입력하세요"
		           		   aria-describedby="button-addon2" class="form-control border-0 ">
		          </div>
		        </div>
		        		
		      </form>
		      <!-- End -->
		
		    </div>
		  </div>
		</div>  
		<!-- 검색 끝 -->       
              
        
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
	                        	<div class="entry__excerpt">${tItem['T_NO']}</div>
	                            <div class="entry__date">
	                                <a href="single-standard.html">
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
	                            <h1 class="entry__title"><a href="single-standard.html">${tItem['T_TITLE']}</a></h1>
	                            
	                        </div>
	                        <div class="entry__excerpt">
	                            <p>${tItem['M_NICK']}</p>
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
	                        <a href="single-standard.html" class="entry__thumb-link">
	                            <img src="images/cassie/thumbs/masonry/lamp-400.jpg" 
	                                 srcset="images/cassie/thumbs/masonry/lamp-400.jpg 1x, images/cassie/thumbs/masonry/lamp-800.jpg 2x" alt="">
	                        </a>
	                    </div>
	    
	                    <div class="entry__text">
	                        <div class="entry__header">
	                            <div class="entry__excerpt">${tItem['T_NO']}</div>
	                            <div class="entry__date">
	                                <a href="single-standard.html">
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${tItem['T_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
	                                </a>
	                            </div>
	                            <h1 class="entry__title"><a href="single-standard.html">${tItem['T_TITLE']}</a></h1>
	                            
	                        </div>
	                        <div class="entry__excerpt">
	                            <p>${tItem['M_NICK']}</p>
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

            </div> <!-- end masonry -->
        </div> <!-- end masonry-wrap -->

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
					<button class="btn btn-primary">글쓰기</button>
                </nav>
            </div>
        </div>

    </section> <!-- s-content --> 

    

    <!-- s-extra
    ================================================== -->
    <section class="s-extra">

        <div class="row top">

            <div class="col-eight md-six tab-full popular">
                <h3>Popular Posts</h3>

                <div class="block-1-2 block-m-full popular__posts">
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/wheel-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">Visiting Theme Parks Improves Your Health.</a></h5>
                        <section class="popular__meta">
                             <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-19">Dec 19, 2017</time></span>
                        </section>
                    </article>
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/shutterbug-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">Key Benefits Of Family Photography.</a></h5>
                        <section class="popular__meta">
                            <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-18">Dec 18, 2017</time></span>
                        </section>
                    </article>
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/cookies-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">Absolutely No Sugar Oatmeal Cookies.</a></h5>
                        <section class="popular__meta">
                                <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-16">Dec 16, 2017</time></span>
                        </section>
                    </article>
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/beetle-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">Throwback To The Good Old Days.</a></h5>
                        <section class="popular__meta">
                            <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-16">Dec 16, 2017</time></span>
                        </section>
                    </article>
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/tulips-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">10 Interesting Facts About Caffeine.</a></h5>
                        <section class="popular__meta">
                            <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-14">Dec 14, 2017</time></span>
                        </section>
                    </article>
                    <article class="col-block popular__post">
                        <a href="#0" class="popular__thumb">
                            <img src="images/cassie/thumbs/small/salad-150.jpg" alt="">
                        </a>
                        <h5><a href="#0">Healthy Mediterranean Salad Recipes</a></h5>
                        <section class="popular__meta">
                            <span class="popular__author"><span>By</span> <a href="#0"> John Doe</a></span>
                            <span class="popular__date"><span>on</span> <time datetime="2017-12-12">Dec 12, 2017</time></span>
                        </section>
                    </article>
                </div> <!-- end popular_posts -->
            </div> <!-- end popular -->
            
            <div class="col-four md-six tab-full about">
                <h3>About Philosophy</h3>

                <p>
                Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada feugiat. Pellentesque in ipsum id orci porta dapibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.
                </p>

                <ul class="about__social">
                    <li>
                        <a href="#0"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                    </li>
                </ul> <!-- end header__social -->
            </div> <!-- end about -->

        </div> <!-- end row -->

        <div class="row bottom tags-wrap">
            <div class="col-full tags">
                <h3>Tags</h3>

                <div class="tagcloud">
                    <a href="#0">Salad</a>
                    <a href="#0">Recipe</a>
                    <a href="#0">Places</a>
                    <a href="#0">Tips</a>
                    <a href="#0">Friends</a>
                    <a href="#0">Travel</a>
                    <a href="#0">Exercise</a>
                    <a href="#0">Reading</a>
                    <a href="#0">Running</a>
                    <a href="#0">Self-Help</a>
                    <a href="#0">Vacation</a>
                </div> <!-- end tagcloud -->
            </div> <!-- end tags -->
        </div> <!-- end tags-wrap -->

    </section> <!-- end s-extra -->


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