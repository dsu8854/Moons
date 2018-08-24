$(document).ready(function(){
	$('#payCharge').on('click',function(){
		location.href='paycharge.do';
	});
	$('#payWithdraw').on('click',function(){
		location.href='paywithdraw.do';
	});
	
	var start=0;
	/////////달력세팅///////////
	var date = new Date();
	var month;
	var startterm;
	var endterm;
	//한달전
	var dateprev = new Date();
	dateprev.setDate(dateprev.getDate()-30);
	$('#getdateprev').val(dateprev.getFullYear()+'-'
			+(dateprev.getMonth()<10?'0'+(dateprev.getMonth()+1):(dateprev.getMonth()+1))+'-'
			+(dateprev.getDate()<10?'0'+dateprev.getDate():dateprev.getDate()));
	$('#getdate').val(date.getFullYear()+'-'
			+(date.getMonth()<10?'0'+(date.getMonth()+1):(date.getMonth()+1))+'-'
			+(date.getDate()<10?'0'+date.getDate():date.getDate()));
	
	startterm=$('#getdateprev').val();
	endterm=$('#getdate').val();
	
	$('#getdate').datepicker({
		altField : '#getdate',
		dateFormat: 'yy-mm-dd'
	});
	$('#getdateprev').datepicker({
		altField : '#getdateprev',
		dateFormat: 'yy-mm-dd'
	});
	
	$('#pointHeaderCal li').each(function(index,value){
		$(value).text(date.getMonth()+1-(6-$(value).index()-1)+"월");
	});
	///////////달력세팅 끝////////
	

	//달력지정부분
	var prev=$(this);
	$('#pointHeaderCal li').on('click',function(){
		start=0;
		prev.css({'backgroundColor':'#ffffff','color':'#333333'});
		$(this).css({'backgroundColor':'#007399','color':'#ffffff'});
		prev=$(this);
		
		month=$(this).text().substring(0, $(this).text().length-1);
		startterm =date.getFullYear()+'-'+(month<10?'0'+month:month)+'-01';
		endterm = date.getFullYear()+'-'+ (Number(month)+1<10?'0'+(Number(month)+1):Number(month)+1) +'-01';
		$('#getdateprev').val(startterm);
		$('#getdate').val(endterm);
		
		$('#pointTable').empty();
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'pointListOpen.do?start='+start+'&startterm='+startterm+'&endterm='+endterm,
			success:pointlistMessage
		});
	});
	
	$('#pointCalBtn').on('click',function(){
		start=0;
		$('#pointTable').empty();
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'pointListOpen.do?start='+start+'&startterm='+$('#getdateprev').val()+'&endterm='+$('#getdate').val(),
			success:pointlistMessage
		});
	});
	///달력지정부분끝
	
	//더보기
	$('.addView').on('click',function(){
		start+=8;
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'pointListOpen.do?start='+start+'&startterm='+$('#getdateprev').val()+'&endterm='+$('#getdate').val(),
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