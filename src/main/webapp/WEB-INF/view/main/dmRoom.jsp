<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/dmRoom.css">
<script src = "js/moment.js"></script>
<script src="js/dmRoom.js"></script>
	<div class="dm">		
		<input type="hidden" id="myNickname" value="<%=session.getAttribute("user_nickname")%>"/>
		<input type="hidden" id="myPhoto" value="<%=session.getAttribute("user_photo")%>"/>
		<input type="hidden" id="yourNickname" value="${yourInfo.user_nickname }"/>
		<input type="hidden" id="yourPhoto" value="${yourInfo.user_photo }"/>
		
		<!-- 맨상단의 유저정보표시 -->
		<div class="dmhead">
			<a href="dmList.do" class="dmPrev">&lt;</a>
			<c:choose>
				<c:when test="${empty yourInfo.user_photo}">
					<a href="timeline.do?user_code=${yourInfo.user_code }" id="dmUser"><img src="images/basic.png"  class="senderPhotoHead">${yourInfo.user_nickname }</a>
				</c:when>
				<c:otherwise>
					<a href="timeline.do?user_code=${yourInfo.user_code }" id="dmUser"><img src="images/${yourInfo.user_photo }"  class="senderPhotoHead">${yourInfo.user_nickname }</a>
				</c:otherwise>
			</c:choose>
		</div>	
	    
	    <!-- 대화내용 표시하는 부분 -->
		<div class="dmbody">
   		<c:forEach items="${dmList }" var="dmDTO">
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${dmDTO.dm_date }" type="both" dateStyle="short" timeStyle="short" var="dm_date" />
		
			<!-- 왼쪽에 표시되는 말풍선 : 현재유저가 dm을 받는 사람 -->
			<c:if test="${nowUser == dmDTO.dm_receiver}">
			<div class="dmReceive">
				<c:choose>
					<c:when test="${empty dmDTO.user_photo}">
						<a href="timeline.do?user_code=${yourInfo.user_code }" ><img src="images/basic.png" alt="" class="receiverPhoto"></a>
					</c:when>
					<c:otherwise>
						<a href="timeline.do?user_code=${yourInfo.user_code }" ><img src="images/${dmDTO.user_photo }" alt="" class="receiverPhoto"></a>
					</c:otherwise>
				</c:choose>
				<span class="receiveBorder">
				<span class="reMes">${dmDTO.dm_content }</span></span>
				<span class="resDate">${dm_date }</span>
			</div>
			</c:if>

			<!-- 오른쪽에 표시되는 말풍선 : 현재유저가 dm을 보내는 사람 -->
			<c:if test="${nowUser == dmDTO.user_code}">
				<div class="dmSend">
					<span class="resDate">${dm_date }</span>
					<span class="sendBorder">
					<span class="sendMes">${dmDTO.dm_content }</span></span>
					<c:choose>
						<c:when test="${empty dmDTO.user_photo}">
							<a href="" ><img src="images/basic.png" alt="" class="senderPhoto"></a>
						</c:when>
						<c:otherwise>
							<a href="" ><img src="images/${dmDTO.user_photo }" alt="" class="senderPhoto"></a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>

		</c:forEach>
		</div>
	    
	    <!-- 채팅메세지입력하는부분 -->
		<form id="dmForm" method="post">
			<div class="dmfooter">
				<input type="hidden" name="user_code" value="${nowUser }" />
				<input type="hidden" name="dm_receiver" id="dm_code" value="${yourInfo.user_code }" />
				<input type="hidden" name="user_nickname" value="${yourInfo.user_nickname }" />
				<img src="images/mesImg.png" class="mesImg">
				<input type="text" name="dm_content" id="nowMes" autocomplete="off" >
	        	
				<input type="image" src="images/sendBtn.png" id="dmSendBtn" />
			</div>
		</form>
	</div>