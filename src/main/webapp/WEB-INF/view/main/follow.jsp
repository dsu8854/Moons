<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="js/follow.js"></script>
<link rel="stylesheet" href="css/follow.css">
<div id="follow_list">
	<label id="follow_list_label">팔로잉 : ${followCount}명</label>
	<input type="hidden" id="followCount" value="${followCount }" />
</div>
<div class="followWrap">
	<c:forEach items="${followList}" var="follow">
		<div class="wrap_content">
			<div class="content_photo">
				<c:choose>
					<c:when test="${empty follow.user_photo}">
						<img src="images/basic.png" class="follow_image">
					</c:when>
					<c:otherwise>
						<img src="images/${follow.user_photo}" class="follow_image">
					</c:otherwise>
				</c:choose>
				<form id="timelineForm" method="post">
					<input type="hidden" name="user_code" value="${follow.follow_following }" />
				</form>
			</div>
			<div class="content_nickname">${follow.user_nickname} <img id="message-icon" src="images/message.png"> </div>     
			<c:choose> 
				<c:when test="${!empty follow.user_introduce }">
					<div class="content_introduce">${follow.user_introduce}</div>
				</c:when>
			</c:choose>
			
			<div>
				<form id="followForm" method="post">
					<input type="button" class="followCancelBtn" value="팔로우 취소" />
					<input type="hidden" name="follow_following" value="${follow.follow_following }" />
				</form>
			</div>
		</div>
	</c:forEach>
</div>