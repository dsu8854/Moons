$(document).ready(function(){	
	$('#unProWitBtn').on('click',function(){
		$('.withdrawWrap').empty();
		$.ajax({
			url: 'adminWithdrawList.do',
			type: 'GET',
			dataType: 'json',
			data: 'withdraw_state=1',
			success: function(res) {
				var tstart = '<table><thead><tr><th>인출번호</th><th>유저번호</th><th>실명</th><th>주민등록번호</th><th>출금액</th><th>은행</th><th>계좌번호</th><th>예금주</th><th>인출일자</th><th>신청상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					var withdraw_date = moment(item.withdraw_date);
					tcontent += '<tr class="withdraw_class"><td>'+item.withdraw_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.withdraw_name+'</td><td>'+item.withdraw_identitynum+'</td>'
							+'<td>'+item.withdraw_amount+'</td><td>'+item.withdraw_bank+'</td>'
							+'<td>'+item.withdraw_account+'</td><td>'+item.withdraw_holder+'</td>'
							+'<td>'+withdraw_date.format('YYYY-M-DD')+'</td>'
							+'<td><input type="button" value="인출" id="accBtn" />'
							+'<input type="button" value="보류" id="rejBtn" />'
							+'<form><input type="hidden" value="'+item.withdraw_num + '" name="withdraw_num" />'
							+'<input type="hidden" name="withdraw_state" /></form></td></tr>'
				});
				
				$('.withdrawWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('.withdrawWrap').on('click','#accBtn',function(){
		var form = $(this).siblings('form');
		form.children('[name=withdraw_state]').val(2);
		form.attr('action','adminWithdrawUpdate.do').submit();
	});
	
	$('.withdrawWrap').on('click','#rejBtn',function(){
		var form = $(this).siblings('form');
		form.children('[name=withdraw_state]').val(3);
		form.attr('action','adminWithdrawUpdate.do').submit();
	});
	
	$('#accWitBtn').on('click',function(){
		$.ajax({
			url: 'adminWithdrawList.do',
			type: 'GET',
			dataType: 'json',
			data: 'withdraw_state=2',
			success: function(res) {
				var tstart = '<table id="withdraw_table"><thead><tr><th>인출번호</th><th>유저번호</th><th>실명</th><th>주민등록번호</th><th>출금액</th><th>은행</th><th>계좌번호</th><th>예금주</th><th>인출일자</th><th>신청상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				var sum = 0;
				var size = 0;
				
				$.each(res,function(index,item){
					var withdraw_date = moment(item.withdraw_date);
					sum+=item.withdraw_amount;
					size+=1;
					tcontent += '<tr id="withdraw_class"><td>'+item.withdraw_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.withdraw_name+'</td><td>'+item.withdraw_identitynum+'</td>'
							+'<td>'+item.withdraw_amount+'</td><td>'+item.withdraw_bank+'</td>'
							+'<td>'+item.withdraw_account+'</td><td>'+item.withdraw_holder+'</td>'
							+'<td>'+withdraw_date.format('YYYY-M-DD')+'</td><td>인출 완료</td></tr>';
				});
				
				if(size!=0) {
					tcontent+='<tr id="withdraw_sum"><td colspan="4">총 금액</td><td>'+sum+'원</td><td colspan="4">총 수익</td><td>'+sum*0.1+'원</td>';
				}
				
				$('.withdrawWrap').html(tstart+tcontent+tend);
				
				$('.withdrawWrap').append('<a id="excelBtn" href="#" download="">내려받기</a>');
			}
		});
	});

	$('#rejWitBtn').on('click',function(){
		$('.withdrawWrap').empty();
		$.ajax({
			url: 'adminWithdrawList.do',
			type: 'GET',
			dataType: 'json',
			data: 'withdraw_state=3',
			success: function(res) {
				var tstart = '<table><thead><tr><th>인출번호</th><th>유저번호</th><th>실명</th><th>주민등록번호</th><th>출금액</th><th>은행</th><th>계좌번호</th><th>예금주</th><th>인출일자</th><th>신청상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					var withdraw_date = moment(item.withdraw_date);
					tcontent += '<tr class="withdraw_class"><td>'+item.withdraw_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.withdraw_name+'</td><td>'+item.withdraw_identitynum+'</td>'
							+'<td>'+item.withdraw_amount+'</td><td>'+item.withdraw_bank+'</td>'
							+'<td>'+item.withdraw_account+'</td><td>'+item.withdraw_holder+'</td>'
							+'<td>'+withdraw_date.format('YYYY-M-DD')+'</td><td>인출 보류</td>';
				});
				
				$('.withdrawWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	if($('#withdraw_state').val()==2)
		$('#accWitBtn').trigger('click');
	else if($('#withdraw_state').val()==3)
		$('#rejWitBtn').trigger('click');
	
	$(document).on("click",'#excelBtn',function () {
		var uri = $("#withdraw_table").excelexportjs({
            containerid: "withdraw_table"
            , datatype: 'table'
            , returnUri: true
        });

        $(this).attr('download', 'withdraw.xls').attr('href', uri).attr('target', '_blank');
	});
});