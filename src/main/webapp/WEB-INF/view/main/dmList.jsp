<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/dmList.css">
<script src="js/dmList.js"></script>
<div class="dmList">
	<c:forEach items="${dmList }" var="dmDTO">
		<div class="dmRoom">
			<form id="dmListForm" method="post">
				<c:choose>
					<c:when test="${empty dmDTO.user_photo}">
						<img src="images/basic.png" class="receiver_photo" /> 
					</c:when>
					<c:otherwise>
						<img src="images/${dmDTO.user_photo }" class="receiver_photo" /> 
					</c:otherwise>
				</c:choose>
				<ul class="dmArea">
					<li><span class="receiver_nickname">${dmDTO.user_nickname }</span></li>
					<li><span id="roomMessage_${dmDTO.dm_receiver }"></span></li>
				</ul>
				<span class="dmCountArea">
					<span class="dmCount" id="roomCount_${dmDTO.dm_receiver }">${dmDTO.dm_count }</span>
				</span>
				<input type="hidden" name="dm_receiver" value="${dmDTO.dm_receiver }" /> 
				<input type="button" class="dmRoomBtn" value="입장" />
			</form>
		</div>
	</c:forEach>
</div>