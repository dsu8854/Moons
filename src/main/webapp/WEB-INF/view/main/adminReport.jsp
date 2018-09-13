<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src = "js/moment.js"></script>
<script src="js/adminReport.js"></script>
<input type="hidden" id="report_state" value="${report_state }" />
<div class="tab">
	<input type="button" value="미처리 내역" id="unProRepBtn" />
	<input type="button" value="삭제 내역" id="accRepBtn" />
	<input type="button" value="보류 내역" id="rejRepBtn" />
	<input type="button" value="기타 내역" id="selfDelBtn" />
</div>
<div class="reportWrap"></div>