<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$('#dmRoomBtn').on('click', function() {
			$('#dmListForm').attr('action', 'dmRoom.do').submit();
			return false;
		});
	});
</script>
<style type="text/css">
.dmList {
	width: 500px;
	height: 500px;
	margin: 0 auto;
	background-color: white;
	border-radius: 10px;
}

.dmRoom {
	height: 100px;
	border-bottom: 1px solid #E6ECF0;
	margin: 0 auto;
	line-height: 100px;
}

.receiver_photo {
	width: 50px;
	height: 50px;
	border-radius:50%;
	float: left;
    margin-top: 25px;
    margin-left: 25px;
}

.receiver_nickname {
	float: left;
	margin-left: 25px;
}

#dmRoomBtn {
	float: right;
	margin-top: 40px;
    margin-right: 40px;
}

</style>
<div class="dmList">
	<c:forEach items="${dmList }" var="dmDTO">
		<div class="dmRoom">
			<form id="dmListForm" method="post">
				<img src="images/${dmDTO.user_photo }" class="receiver_photo" /> 
				<span class="receiver_nickname">${dmDTO.user_nickname }</span>
				<input type="hidden" name="dm_receiver" value="${dmDTO.dm_receiver }" /> 
				<input type="button" id="dmRoomBtn" value="입장" />
			</form>
		</div>
	</c:forEach>
</div>