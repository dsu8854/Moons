$(document).ready(function(){
	$('#dmSendBtn').on('click', function(){
		//$('#frm').attr('action', 'dmIns.do').submit();
		var formdata = $('#frm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'dmIns.do',
			data : formdata,
			success : function(res) {
				var json = JSON.parse(res);
				$('.dmbody').append('<div class="dmSend"><span class="resDate">'+json.dm_date+'</span><span class="sendBorder"><span class="sendMes">'+json.dm_content+'</span></span><a href=""><img src="images/'+$('#myPhoto').val()+'" alt="" class="senderPhoto"></a></div>');
				$(".dmbody").animate({
					"scrollTop": $(".dmbody").scrollTop() + $('.dmbody')[0].scrollHeight
				}, 1);
				//document.querySelector(".dmbody").scrollTo(0,document.querySelector(".dmbody").scrollHeight);
				$('#nowMes').val('');
				$('#nowMes').focus();
			}
		});
		
		return false;
	});
	
	$(".dmbody").animate({
		"scrollTop": $(".dmbody").scrollTop() + $('.dmbody')[0].scrollHeight
	}, 1);
	
	$('#nowMes').focus();
});