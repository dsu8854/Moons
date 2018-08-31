<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/payment.js"></script> 
<link rel="stylesheet" href="css/payment.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<input type="hidden" id="user_code" value=${user_code }/>

<div class="payMainWrap">
	<div id="payBox">
		<div id="myInfo">
			<img src="${user_photo }" />
		</div>
		<div id="pointHeader">
			<span>사용가능한 포인트 </span><br/>
			<span id="myPoint">
				<fmt:formatNumber value="${user_point }" pattern="#,###"/> P
			</span><br/><br/>
			<input type="button" class="paymentBtn" id="payCharge" value="충전" />
			<input type="button" class="paymentBtn" id="payWithdraw" value="인출" />
			<input type="button" class="paymentBtn" id="donateBtn" value="선물" />
		</div>
	</div><br/>
	<div id="pointHeaderCal">
		<ul>
			<li>월</li>
			<li>월</li>
			<li>월</li>
			<li>월</li>
			<li>월</li>
			<li>월</li>
		</ul>
		
		<input type="text" class="calRange" id="getdateprev" readonly="readonly" size="8" value="">~
		<input type="text" class="calRange" id="getdate" size="8" value="" />
		<input type="button" class="pointCalBtn" id="pointCalBtn" value="적용" />
	</div>
	
	<div id="pointUse" class="minititle"> 포인트 사용 내역 </div><br/><br/>
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