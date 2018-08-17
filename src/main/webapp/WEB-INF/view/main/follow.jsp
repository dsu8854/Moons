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
				<img src="images/${follow.user_photo}">
			</div>
			<div class="content_nickname">${follow.user_nickname}</div>
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