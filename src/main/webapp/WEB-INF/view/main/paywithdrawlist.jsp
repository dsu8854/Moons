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

<div class="payment_menu" id="withdraw_menu">
	<ul>
		<li id="paywithdraw">인출신청</li>
		<li id="paywithdrawlist" value="on">인출내역</li>
	</ul>
</div>

<div class="withdrawlistWrap">
	<div id="withdrawUse" class="minititle"> 인출 신청 내역 </div><br/><br/>
	<table id="withdrawlistTable">
		<tr>
			<th>신청인</th> <th>인출 금액</th> <th>은행</th> <th>계좌</th> <th>예금주</th> <th>신청일</th> <th>상태</th>
		</tr>
		<c:forEach items="${withdrawlist }" var="wdto">
		<tr>
			<td>${wdto.withdraw_name }</td>
			<td>${wdto.withdraw_amount}</td>
			<td>${wdto.withdraw_bank }</td>
			<td>${wdto.withdraw_account}</td>
			<td>${wdto.withdraw_holder }</td>
			<td width="140">
				<fmt:formatDate value="${wdto.withdraw_date }" pattern="yyyy-MM-dd" />
			</td>
			<td>
				<c:choose>
					<c:when test="${wdto.withdraw_state==0 }">
						<font color="#cc0000">진행중</font>	
					</c:when>
					<c:when test="${wdto.withdraw_state==1 }">
						<font color="#00b300">승인</font>
					</c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</table>	
	<br>
	<div class="addView">
		더보기
	</div>
	
</div>


	