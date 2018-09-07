<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="overlay"></div>
<div id="sidebarWrap">
	<nav id="sidebar">
		<!-- 브런치 사이드바 따옴 -->
		<div id="wrapSideMenu" class="open">
			<div class="wrap_side_profile">
				<a href="profile.do" class="#side_my brunchHomeLink"> 
					<c:choose>
						<c:otherwise>
							<img class="my_image"
								src="images/<%=session.getAttribute("user_photo")%>" />
							<div class="my_profile">
								<strong class="user_name"><%=session.getAttribute("user_nickname")%></strong>
								<!-- <p class="text_profile_id">MoonS.co.kr/@han2233</p> -->
							</div>
							
							
						</c:otherwise>
					</c:choose>
				</a>
			</div>
			<div class="wrap_side_service_menu logout" style="height: 416px;">
				<ul>
					<li><a class="menu_word5 #side_ready" href="/ready"><span
							class="bar_left"></span>내가 쓴 리뷰<span class="bar_right"></span></a></li>
					<li class="hr"></li>
					<li class="now_page"><a class="menu_word4 #side_brunch"
						href="main.do"><span class="bar_left"></span>MoonS 홈<span
							class="bar_right"></span></a></li>
					<li><a class="menu_word5 #side_now brunchNowLink" href="/now"><span
							class="bar_left"></span>MoonS Now<span class="bar_right"></span></a>
					</li>
					<li><a class="menu_word5 #side_publish brunchPublishLink"
						href="/publish"><span class="bar_left"></span>신작영화<span
							class="bar_right"></span></a></li>
					<li><a class="menu_word2 #side_feed brunchFeedLink"
						href="list.do"><span class="bar_left"></span>피드<span
							class="bar_right"></span></a></li>
					<li><a class="menu_word6 #side_mag" href="/magazine"><span
							class="bar_left"></span>이달의 리뷰<span class="bar_right"></span></a></li>

				</ul>
				<div class="wrap_side_setting" style="position: absolute;">
					<a href="/me/settings" class="#side_settings"><button
							type="button">설정</button></a> <a id="sideMenuLogoutButton"
						href="exit.do"><button type="button">로그아웃</button></a>
				</div>
			</div>
			<!-- 인스타그램 따온것 -->
			<div class="   SkY6J">
				<nav class="uxKLF">
					<ul class="ixdEe">
						<li class="K5OFK"><a class="l93RR" href="about.do">MoonS
								정보</a></li>
						<li class="K5OFK"><a class="l93RR">채용 정보</a></li>
						<li class="K5OFK"><a class="l93RR">개인정보처리방침</a></li>
						<li class="K5OFK"><a class="l93RR">디렉터리</a></li>
					</ul>
				</nav>
				<span class="DINPA">ⓒ 2018 MoonS</span>
			</div>
		</div>
	</nav>
</div>