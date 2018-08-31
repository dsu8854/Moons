<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<link href="css/timelineDetail.css" rel="stylesheet">
<script src="js/timelineDetail.js"></script>

<!-- 이부분은 background가 계속 변경되니까 일부러 인라인으로 스타일을 적용함 -->
<c:choose>
	<c:when test="${empty bdto.board_photo }">
		<div class="service_header" id="service_header" style="background: url(images/back.jpg) no-repeat 100% 100% /100% 100%" >
	</c:when>
	<c:otherwise>
		<div class="service_header" id="service_header" style="background: url(images/${bdto.board_photo}) no-repeat 100% 100% /100% 100%" >
	</c:otherwise>
</c:choose>
	<div class="menubar">
		<a href="index.do" id="logo"><img src="images/logo.png" width="170" height="50"></a>
	</div>
    <div class="cover_text">
        <div class="cover_movie">영화장르표시(임시)</div>
        <div class="cover_title" id="board_subject_cover">${bdto.board_subject }</div>
        <div class="cover_info">
            <span class="cover_writer">by ${bdto.user_nickname }</span>
            
            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${bdto.board_date }" var="boardDate" />
            
            <span class="cover_date">${boardDate}</span>
        </div>

    </div>
</div>

<!-- <p>소제목: </p> -->
<div id="time_content">${bdto.board_content }</div>

<div id="etc_info">
    <div id="time_hashtag">
    <c:set var="totalTag" value="${fn:split(bdto.board_hashtag,',') }" />
	<c:forEach items="${totalTag }" var="resTag" begin="0" end="${fn:length(totalTag) }">
	<span><a href="태그이동페이지" class="time_tag">#${resTag }</a></span>
	</c:forEach>
    </div>
    
    <div class="etcbtn">
        <a href="좋아요클릭" id="contentlike"><span class="btn_one"><img src="images/like2.png" alt="" class="icon_img">좋아요</span></a>
        <a href="공유하기클릭" id="shareclick"><span class="btn_one"><img src="images/share2.png" alt="" class="icon_img">공유하기</span></a> 
        <a href="삭제클릭" id="deleteclick"><span class="btn_one">삭제</span></a>
        <form id="deleteForm" method="post">
        	<input type="hidden" name="board_num" value="${bdto.board_num }" />
        </form>
    </div>
    
</div>
<div id="writerPhoWrap"><img src="images/${bdto.user_photo}" alt="" id="writer_photo"></div>
<div id="writer_comment">
	<div id="writer_info">
    	<div id="writer_nick">${bdto.user_nickname }</div>
    	<div id="writer_intro">${bdto.user_introduce }</div>
    	<div id="writer_contact">
        	<a href="profile.do"><span id="writer_page">작성자페이지</span></a>
        	<a href="구독하기이벤트적용해야될듯 일단 a태그로 그냥 걸어둠"><span id="writer_page">구독하기</span></a>
    	</div> 
    </div>
</div>

<div id="time_comment_wrap">
	<div id="time_comment">
		<div id="comment_info">댓글<span id="comment_count">${bdto.board_reply }</span></div>
		<div id="time_comment_wrap">
        	<div id="comment_one">
				<div id="comUserPhoWrap"><img src="images/back.jpg" id="comUserPho"></div>
            	<div id="comUserNick"><span>댓글유저</span><span id="comDate">2018.08.24</span></div>
            	<div id="comContWrap"><div id="comCont">댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.</div></div>
        	</div>
        	<div id="comment_one">
				<div id="comUserPhoWrap"><img src="images/back.jpg" id="comUserPho"></div>
            	<div id="comUserNick"><span>댓글유저</span><span id="comDate">2018.08.24</span></div>
            	<div id="comCont">댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.</div>
        	</div>
        	<div id="comment_one">
				<div id="comUserPhoWrap"><img src="images/back.jpg" id="comUserPho"></div>
            	<div id="comUserNick"><span>댓글유저</span><span id="comDate">2018.08.24</span></div>
            	<div id="comCont">댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.댓글내용을 입력하는 부분입니다.</div>
    	    </div>
		</div>
	</div>
</div>

 