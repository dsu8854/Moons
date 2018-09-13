<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/header.js"></script>
<link href="css/toastr.css" type="text/css" rel="stylesheet" />
<script src="js/toastr.js"></script> 
<script src="js/sidebar.js"></script>
<link rel="stylesheet" href="css/sidebar.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="css/header.css" type="text/css" rel="stylesheet" />
<div class="header-box">
	<div class="menubar">
		<a href="" class="menubarBtn"><img src="images/menubar.jpg" width="30" height="30" id="menu-bar"></a>
		<a href="index.do"><img src="images/logo.JPG" width="170" height="50" id="logo"></a>
	</div>
	<div class="search-box">
        <form id="searchFrm" method="POST" action="search.do" autocomplete="off">
        	<input type="text" name="search" id="searchField" placeholder="검색어를 입력해 주세요."/>
			<select name="type" id="searchType">
				<option value="movie" selected="selected">영화</option>
				<option value="director">감독</option>
				<option value="user">유저</option>
			</select>
			<input type="hidden" name="location" id="searchLoc" value=""/>
        <button type="submit" id="searchBtn" value="검색"><img alt="" src="images/search.jpg" width="30" height="30"></button>
        </form>
    </div> 
    <!-- 자동완성 -->
    <div id="suggest">
         <dl>
            <dt id="suggestMovieSubject">영화</dt>
            <dd id="suggestMovie"></dd>
            <dt id="suggestUserSubject">유저</dt>
            <dd id="suggestUser"></dd>
         </dl>
    </div>
	<div class="right-button">
		<c:set var="user_code" value='<%=session.getAttribute("user_code")%>' />
		<c:choose>
			<c:when test="${user_code==0 }">
				<div class="adminArea">
					<input type="button" value="관리자" id="adminBtn" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="noticeArea">
					<input type="button" value="알림" id="noticeBtn" />
					<span class="noticeCountArea">
						<span class="noticeCount"></span>
					</span>
				</div>
				<div class="messageArea">
					<input type="button" value="메세지" id="messageBtn" /> 
					<span class="messageCountArea">
						<span class="messageCount"></span>
					</span>
				</div>
				<div class="paymentArea">
					<input type="button" value="결제내역" id="paymentBtn" />
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<form id="noticeDmForm" action="dmRoom.do" method="post">
		<input type="hidden" name="dm_receiver" />
	</form>
	<div class="overlay"></div>
	<div id="sidebarWrap">
		<nav id="sidebar">
			<!-- 브런치 사이드바 따옴 -->
			<div id="wrapSideMenu" class="open">
				<div class="wrap_side_profile">
					<a href="profile.do" class="#side_my brunchHomeLink"> 
					<c:set var="user_photo" value='<%=session.getAttribute("user_photo")%>' />
						<c:choose>
							<c:when test="${empty user_photo}">
								<img class="my_image" src="images/basic.png" />
							</c:when>
							<c:otherwise> 
								<img class="my_image" src="images/${user_photo }" />
							</c:otherwise>
						</c:choose>
						<div class="my_profile">
							<strong class="user_name"><%=session.getAttribute("user_nickname")%></strong>
						</div>
					</a>
				</div>
				<div class="wrap_side_service_menu logout" style="height: 416px;">
					<ul>
						<li>
							<a class="menu_word5 #side_ready" href="javascript:mytimeline()">
								<span class="bar_left"></span>My Review
								<span class="bar_right"></span>
							</a>
							<form id="myTimelineForm" method="post"> 
								<input type="hidden" id="my_code" name="user_code" value='${user_code}' />
							</form>
						</li>
						<li>
							<a class="menu_word5 #side_ready" href="write.do">
								<span class="bar_left"></span>Review Write
								<span class="bar_right"></span>
							</a>
						</li>
						<li class="hr"></li>
						<li class="now_page">
							<a class="menu_word4 #side_brunch" href="index.do">
								<span class="bar_left"></span>MoonS
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word5 #side_publish brunchPublishLink" href="timelineAll.do">
								<span class="bar_left"></span>All Review
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word2 #side_feed brunchFeedLink" href="timelineFollow.do">
								<span class="bar_left"></span>Review Feed
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word6 #side_mag" href="timelineLike.do">
							<span class="bar_left"></span>Hot Review
							<span class="bar_right"></span>
							</a>
						</li>
					</ul>
					<div class="wrap_side_setting" style="position: absolute;">
						<a href="profile.do" class="#side_settings"><button type="button">설정</button></a>
						<a id="sideMenuLogoutButton" href="exit.do"><button type="button">로그아웃</button></a>
					</div>
				</div>
				<!-- 인스타그램 따온것 -->
				<div class="SkY6J">
					<nav class="uxKLF">
						<ul class="ixdEe">
							<li class="K5OFK"><a class="l93RR" href="about.do">About MoonS</a></li>
							<li class="K5OFK"><a class="l93RR" href="contact.do">오시는길</a></li>
							<li class="K5OFK"><a class="l93RR" href="privacy.do">개인정보처리방침</a></li>
						</ul>
					</nav>
					<span class="DINPA">ⓒ 2018 MoonS</span>
				</div>
			</div>
		</nav>
	</div>
</div>
<hr />