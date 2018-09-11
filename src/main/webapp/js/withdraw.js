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
	
	$('#withdrawBtn').on('click',function(){
		if($('#point').val()<10000) {
			alert('10000P 이상부터 인출 가능합니다.');
			return false;
		} else if($('#user_point').val()<$('#point').val()) {
			alert('잔액이 부족합니다.');
			return false;
		}
		var formdata = $('#withdrawForm').serialize();
		$.ajax({
			type:'POST',
			dataType:'text',
			data:formdata,
			url:'paywithdrawprocess.do',
			success:function(res){
				if(res) {
					alert('신청 완료!');
					location.href='payment.do';
				} else {
					alert('신청 실패!');
				}
			}
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
		
		if(value.withdraw_state==1){
			str+='<font color="#cc0000">진행중</font></td>';
		}else if(value.withdraw_state==2){
			str+='<font color="#00b300">승인</font></td>';
		}else if(value.withdraw_state==3){
			str+='<font color="#cc0000">거절</font></td>';
		}
		
		$('#withdrawlistTable').append(str);
	});
}

function closeLayer(obj) {
	   $(obj).parent().parent().hide();
	}
	 
	$(function(){

	   /* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	   $('.imgSelect').click(function(e)
	   {
	      var sWidth = window.innerWidth;
	      var sHeight = window.innerHeight;

	      var oWidth = $('.popupLayer').width();
	      var oHeight = $('.popupLayer').height();

	      // 레이어가 나타날 위치를 셋팅한다.
	      var divLeft = 767;  
	      var divTop = 417; 

	      /*// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
	      if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
	      if( divTop + oHeight > sHeight ) divTop -= oHeight;

	      // 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
	      if( divLeft < 0 ) divLeft = 0;
	      if( divTop < 0 ) divTop = 0;
	*/
	      $('.popupLayer').css({
	         "top": divTop,
	         "left": divLeft,
	         "position": "absolute"
	      }).show();
	   });

	}); 