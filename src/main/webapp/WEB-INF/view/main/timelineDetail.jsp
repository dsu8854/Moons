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
		<div class="service_header" id="service_header" style="background:url('images/back.jpg') top fixed / 100% 100%;" >
	</c:when>
	<c:when test='${fn:contains(bdto.board_photo,"http")}'>
		<div class="service_header" id="service_header" style="background:url('${bdto.board_photo}') top fixed / 100% 100%;" >
	</c:when>
	<c:otherwise>
		<div class="service_header" id="service_header" style="background:url('images/${bdto.board_photo}') top fixed / 100% 100%;" >
	</c:otherwise>
</c:choose>
    <div class="cover_text">
		<div class="menulogo">
			<a href="index.do" id="logo"><img src="images/logo.png" width="170" height="50"></a>
		</div>
		<div class="cover_movie">${bdto.board_movie }</div>
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
	<c:if test="${!empty bdto.board_hashtag }">
	    <div id="time_hashtag">
	    	<c:set var="totalTag" value="${fn:split(bdto.board_hashtag,' ') }" />
			<c:forEach items="${totalTag }" var="resTag" begin="0" end="${fn:length(totalTag) }">
				<span><a href="" onclick="javascript:timelineHashtag('${resTag}')" class="time_tag">${resTag }</a></span>
			</c:forEach>
    	</div>
    </c:if>
    
    <c:choose>
		<c:when test="${empty user_code }">
		</c:when>
		<c:when test="${user_code==0}">
		</c:when>
		<c:otherwise>
    		<div class="etcbtn">
    			<span class="like_icon icon_link">
					<form id="likeForm" method="post">
						<input type="hidden" id="isLike" name="isLike" value="${bdto.isLike}" />
						<input type="hidden" name="board_num" value="${bdto.board_num}" />
					</form>
					<c:choose>
						<c:when test="${bdto.isLike}">
							<img src="images/like1.png" class="icon_img">
						</c:when>
						<c:otherwise>
							<img src="images/like2.png" class="icon_img">
						</c:otherwise>
					</c:choose>
					좋아요
					<span id="likecnt">${bdto.board_like }</span>
				</span>
				<span class="share_icon icon_link">
					<form id="shareForm" method="post">
						<input type="hidden" id="isShare" name="isShare" value="${bdto.isShare}" />
						<input type="hidden" name="board_num" value="${bdto.board_num}" />
					</form>
					<c:choose>
						<c:when test="${bdto.isShare}">
							<img src="images/share1.png" class="icon_img">
						</c:when>
						<c:otherwise>
							<img src="images/share2.png" class="icon_img">
						</c:otherwise>
					</c:choose>
					공유하기
					<span id="sharecnt">${bdto.board_share }</span>
				</span>
				<span class="scrap_icon icon_link">
					<form id="scrapForm" method="post">
						<input type="hidden" id="isScrap" name="isScrap" value="${bdto.isScrap}" />
						<input type="hidden" name="board_num" value="${bdto.board_num}" />
					</form>
					<c:choose>
						<c:when test="${bdto.isScrap}">
							<img src="images/scrap1.png" class="icon_img">스크랩취소
						</c:when>
						<c:otherwise>
							<img src="images/scrap2.png" class="icon_img">스크랩하기
						</c:otherwise>
					</c:choose>
				</span>
		        <c:set var="user_code" value='<%=session.getAttribute("user_code") %>' />
					<c:choose>	
						<c:when test="${bdto.user_code==user_code}">
							<a href="수정클릭" id="modifyclick"><span class="report_icon icon_link btn_one">수정하기</span></a>
							<a href="삭제클릭" id="deleteclick"><span class="report_icon icon_link btn_one">삭제하기</span></a>
							<span class="copy_icon icon_link">
								<a href="복사클릭" id="copyclick"><span class="btn_one">복사하기</span></a>
								<textarea id="urlArea"></textarea>
							</span>
							<form id="updateForm" method="get">
					    		<input type="hidden" name="board_num" value="${bdto.board_num }" />
					    	</form>
						</c:when>
						<c:when test="${!bdto.isReport }">
							<span class="report_icon icon_link">
								<a href="신고클릭" id="reportclick"><span class="btn_one">신고하기</span></a>
							</span>
							<span class="copy_icon icon_link">
								<a href="복사클릭" id="copyclick"><span class="btn_one">복사하기</span></a>
								<textarea id="urlArea"></textarea>
							</span>
						</c:when>
					</c:choose>
				<div class="reportArea">
					<textarea rows="10" placeholder="신고사유를 작성해주세요." id="report_reason"></textarea>
					<input type="button" value="제출" id="reportBtn" />
				</div>
				<form id="boardForm" method="post">
					<input type="hidden" name="board_num" value="${bdto.board_num }" />
		        	<input type="hidden" name="report_reason" />
     		   </form>
		    </div>  
		</c:otherwise>
	</c:choose>	
</div>
<c:if test="${bdto.user_state==1}">
<div id="writerPhoWrap">
	<c:choose>
		<c:when test="${empty bdto.user_photo }">
			<img src="images/basic.png" id="writer_photo">
		</c:when>
		<c:otherwise>
			<img src="images/${bdto.user_photo}" id="writer_photo">
		</c:otherwise>
	</c:choose>
	<form id="writerForm" method="post">
		<input type="hidden" name="user_code" value="${bdto.user_code }"/>
	</form>
