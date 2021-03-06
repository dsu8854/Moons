<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="js/withdraw.js"></script> 
<link rel="stylesheet" href="css/payment.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<div class="payment_menu" id="withdraw_menu">
	<ul>
		<li id="paywithdraw" value="on">인출신청</li>
		<li id="paywithdrawlist">인출내역</li>
	</ul>
</div>
	
<div class="paywithdrawWrap">
	<div class="minititle"> 인출신청하기 </div>
   <br /><br />
   <p id="caution"><a class="imgSelect">인출시 주의사항</a></p>
   <div class="popupLayer">
      <div>
         <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1em" title="닫기">X</span> 
      </div>
      <div id="infor">
      <p id="cauinfo">- 정확한 정보를 기입해주십시오.<br/>
       (Please fill in the correct information.)</p>
      <p id="cauinfo">- 신청시 3일내에 입금됩니다.<br/>
       (At the time of application, we deposit on the third day.)</p>
      <p id="cauinfo">- 확인작업 없이 넘어감으로 다시 확인해주세요.<br/>
       (Please check again without going over.)</p>
      </div>   
   </div>
   <input type="hidden" value="${user_point}" id="user_point" />
	<form id="withdrawForm" method="post">
		<table id="withdrawTable">
			<tr>
				<th>실명</th>
				<td>
					<input type="text" size="10" name="name" id="name" />
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td> 
					<input type="text" size="5" name="identitynum0" id="identitynum0" maxlength="6" style="width:90px;"/> -
					<input type="text" size="5" name="identitynum1" id="identitynum1" maxlength="7" style="width:90px;"/> 
				</td>
			</tr>
			<tr>
         <th>인출할 포인트</th>
       	  <td>
            <label><input type="text" size="10" name="point" id="point" placeholder="*10000원 이상부터 가능합니다"/>P</label>
       	  </td>
     	 </tr>     
     	 <tr>  
       	  <th>현재 포인트</th>
       	  <td>   
        	    <label>( ${user_point} p )</label>
          </td>
     	 </tr>
			<tr>
				<th>은행</th>
				<td>
					<select name="bank">
					    <option value="">은행선택</option>
					    <option value="카카오뱅크">카카오뱅크</option>
					    <option value="농협">농협</option>
					    <option value="신한">신한은행</option>
					    <option value="국민">국민은행</option>
					    <option value="하나">하나은행</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>
					<input type="text" size="10" name="account" id="account" placeholder="'-'를 제외하고 입력해주세요."/> 
				</td>
			</tr>
			<tr>
				<th>예금주</th>
				<td> 
					<input type="text" size="10" name="holder" id="holder" /> 
				</td>
			</tr>
		</table>
		<input type="button" class="paymentBtn" id="withdrawBtn" value="인출신청" />
	</form>
</div>