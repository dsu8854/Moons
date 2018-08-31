<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/payment.js"></script> 
<link rel="stylesheet" href="css/payment.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<c:set var="user_code" value='<%=session.getAttribute("user_code")%>' />
<c:set var="user_photo" value='<%=session.getAttribute("user_photo")%>' />
<input type="hidden" id="user_code" value=${user_code }/>

<div class="payMainWrap">
	<form id="payForm" action="">
	<div id="payBox">
		<div id="myInfo">
			<img src="images/${user_photo }" />
		</div><div id="pointHeader">
			<span>사용가능한 포인트 </span><br/>
			<span id="myPoint">${user_point }P</span><br/><br/>
			<input type="button" class="paymentBtn" id="chargeBtn" value="충전" />
			<input type="button" class="paymentBtn" id="payWithdraw" value="인출" />
			<input type="button" class="paymentBtn" id="donateBtn" value="선물" />
		</div><div id="pointWithdraw">
			<a href="#">인출내역(>)</a>
		</div><br/>
		<div id="pointHeaderCal">
			<ul>
				<li id="week">1주일</li>
				<li id="month">1개월</li>
				<li id="sixMonth">6개월</li>
				<li id="term">조건검색</li>
			</ul>
			<div id="pointCal" style="display:none">
				<input type="text" class="calRange" id="getdateprev" readonly="readonly" size="8" value="">~
				<input type="text" class="calRange" id="getdate" size="8" value="" />
				<input type="button" class="pointCalBtn" id="pointCalBtn" value="적용" />
			</div>
		</div>
	</div>
	</form>
	
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


	