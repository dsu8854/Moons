$(document).ready(function(){
	$('#donateBtn').on('click',function(){
		var formdata = $('#donateForm').serialize();
		$.ajax({
			url: 'donatePro.do',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				if(res){
					alert('선물 완료!');
				}
				else{
					alert('선물 실패!');
				}
				location.href="payment.do";
			}
		});
		return false;
	});
});