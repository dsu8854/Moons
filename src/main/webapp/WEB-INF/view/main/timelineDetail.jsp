<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="js/timelineDetail.js" ></script> 
<link href="css/timelineDetail.css" rel="stylesheet">


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
        <a href="좋아요클릭" id="contentlike"><span id="btn_one"><img src="images/like2.png" alt="" class="icon_img">좋아요</span></a>
        <a href="공유하기클릭" id="shareclick"><span id="btn_one">
        <img src="images/share2.png" alt="" class="icon_img">공유하기</span></a> 
    </div>
    
</div>
<div id="writerPhoWrap">
   <c:choose>
      <c:when test="${empty userInfo.user_photo }">
         <img src="images/basic.png" id="writer_photo">
      </c:when>
      <c:otherwise>
         <img src="images/${bdto.user_photo}" id="writer_photo">
      </c:otherwise>
   </c:choose>
   

</div>

<div id="writer_comment">
   <div id="writer_info">
       <div id="writer_nick">${bdto.user_nickname }</div>
       <div id="writer_intro">${bdto.user_introduce }</div>
       <div id="writer_contact">
           <a href="작성자페이지이동링크"><span id="writer_page">후원하기</span></a>
           <a href="구독하기이벤트적용해야될듯 일단 a태그로 그냥 걸어둠"><span id="writer_page">팔로잉</span></a>
       </div> 
    </div>
</div>

<div id="time_comment_wrap">
   <div id="time_comment">
      <div id="comment_info">댓글<span id="comment_count">${bdto.board_reply }</span></div>
      <div id="time_comment_wrap">
      
      	<ul class="reply_list" >
      	
      	<c:forEach items="${bdto.replyList }" var="rdto">
      	<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${rdto.reply_date }" var="replyDate" />
      	
           <li class="comment_one">
           <div class="comment_list">
           <c:if test="${rdto.reply_num ne rdto.reply_ref }">
				<img class="repImg" src="images/re.gif">	
           </c:if>
            <div class="comUserPhoWrap"><img src="images/back.jpg" class="comUserPho"></div>
            
            <input type="hidden" class="rep_num" name="rep_num" value="${rdto.reply_num }">
               <div class="comUserNick"><span>${rdto.user_nickname }</span><span class="comDate">${replyDate }</span></div>
               <div class="comContWrap"><div class="comCont">${rdto.reply_content }</div></div>
               <div class="comRep">
					<input type="button" class="replyBtn" value="댓글">
					<input type="button" class="reportBtn" value="신고">
               </div>
           </div>
           
			<!-- 대댓글 작성부분 -->				
           <div class="comment_rep write1">
           <img class="repImg" src="images/re.gif">
				<input type="hidden" class="reply_num" name="reply_num" value="${rdto.reply_num }" />
				<div class="comUserPhoWrap"><img src="images/back.jpg" class="comUserPho"></div>
				<div class="comUserNick">${userInfo.user_nickname }</div>
                 
				<textarea class="reply_content" name="reply_content1" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!"></textarea>
				<input class="comRepBtn" type="button" value="등록" >
			</div>
			
			<%-- 임시로놔둔부분이니 신경안써도됨
           <div class="comment_rep write2">
           <img class="repImg" src="images/re.gif">
				<input type="hidden" id="comment_user2" name="user_code2" value='${userInfo.user_code }'>
				<input type="hidden" id="board_num2" name="board_num2" value='${bdto.board_num }'>
				<div class="comUserPhoWrap"><img src="images/back.jpg" class="comUserPho"></div>
				<div class="comUserNick user2">${userInfo.user_nickname }</div>
                 
				<textarea class="reply_content rep2" name="reply_content2" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!"></textarea>
				<input class="comRepBtn btn1" type="button" value="등록" >
			</div>
			 --%>			
			
			</li>
        </c:forEach>
       </ul>
			<!-- 새로운댓글 추가 --> 
			<div class="comment_one">
				
				<input type="hidden" id="comment_user" name="user_code" value='${userInfo.user_code }'>
				<input type="hidden" id="board_num" name="board_num" value='${bdto.board_num }'>
				<input type="hidden" id="comUserNickid" name="user_nickname" value='${userInfo.user_nickname }'>
				
				<div class="comUserPhoWrap"><img src="images/back.jpg" class="comUserPho"></div>
				<div class="comUserNick">${userInfo.user_nickname }</div>
                 
				<textarea class="reply_content" name="reply_content" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!"></textarea>
				<input class="comSubBtn" type="button" value="등록" >
			</div>
		
      </div>
   </div>
</div>

 