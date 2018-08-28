$(document).ready(function(){
	//소메뉴
	$('li[value=on]').css({'border-bottom':'3px solid #33cccc'});
	$('li').on('click',function(){
		location.href=$(this).attr('id')+'.do';
	});
	
	$('#chargeBtn').on('click',function(){
		if($('#agreement').prop('checked')==false){
			alert("결제 내역 동의에 체크해주세요.");
			return false;
		}
	
		if($('input[name=charge]:checked').val()==undefined){
			alert("충전할 금액을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			type:'GET',
			dataType:'text',
			url:'paychargeprocess.do?charge='+$('input[name=charge]:checked').val(),
			success:chargeMessage
		});
	});
	
	
	var start=0;
	$('.addView').on('click',function(){
		start+=8;
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'chargeListOpen.do?start='+start,
			success:chargelistMessage
		});
	});
});

function chargeMessage(data){
	alert("^^"+data);
	$('#chargeform').empty();
	var str='<div id="chargeSuccess">(!)<br/>결제가 완료되었습니다.</div>';
	$('#chargeform').append(str);
	
}

function chargelistMessage(data){
	$.each(data,function(index, value){
		var str='<tr><td>'+ AddComma(value.charge_amount) +'P</td><td>';
		var d=new Date(value.charge_date);
		str+= d.getFullYear()+'-'+(d.getMonth()<10?'0'+(d.getMonth()+1):(d.getMonth()+1))+'-'
			+(d.getDate()<10?'0'+d.getDate():d.getDate())+'</td></tr>';
		
		$('#withdrawlistTable').append(str);
	});
}

function AddComma(data_value) {
	return Number(data_value).toLocaleString('en');
}