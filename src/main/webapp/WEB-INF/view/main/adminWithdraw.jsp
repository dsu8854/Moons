<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/adminWithdraw.js"></script>
<input type="hidden" id="withdraw_state" value="${withdraw_state }" />
<div class="tab">
	<input type="button" value="미처리 내역" id="unProWitBtn" />
	<input type="button" value="인출 내역" id="accWitBtn" />
	<input type="button" value="보류 내역" id="rejWitBtn" />
</div>
<div class="withdrawWrap"></div>