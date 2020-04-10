<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

    <body>
    	<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index"><img src="images/admin
                        /wolf_logo.png" width="30" class="logo_image" alt="logo">
                       ADMIN | 내사위는주사위</a>
                        <!-- home >> 사이트 메인화면으로  -->
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                       <!--  <ul class="nav nav-icons">
                            <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
                            <li><a href="#"><i class="icon-eye-open"></i></a></li>
                            <li><a href="#"><i class="icon-bar-chart"></i></a></li>
                        </ul>
                        <form class="navbar-search pull-left input-append" action="#">
                        <input type="text" class="span3">
                        <button class="btn" type="button">
                            <i class="icon-search"></i>
                        </button>
                        </form> -->
                        <ul class="nav pull-right">
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Item No. 1</a></li>
                                    <li><a href="#">Don't Click</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">Example Header</li>
                                    <li><a href="#">A Separated link</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Support </a></li>
                            <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                               <!--  <img src="images/user.png" class="nav-avatar" /> -->
                                
                                <i class="icon-desktop"></i>
                             
                                
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Your Profile</a></li>
                                    <li><a href="#">Edit Profile</a></li>
                                    <li><a href="#">Account Settings</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Logout <i class="menu-icon icon-signout"></i></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                   <!-- /.nav-collapse -->
                </div>
            </div>
           <!-- /navbar-inner -->
        </div>
        
  
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="index"><i class="menu-icon icon-cogs"></i>Main
                                </a></li>
                                <li><a href="user_list"><i class="menu-icon icon-user"></i>회원관리 </a>
                                </li>
                                <li><a href="report_list"><i class="menu-icon icon-wrench"></i>신고관리 <!-- <b class="label green pull-right"> 알림 버튼
                                    11</b> --> </a></li>
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages1"><i class="menu-icon icon-tasks">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>게시글관리  </a>
                                    <ul id="togglePages1" class="collapse unstyled">
                                        <li><a href="board_list"><i class="icon-cloud"></i> 커뮤니티  </a></li>
                                        <li><a href="board_list_trade"><i class="icon-key"></i> 보부상</a></li>
                                        <li><a href="board_list_cafe"><i class="icon-picture"></i> 카페리뷰</a></li>
                                    </ul>
                                </li>
                                <li><a href="island_list"><i class="menu-icon icon-flag"></i>무인도관리 </a><!-- icon-leaf -->
                                </li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                             
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages2"><i class="menu-icon icon-pencil">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>헬프데스크 </a>
                                    <ul id="togglePages2" class="collapse unstyled">
                                        <li><a href="faq_list"><i class="icon-check"></i> 자주하는 질문  </a></li>
                                        <li><a href="ask_list"><i class="icon-question-sign"></i> 1:1 문의 </a></li>
                                    </ul>
                                </li>
                                <li><a href="notice_list"><i class="menu-icon icon-bullhorn"></i>공지사항 </a></li>
                                <li><a href="game_list"><i class="menu-icon icon-trophy"></i>보드게임 공식정보 </a></li>
                                <li><a href="cafe_list"><i class="menu-icon icon-beer"></i>보드게임카페 정보 </a></li>
                                
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="sponsor_list"><i class="menu-icon icon-money"></i>후원금 내역</a></li>
                                <li><a href="trade_list"><i class="menu-icon icon-shopping-cart"></i>중고거래 내역 </a>
                                </li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages3"><i class="menu-icon icon-bar-chart">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>통계 </a>
                                    <ul id="togglePages3" class="collapse unstyled">
                                        <li><a href="withdrawer_list"><i class="icon-time"></i> 탈퇴사유 </a></li>
                                        <li><a href="chart_visitor"><i class="icon-group"></i> 접속자  </a></li>
                                        <li><a href="chart_post"><i class="icon-list-ul"></i> 게시글 </a></li>
                                        <li><a href="chart_comment"><i class="icon-comments"></i> 댓글 </a></li>
                                        <li><a href="chart_trade"><i class="icon-shopping-cart"></i> 중고거래 </a></li>
                                    </ul>
                                </li>
                       <!--          <li><a href="#"><i class="menu-icon icon-signout"></i>Logout </a></li> -->
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    
                    
                    
                    
    