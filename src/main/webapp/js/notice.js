var read="n";
$(document).ready(function(){

	//소메뉴
	$('li:nth-of-type(1)').css({'border-bottom':'3px solid #33cccc'});
	$('li').on('click',function(){
		$('li').css({'border-bottom':'0px solid #33cccc'});
		$(this).css({'border-bottom':'3px solid #33cccc'});
	});
	
	//////////notice /////////////
	contentProcess();
	
	//읽음체크를 위한 이벤트
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'noticelistopen.do?start='+0+'&read='+read,
		success:noticelistMessage
	});
	
	//스크롤 최하단이벤트
	var start=0;
	$(window).scroll(function() { 
		if ($(window).scrollTop() == $(document).height() - $(window).height() ) {
			start+=10;
			console.log(start);
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'noticelistopen.do?start='+start+'&read='+read,
				success:noticelistMessage
			});
		}
	});
	
	//////////notice 끝///////////
	
	//알림 클릭시 관련 게시글로 이동
	$(document).on('click','tr',function(){
		location.href=$(this).find('#notice_content').attr('href');
	});
});

function noticelistMessage(data){
	$.each(data,function(index, value){
		var str='<tr><td><img src="images/no_photo.png" /></td><td>'
				+'<input type="hidden" id="actor" value="'+value.notice_actor+'" />'
				+'<input type="hidden" id="type" value="'+value.notice_type+'" />'
				+'<input type="hidden" id="amount" value="'+value.notice_amount+'" />'
				+'<input type="hidden" id="read" value="'+value.notice_read+'" />'
				+'<a href="#" id="notice_content"> </a><br/>'
				+'<span id="notice_date">'+value.notice_date+'</span></td></tr>';
		$('.notice').append(str);	
	});	 
	
	contentProcess();
}//end commentMessage

function contentProcess(){
	//알림내용출력
	
	$('.notice tr').each(function(index,value){
		var content;
		var type=$(this).find('#type').val();
		var actor=$(this).find('#actor').val();
		var link='#';
		var amount=$(this).find('#amount').val();
		switch(type){
			/*
			[type]						b_num		r_num		amount
			1. 팔로받았을때 			
			2. 내글이 공유됐을때 				O
			3. 내글이 좋아요됐을때 			O
			4. 내글에 리플달렸을때			O			O
			5. 내리플에 리리플이 달렸을때		O			O
			6. 아이디가 리플에서 태그됐을때		O			O
			7. 프로필에서 후원받았을때									O
			8. 글에서 후원받았을때			O						O
			 */
			case '1':		
				content=actor+'님이 당신을 팔로우합니다.';
				//link:actor의 프로필
				link='#1';
				break;
			case '2':
				content=actor+'님이 당신의 글을 공유했습니다.';
				//link:글 주소 //글내용
				link='#2';
				break;
			case '3':
				content=actor+'님이 당신의 글을 좋아합니다.';
				//link:글 주소 //글내용
				link='#3';
				break;
			case '4':
				content=actor+'님이 당신의 글에 리플을 남겼습니다';
				//link:글 주소//리플내용추가
				link='#4';
				break;
			case '5':
				content=actor+'님이 당신의 리플에 리플을 남겼습니다';
				link='#5';
				break;
			case '6':
				content=actor+'님이 당신을 태그했습니다.';
				link='#6';
				break;
			case '7':
				content=actor+'님이 당신에게 '+amount+' P를 후원했습니다.'
				link='#7';
				break;
			case '8':
				content=actor+'님이 당신의 글에 '+amount+' P를 후원했습니다'
				link='#8';
				break;
			default:
				break;
		}
		$(this).find('#notice_content').text(content).attr('href',link);
	});
	
	//읽은알림에대해처리
	$('.notice tr').each(function(index,value){
		if($(this).find('#read').val()=='0')
			$(this).find('td').css({'backgroundColor':'#e6f7ff'});
		else if($(this).find('#read').val()=='1'){
			read="y";
			return false;
		}
	});
}