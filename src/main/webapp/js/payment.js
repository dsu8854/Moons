$(document).ready(function(){
	
	/////////달력부분///////////
	var date = new Date();
	//한달전
	var dateprev = new Date();
	dateprev.setDate(dateprev.getDate()-30);
	$('#getdateprev').val(dateprev.getFullYear()+'-'
			+(dateprev.getMonth()<10?'0'+(dateprev.getMonth()+1):(dateprev.getMonth()+1))+'-'
			+(dateprev.getDate()<10?'0'+dateprev.getDate():dateprev.getDate()));
	$('#getdate').val(date.getFullYear()+'-'
			+(date.getMonth()<10?'0'+(date.getMonth()+1):(date.getMonth()+1))+'-'
			+(date.getDate()<10?'0'+date.getDate():date.getDate()));
	
	/*$('#getdateprev').datepicker({
		altField : '#getdateprev',
		dateFormat: 'yy-mm-dd'
	});
	
	$('#getdate').datepicker({
		altField : '#getdate',
		dateFormat: 'yy-mm-dd'
	});*/
	
	/*$('#getdateprev').datepicker({
		dateFormat: 'yy-mm-dd',
		maxDate: 0,
		onClose: function() {
			$(selector2).datepicker({
				dateFormat: 'yy-mm-dd',
				minDate: new Date(),
				maxDate: 0
		    });
		});
	});*/
	
	$("#getdateprev").datepicker({
		numberOfMonths: 2,
		onSelect: function(selected) {
			$("#getdate").datepicker("option","minDate", selected)
		}
	});
	
	$("#getdate").datepicker({
		numberOfMonths: 2,
		onSelect: function(selected) {
			$("#getdateprev").datepicker("option","maxDate", selected)
		}
	});
	
	$('#getdate').on('change',function(){
		dateprev=new Date($('#getdate').val());
		dateprev.setDate(dateprev.getDate()-30);
		$('#getdateprev').val(dateprev.getFullYear()+'-'
				+(dateprev.getMonth()<10?'0'+(dateprev.getMonth()+1):(dateprev.getMonth()+1))+'-'
				+(dateprev.getDate()<10?'0'+dateprev.getDate():dateprev.getDate()));
	});
	///////////달력 끝////////
	
	$('#chargeBtn').on('click',function(){
		location.href='chargeForm.do';
		return false;
	});
	
	$('#donateBtn').on('click',function(){
		location.href='donateForm.do?point_receiver=2';
		return false;
	});
	
	/*$('[type=button]').on('click',function(){
		if($(this).index()==0){
			$('form').attr('action','payhistory.do')
			$('form').submit();
		}else if($(this).index()==1){
			$('form').attr('action','paycharge.do')
			$('form').submit();
		}else if($(this).index()==2){
			$('form').attr('action','paywithdraw.do')
			$('form').submit();
		}
	});*/
	
	/*$('#week').on('click',function(){
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'pointListOpen.do?start='+start=0,
			success:pointlistMessage
		});
	});*/
	
	$('#term').on('click',function(){
		if($('#pointCal').css('display')=='none'){   
	        $('#pointCal').show();
	    } else {   
	        $('#pointCal').hide();
	    }
	});
	
	//달력부분
	var prev=$(this);
	$('#pointHeaderCal li').on('click',function(){
		prev.css({'backgroundColor':'#ffffff','color':'#333333'});
		$(this).css({'backgroundColor':'#007399','color':'#ffffff'});
		prev=$(this);
	});
	
	/*$('#pointHeaderCal li').each(function(index,value){
		$(value).text(date.getMonth()+1-(6-$(value).index()-1)+"월");
	});*/
	
	var start=0;
	$('.addView').on('click',function(){
		start+=8;
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'pointListOpen.do?start='+start,
			success:pointlistMessage
		});
	});
});

function pointlistMessage(data){
	var user_code=parseInt($('#user_code').val());
	$.each(data,function(index, value){
		var str='<tr><td width="450">';
		if(user_code==value.point_donater){
			str+=value.user_nickname+'님에게 후원했습니다.</td>';
			str+='<td width="160" class="donatePoint">- '+value.point_donate+'</td><td width="140">';
		}else if(user_code==value.point_receiver){
			str+=value.user_nickname+'님으로부터 후원받았습니다.</td>';
			str+='<td width="160" class="receivePoint">+ '+value.point_donate+'</td><td width="140">';
		}
		var d=new Date(value.point_date);
		str+= d.getFullYear()+'-'+(d.getMonth()<10?'0'+(d.getMonth()+1):(d.getMonth()+1))+'-'
			+(d.getDate()<10?'0'+d.getDate():d.getDate())+'</td></tr>';
		$('#pointTable').append(str);
	});
}