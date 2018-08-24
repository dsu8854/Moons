<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/withdraw.js"></script> 
<link rel="stylesheet" href="css/payment.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<input type="hidden" id="user_code" value=${user_code }/>

<div class="withdraw_menu">
	<ul>
		<li id="paywithdraw">인출신청</li>
		<li id="paywithdrawlist" value="on">인출내역</li>
	</ul>
</div>

<div class="payMainWrap">
	<div id="pointUse"> 포인트 사용 내역 </div><br/><br/>
	<table id="pointTable">
		<c:forEach items="${pointList }" var="pdto">
		<tr>
			<c:choose>
				<c:when test="${user_code==pdto.point_donater }">
					<td width="450">
					${pdto.user_nickname } 님에게 후원했습니다.
					</td>
					<td width="160" class="donatePoint">- ${pdto.point_donate }</td>
				</c:when>
				<c:when test="${user_code==pdto.point_receiver}">
					<td width="450">
					${pdto.user_nickname } 님으로부터 후원받았습니다.
					</td>
					<td width="160" class="receivePoint">+ ${pdto.point_donate }</td>
				</c:when>
				<c:otherwise>
					ㅇㅇ
				</c:otherwise>
			</c:choose>
			<td width="140">
				<fmt:formatDate value="${pdto.point_date }" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		</c:forEach>
	</table>	
	<br>
	<div class="addView">
		더보기
	</div>
	
</div>


	