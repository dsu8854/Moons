<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="js/follower.js"></script>
<link rel="stylesheet" href="css/follow.css">
<div id="follower_list">
	<label id="follower_list_label">팔로워 : ${followerCount}명</label>
</div>
<div class="followerWrap">
	<c:forEach items="${followerList}" var="follower">
		<div class="wrap_content">
			<div class="content_photo">
				<c:choose>
					<c:when test="${empty follower.user_photo}">
						<img src="images/basic.png" class="follower_image">
					</c:when>
					<c:otherwise>
						<img src="images/${follower.user_photo}" class="follower_image">
					</c:otherwise>
				</c:choose>
				<form id="timelineForm" method="post">
					<input type="hidden" name="user_code" value="${follower.follow_following }" />
				</form>
			</div>
			<div class="content_nickname">${follower.user_nickname}</div>
			<c:choose>
				<c:when test="${!empty follower.user_introduce }">
					<div class="content_introduce">${follower.user_introduce}</div>
				</c:when>
			</c:choose>
			<div>
				<form id="followerForm" method="post">
					<c:choose>
						<c:when test="${follower.checkFollow}">
							<input type="button" class="followerCancelBtn" value="팔로우 취소" />
						</c:when>
						<c:otherwise>
							<input type="button" class="followerBtn" value="팔로우 신청" />
						</c:otherwise>
					</c:choose> 
					<input type="hidden" name="follow_following" value="${follower.follow_following }" />
				</form>
			</div>
		</div>
	</c:forEach>
</div>