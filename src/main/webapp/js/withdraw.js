$(document).ready(function(){
	//소메뉴
	$('li[value=on]').css({'border-bottom':'3px solid #33cccc'});
	$('li').on('click',function(){
		location.href=$(this).attr('id')+'.do';
	});
	
	var start=0;
	$('.addView').on('click',function(){
		start+=8;
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'withdrawListOpen.do?start='+start,
			success:withdrawlistMessage
		});
	});
});

function withdrawlistMessage(data){
	$.each(data,function(index, value){
		var str='<tr><td>';
		str+= value.withdraw_name +'</td><td>'+value.withdraw_amount + '</td><td>'+ value.withdraw_bank +'</td><td>'
			+value.withdraw_account +'</td><td>' + value.withdraw_holder +'</td><td>';
		var d=new Date(value.withdraw_date);
		str+= d.getFullYear()+'-'+(d.getMonth()<10?'0'+(d.getMonth()+1):(d.getMonth()+1))+'-'
			+(d.getDate()<10?'0'+d.getDate():d.getDate())+'</td><td>';
		
		if(value.withdraw_state==0){
			str+='<font color="#cc0000">진행중</font></td>';
		}else if(value.withdraw_state==1){
			str+='<font color="#00b300">승인</font></td>';
		}
		
		$('#withdrawlistTable').append(str);
	});
}