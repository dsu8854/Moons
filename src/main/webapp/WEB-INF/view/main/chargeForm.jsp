<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp92934299');

$(document).ready(function(){
	$('#chargeBtn').on('click',function(){
		requestKakao();
		return false;
	});
});

function requestKakao(){
	IMP.request_pay({
	    pg : 'kakao',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'Moons 포인트 충전',
	    amount : $('input[name=payment_deposit]').val(),
	    buyer_name : $('#user_code').val()
	}, function(rsp) {
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.\n';
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        alert(msg);
	        
	        var formdata = $('#chargeForm').serialize();
	        $.ajax({
				url: 'chargePro.do',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res){
						alert('충전 성공!');
					}
					else{
						alert('충전 실패!');
					}
					location.href="payment.do";
				}
			});
	    } else {
	        var msg = '결제에 실패하였습니다.\n';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
}
</script>
<input type="hidden" id="user_code" value='<%=session.getAttribute("user_code") %>' />
<form id="chargeForm">
	<input type="text" name="payment_deposit" />
	<input type="button" id="chargeBtn" value="선물" />
</form>