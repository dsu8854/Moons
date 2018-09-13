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
		<h3>다양한 시점에서 보는 영화 리뷰 SNS</h3>
		<p>쉴틈없이 리뷰가 생성된다</p>
		<div class="start" >
			<a class="btn" href="loginPage.do">시작하기</a>
		</div>
		
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-download" id="first_d" style="pointer-events: auto"></span></p>
	</div>
</div>

<div class="intro-page_section" id="secondP" style="background-image: url(images/introimage2.jpg);">
	<div class="intro-page_centerer">
		<h3>눈으로 Pick한 평론가의 리뷰를 보다</h3>
		<p>평론가의 리뷰를 누구나 볼 수 있는 기회</p>
		<div class="start">
			<a class="btn" href="loginPage.do">시작하기</a>
		</div>
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-download" id="second_d" style="pointer-events: auto"></span></p>
	</div>
</div>
<div class="intro-page_section" id="thirdP" style="background-image: url(images/introimage3.jpg);">
	<div class="intro-page_centerer">
		<h3>자신의 손으로 Movie를 만들다</h3>
		<p>리뷰로서 소통하고 영화를 변화시킨다</p>
		<div class="start">
			<a class="btn" href="loginPage.do">시작하기</a>
		</div>
	</div>
	<div class="img-cover"></div>
	<div class="intro-page_bottomer">
		<p><span class="glyphicon glyphicon-upload" id="third_d"></span></p>
	</div>
</div>