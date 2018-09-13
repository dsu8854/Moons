<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="js/charge.js"></script> 
<link rel="stylesheet" href="css/payment.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<div class="payment_menu" id="charge_menu">
		<ul>
			<li id="paycharge">충전하기</li>
			<li id="paychargelist" value="on">충전내역</li>
		</ul>
</div>

<div class="withdrawlistWrap">
	<div id="withdrawUse" class="minititle"> 충전 내역 </div><br/><br/>
	<table id="withdrawlistTable">
		<tr>
			<th>충전된 포인트</th>  <th>날짜</th>
		</tr>
		<c:forEach items="${chargelist }" var="cdto">
		<tr>
			<td>
				<fmt:formatNumber value="${cdto.charge_amount }" pattern="#,###"/> P</td>
			<td width="140">
				<fmt:formatDate value="${cdto.charge_date }" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		</c:forEach>
	</table>	
	<br>
	<div class="addView">
		더보기
	</div>
	
</div>


	