</div>

<div id="writer_comment">
	<div id="writer_info">
		<div id="writer_nick">${bdto.user_nickname }</div>
		<div id="writer_intro">${bdto.user_introduce }</div>
		<c:choose>
			<c:when test="${empty user_code }">
			</c:when>
			<c:when test="${bdto.user_code!=user_code}">
				<div id="writer_contact">
					<a href="javascript:donateForm()"><span class="writer_page">후원하기</span></a>
					<c:choose>
						<c:when test="${!bdto.checkFollow}">
							<a href="javascript:followApply()"><span class="writer_page">팔로우</span></a>
						</c:when>
						<c:otherwise>
							<a href="javascript:followDelete()"><span class="writer_page">팔로우 취소</span></a>
						</c:otherwise>
					</c:choose>
					<form action="donateForm.do" id="donateForm" method="post">
						<input type="hidden" name="point_receiver" value="${bdto.user_code}" />
					</form>
					<form id="followForm" method="post">
						<input type="hidden" name="follow_following" value="${bdto.user_code}" />
					</form>
				</div>
			</c:when>
		</c:choose>
	</div>
</div>
</c:if>

<div id="time_comment_wrap">
	<div id="time_comment">
		<div id="comment_info">댓글<span id="comment_count">${bdto.board_reply }</span></div>
		<div id="time_comment_wrap">      
			<ul class="reply_list" >
      			<c:forEach items="${replyList }" var="rdto">
      				<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${rdto.reply_date }" var="replyDate" />      	
					<li class="comment_one">
						<div class="comment_list">
						<c:if test="${rdto.reply_num ne rdto.reply_ref }">
							<img class="repImg" src="images/re.png">	
						</c:if>
							<div class="comUserPhoWrap">
								<c:choose>
									<c:when test="${empty rdto.user_photo }">
										<img src="images/basic.png" class="comUserPho">
									</c:when>
									<c:otherwise>
										<img src="images/${rdto.user_photo}" class="comUserPho">
									</c:otherwise>
								</c:choose>
								<form id="timelineForm" method="post">
									<input type="hidden" name="user_code" value="${rdto.user_code}" />
								</form>
							</div>   			         
							<input type="hidden" class="rep_num" name="rep_num" value="${rdto.reply_num }">
							<input type="hidden" class="ref_num" name="ref_num" value="${rdto.reply_ref }">
							<input type="hidden" class="rep_cont" name="rep_cont" value="${rdto.reply_content }">
							<div class="comUserNick"><span>${rdto.user_nickname }</span><span class="comDate">${replyDate }</span></div>
							<div class="comContWrap"><div class="comCont">${rdto.reply_content }</div></div>
							<!-- 댓글리스트내부버튼영역 -->
							<c:if test="${!empty user_code}">
								<div class="btnWrap">
									<div class="editRep">
										<c:if test="${user_code==rdto.user_code}">
											<input type="button" class="repModifyBtn" value="수정">
											<input type="button" class="repDeleteBtn" value="삭제">									
										</c:if>
										<input type="button" class="replyBtn" value="댓글">
										<!-- <input type="button" class="reportBtn" value="신고"> -->
									</div>
								</div>
							</c:if>
						</div>
   			        
   			        	<c:if test="${!empty user_code}">
							<!-- 대댓글 작성부분 -->				
							<div class="comment_rep write1">
								<img class="repImg" src="images/re.png">
								<input type="hidden" class="reply_num" name="reply_num" value="${rdto.reply_num }" />
								<input type="hidden" class="reply_step" name="reply_step" value="${rdto.reply_step}" />
								<div class="comUserPhoWrap">
									<c:choose>
										<c:when test="${empty userInfo.user_photo }">
											<img src="images/basic.png" class="comUserPho">
										</c:when>
										<c:otherwise>
											<img src="images/${userInfo.user_photo}" class="comUserPho">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="comUserNick">${userInfo.user_nickname }</div>
								<textarea class="reply_content" name="reply_content1" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!"></textarea>
								<input class="comRepBtn" type="button" value="등록" >
							</div>
						</c:if>
					</li>
				</c:forEach>
			</ul>
			
			<c:if test="${!empty user_code}">	
				<!-- 새로운댓글 추가 --> 
				<div class="comment_one">
					<input type="hidden" id="comment_user" name="user_code" value='${userInfo.user_code }'>
					<input type="hidden" id="board_num" name="board_num" value='${bdto.board_num }'>
					<input type="hidden" id="comUserNickid" name="user_nickname" value='${userInfo.user_nickname }'>
					<input type="hidden" id="comUserPhoto" name="user_photo" value='<%=session.getAttribute("user_photo")%>'>
					<div class="comUserPhoWrap">
						<c:choose>
							<c:when test="${empty userInfo.user_photo }">
								<img src="images/basic.png" class="comUserPho">
							</c:when>
								<c:otherwise>
								<img src="images/${userInfo.user_photo}" class="comUserPho">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="comUserNick">${userInfo.user_nickname }</div>   	              
					<textarea class="reply_content" name="reply_content" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!"></textarea>
					<input class="comSubBtn" type="button" value="등록" >
				</div>
			</c:if>
		</div>
	</div>
</div>