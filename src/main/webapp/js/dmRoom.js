$(document).ready(function(){	
	$('#dmSendBtn').on('click', function(){
		var formdata = $('#dmForm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'dmIns.do',
			data : formdata,
			success : function(res) {
				var json = JSON.parse(res);
				var dm_date = moment(json.dm_date);
				
				if($('#myPhoto').val()!='null'){					
					$('.dmbody').append('<div class="dmSend"><span class="resDate">'+dm_date.format('YYYY년 M월 DD일 HH:MM')+'&nbsp;</span><span class="sendBorder"><span class="sendMes">'+json.dm_content+'</span></span><a href=""><img src="images/'+$('#myPhoto').val()+'" alt="" class="senderPhoto"></a></div>');
				} else {
					$('.dmbody').append('<div class="dmSend"><span class="resDate">'+dm_date.format('YYYY년 M월 DD일 HH:MM')+'&nbsp;</span><span class="sendBorder"><span class="sendMes">'+json.dm_content+'</span></span><a href=""><img src="images/basic.png" alt="" class="senderPhoto"></a></div>');
				}
				$(".dmbody").animate({
					"scrollTop": $(".dmbody").scrollTop() + $('.dmbody')[0].scrollHeight
				}, 1);
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