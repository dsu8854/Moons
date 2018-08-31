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
			<li id="paycharge" value="on">충전하기</li>
			<li id="paychargelist">충전내역</li>
		</ul>
	</div>
	
<div class="paychargeWrap">
	<div class="minititle"> 충전하기 </div>
	<br /><br /><br /><br />
	<form id="chargeform">
	<hr/>
	<br /><br />
		<span class="chargetitle">충전 금액</span><br /><br />
		<table id="chargeTable">
			<tr>
				<td width="30px"><input type="radio" name="charge" value="2000"/></td>
				<td width="100px">2,000 P</td>
				<td width="150px">2,000원</td>
			</tr>
			<tr>
				<td><input type="radio" name="charge" value="5000"/></td>
				<td>5,000 P</td>
				<td>5,000원</td>
			</tr>
			<tr>
				<td><input type="radio" name="charge" value="10000"/></td>
				<td>10,000 P</td>
				<td>10,000원</td>
			</tr>
			<tr>
				<td><input type="radio" name="charge" value="20000"/></td>
				<td>20,000 P</td>
				<td>20,000원</td>
			</tr>
		</table>
		<br /><br />
		<hr/>
		<br /><br />
		<p>
			<span class="chargetitle">결제 수단</span><br /><br />
			
			<input type="radio" name="chargemethod" value="kakao" /> 카카오페이로 결제하기
		</p>
		<br /><br />
		<hr/>
		<input type="checkbox" id="agreement">위의 결제 내역에 동의합니다.
	</form>
	<br /><br />
	<input type="submit" class="paymentBtn" id="chargeBtn" value="충전하기" />
</div>
<input type="hidden" id="user_code" value='<%=session.getAttribute("user_code") %>' />