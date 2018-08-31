$(document).ready(function(){
	var submenu1 = $("#u_0_16").next();
	var submenu2 = $("#u_0_17").next();
	var i = 0;
	
	$('.content_line').find('img').parent().remove();
	
	$('.board_grid_wrap').css({"display":"none"});				// 그리드 뷰 안보이기 
	$('#grid_view').css({"border-top":"none"});					// 그리드 뷰 위쪽 줄 안보이기
	
	$("#u_0_16").on('click',function(){ // 타임라인 태그
		if(i==0 || i==1){
			submenu1.slideToggle();
			i=1;
		}
		else if(i==2){
			submenu1.slideToggle();
			submenu2.slideUp();
			i=1;
		}
	});
	
	$("#u_0_17").on('click',function(){ // 더보기 태그	
		if(i==0 || i==2){
			submenu2.slideToggle();
			i=2;
		}else if(i==1){
			submenu2.slideToggle();
			submenu1.slideUp();
			i=2;
		}
	});
		
	
	
	// profile.jsp --> my_frm1버튼
	// 수정하기 버튼 클릭시 실행
	$('#profileBtn').on('click',function(){
		$('#profileForm').attr('action','profile.do').submit();
	});
	
	$('#followListBtn').on('click',function(){
		$('#profileForm').attr('action','follow.do').submit();
	});
	
	$('#followerListBtn').on('click',function(){
		$('#profileForm').attr('action','follower.do').submit();
	});
	
	$('#grid_view').on('click',function(){		// 그리드뷰로 보기
		// var timeline_count = $('#timeline_count').val();	// 내가 쓴글 총개수
		
		
		$('.content_h3_wrap').css({"display":"none"});
		$('.board_grid_wrap').css({"display":"grid"});		// 안보이는 걸 grid로 변경 
		$('.board_grid').css({"display":"grid"});		// 안보이는 걸 grid로 변경 
		
		/*
				$('#content_h3').append('<div class="board_grid_wrap">');
				$.each(res,function(index,item){
					
					$('#content_h3').append('<div class="board_grid">');
					
					$('#content_h3').append('<div class="board_subject">'+item.board_subject+'</div>');
					$('#content_h3').append('<div class="board_content">'+item.board_content+'</div>');
					$('#content_h3').append('</div>');
		*/
		
	});// 그리드뷰로 보기
	
	$('#list_view').on('click',function(){	
		$('.board_grid_wrap').css({"display":"none"});		// 그리드 뷰 안보이기
		
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		$('#grid_view').css({"border-top":"2px white solid"});			// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border-top":"2px aqua solid"});	// 리스트 뷰 위쪽줄 보이기
		
	});// 리스트뷰로 보기
	
		
		$('#list_view').hover(function(){						// 리스트 뷰 버튼 마우스 포인터
		$('#grid_view').css({"border-top":"2px white solid"});			// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border-top":"2px aqua solid"});	// 리스트 뷰 위쪽줄 보이기
		
		
		});
	
	$('#grid_view').hover(function(){						// 그리드 뷰 버튼 마우스 포인터
		$('#list_view').css({"border-top":"2px white solid"});			// 리스트 뷰 위쪽 줄 안보이기
		$('#grid_view').css({"border-top":"2px aqua solid"});	// 그리드 뷰 위쪽줄 보이기
	});
	
	
	
	
	$('.board_background').hover(function(){						// 마우스 올리면 주변 배경 어둡게
		
		$(this).css({"opacity":"0.4","background-color":"white"});
		
		/*var list1 = $(this).children(".board_subject").text();
		var list2 = $(this).children('div').children(".board_content").text();
		
		
		$(this).children(".board_subject").css({"opacity":"1","z-index":"2","color":"#000000"});
		$(this).children('div').children(".board_content").css({"opacity":"1","z-index":"2","color":"#000000"});*/
		
		/*
		console.log(list1);
		console.log(list2);
		*/
		
	},
	function(){
		$(this).css({"opacity":"0"});
	});
});