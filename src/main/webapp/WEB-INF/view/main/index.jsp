<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<script src="js/index.js"></script> 
<link href="css/reset.css" type="text/css" rel="stylesheet" />
<link href="css/index.css" type="text/css" rel="stylesheet" />
	<div class="contents">
		<div class="banner">  
			<div class="banner-images">
				<c:forEach items="${topLink}" var="link">
					<a href="timelineDetail.do?board_num=${link.board_num}">
						<c:choose>
							<c:when test="${empty link.board_photo }">
								<div class="linkArea" style="background-image:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/back.jpg);">
							</c:when>
							<c:otherwise>
								<div class="linkArea" style="background-image:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/${link.board_photo});">
							</c:otherwise>
						</c:choose>
							<p class="imgtext" id="imgonetext">${link.board_subject}</p>  
							<input type="hidden" class="location" value="${link.location }" />
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<!--  <img id="button-previous" src="images/prev.jpg">
		<img id="button-next" src="images/next.jpg"> -->  
	</div>
	 
	<p id="keywordfont">MOONS KEYWORD</p>
	<div class="keyword-box">
		<div id="square-box">
			<table>
				<tr><td>멜로</td><td>로맨스</td><td>액션</td><td>코메디</td><td>에로</td><td>가족</td><td>스릴러</a></td></tr>
				<tr><td>어드벤처</td><td>호러</td><td>드라마</td><td>SF</a></td><td>범죄</td><td>역사</td><td>뮤지컬</td></tr>
				<tr><td>판타지</td><td>모험</td><td>애니메이션</td><td>미스터리</td><td>공포</td><td>스포츠</td><td>예술</td></tr>    
			</table>
		</div> 
	</div>
	 
	
	<p id="recomarticle">RECOMENDED REVIEW</p>  
	<div id="recomen-box"> 
		<c:forEach items="${bottomLink }" var="link">
			<a href="timelineDetail.do?board_num=${link.board_num}">
				<div class="bottomLinkArea"> 
					<c:choose>
						<c:when test="${empty link.board_photo }">
							<img src="images/back.jpg" width="200" height="200">
						</c:when>
						<c:otherwise>
							<img src="images/${link.board_photo}" width="200" height="200">
						</c:otherwise>
					</c:choose>
					<p id="title">${link.board_subject }</p>
					<div id="contents">${link.board_content }</div>
				</div>
			</a>
		</c:forEach>
	</div>
		
<footer id="dkFoot" class="foot_brunch">
	<div class="inner_foot">
		<div class="area_quotation">
			<q class="txt_quotation">A genius can't win one who does his best, a person who tries his best can't win the one who enjoys what he does.</q>
			<span class="txt_by">MoonS</span>
			<q class="txt_quotation">You can make anything by writing.</q>
			<span class="txt_by">C.S.Lewis</span>
		</div>
		<ul class="list_info">
			<li><a href="about.do" target="_blank" class="link_info">About MoonS</a></li>
			<li><a href="privacy.do" target="_blank" class="link_info privacy">개인정보 처리방침</a></li>
			<li><a href="contact.do" target="_blank" class="link_info">오시는길</a></li>
			<li><a href="/policy/terms" target="_blank" class="link_info">이용약관</a></li>
			<li><a href="/policy/privacy" target="_blank" class="link_info privacy">개인정보 처리방침</a></li>
			<li><a href="/policy/oppolicy" target="_blank" class="link_info">운영정책</a></li>
			<li><a href="http://cs.kakao.com/helps?category=89&amp;locale=ko&amp;service=54" target="_blank" class="link_info">고객센터</a></li>
			<li><a href="/contact" target="_blank" class="link_info">출간제안</a></li>
		</ul>
		<small class="txt_copyright"><a href="about.do" class="link_corp" target="_blank">© MoonS Corp.</a></small>
		<small class="txt_copyright"><a href="http://kakaocorp.com" class="link_corp" target="_blank">© Kakao Corp.</a></small>
	</div>
</footer>