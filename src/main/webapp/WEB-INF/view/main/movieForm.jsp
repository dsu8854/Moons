<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src = "js/moment.js"></script>
<script src="js/movie.js"></script> 
<link rel="stylesheet" href="css/movie.css">
<div class="movieWrap">
	<div id="moviePoster"><img src="" /></div>
	<div id="movieInfo">
		<span id="title">title</span><br/>
		<span id="titleOther">titleOrg, titleEng, prodYear</span><br/><br/>
		<h1>개요</h1><span id="summary">genre | nation | runtime | repRlsDate</span><br/>
		<h1>감독</h1><span id="directorNm">directorNm</span><br/>
		<h1>출연</h1>	<span id="actorNm">actorNm</span><br/>
		<h1>등급</h1>	<span id="rating">rating</span><br/>
		<hr/>
		<h1>줄거리</h1>
		<span id="plot">plot</span>
		<br/><br/>
		<h2 id="more">상세 영화 정보</h2>
		<p id="add">

		<h1>제작사</h1> company<br/>
		<h1>주제곡</h1> themeSong<br/>
		<h1>영화제 수상 내역</h1> Awards1<br/>
		<h1>수상내역 기타</h1> Award2<br/>
		<h1>누적관람인원</h1> audiAcc<br/>
		</p>
	</div>
</div>
<br/>
<div class="rating_box">
	<h3>총 별점</h3><input type="hidden" id="allrate" value="${allrate}" />
	<c:forEach begin="1" end="5" step="1"><img class="score_star_all" src="images/score_left_off.png"/><img class="score_star_all" src="images/score_right_off.png"/></c:forEach>
	&nbsp;
	<span id="score_all">0</span>
	<br/>
	<h3>내 별점</h3>
	<c:forEach begin="1" end="5" step="1"><img class="score_star" src="images/score_left_off.png"/><img class="score_star" src="images/score_right_off.png"/></c:forEach>
	&nbsp;
	<span id="score">0</span>
</div>
<div class="comment_box">
	<div id="comment_write_box">
		<input type="text" id="comment_write" name="comment_write" maxlength="150" placeholder="최대 150자까지 작성됩니다."/><input type="button" id="comment_submit" value="작성"/>
	</div>
	<div class="comment_list">
		<c:forEach var="commdto" items="${commList}" >
			<div class="comment">
				<c:choose>
					<c:when test="${empty commdto.user_photo }">
						<img src="images/basic.png" width="40px"/>
					</c:when>
					<c:otherwise>
						<img src="images/${commdto.user_photo}" width="40px"/>
					</c:otherwise>
				</c:choose>
				<div id="content_box">
					<p id="comment_info">
						<span id="comment_name">${commdto.user_nickname}</span>&nbsp;&nbsp;
						<span id="comment_date">
							<fmt:formatDate value="${commdto.comment_date }" pattern="yyyy-MM-dd" />
						</span><br/>
					</p>
					<p id="comment_content">${commdto.comment_content }</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="timelineArea"></div>