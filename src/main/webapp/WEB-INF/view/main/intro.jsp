<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/intro.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="js/intro.js"></script>
<div>
	<nav class="gnb">
		<a class="logo"></a>
		<div class="gnb__right-navs">
			<a href="loginPage.do">시작하기</a>
		</div>
	</nav>
</div>
<div class="intro-page_overlay">
</div>
<ul class="intro-page__panel-snap-menu">
	<li class="intro-page__panel-snap-menu-item-active" id="first">
		<a href="/first" class="first"></a>
	</li>
	<li class="intro-page__panel-snap-menu-item" id="second">
		<a href="/second" class="second"></a>
	</li>
	<li class="intro-page__panel-snap-menu-item" id="third">
		<a href="/third" class="third"></a>
	</li>
</ul>
<div class="intro-page_section" id="firstP" style="background-image: url(images/introimage1.jpg);">
	<div class="intro-page_centerer">
		<h3> 최신 영화 리뷰 무제한 감상</h3>
		<p>Apple 앱스토어 "2019년을 빛낼 최고작" 선정 되면 좋겠다</p>
		<div class="start" >
			<a class="btn" href="loginPage.do">보러가기</a>
		</div>
		
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-download" id="first_d" style="pointer-events: auto"></span></p>
	</div>
</div>

<div class="intro-page_section" id="secondP" style="background-image: url(images/introimage2.jpg);">
	<div class="intro-page_centerer">
		<h3> 오직 웹에서만 가능</h3>
		<p>app은 할줄 모름...</p>
		<div class="start">
			<a class="btn" href="loginPage.do">보러가기</a>
		</div>
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-download" id="second_d" style="pointer-events: auto"></span></p>
	</div>
</div>
<div class="intro-page_section" id="thirdP" style="background-image: url(images/introimage3.jpg);">
	<div class="intro-page_centerer">
		<h3> 검증된 리뷰</h3>
		<p>스포없음</p>
		<div class="start">
			<a class="btn" href="loginPage.do">보러가기</a>
		</div>
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-upload" id="third_d"></span></p>
	</div>
</div>