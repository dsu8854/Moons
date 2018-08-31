$(document).ready(function(){
	var submenu1 = $("#u_0_16").next();
	var submenu2 = $("#u_0_17").next();
	var i = 0;
	
	$('.board_grid_wrap').css({"display":"none"});				// 그리드 뷰 안보이기 
	$('#grid_view').css({"border":"none"});					// 그리드 뷰 위쪽 줄 안보이기
	
	
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
		
		$('.content_h3_wrap').css({"display":"none"});
		$('.board_grid_wrap').css({"display":"grid"});		// 안보이는 걸 grid로 변경 
		$('.board_grid').css({"display":"grid"});			// 안보이는 걸 grid로 변경 
		
	});// 그리드뷰로 보기
	
	$('#list_view').on('click',function(){	
		$('.board_grid_wrap').css({"display":"none"});			// 그리드 뷰 안보이기
		
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		$('#grid_view').css({"border":"2px white solid"});	// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border":"2px solid #a0a0a0"});	// 리스트 뷰 위쪽줄 보이기
	});// 리스트뷰로 보기
	
	$('#list_view').hover(function(){							// 리스트 뷰 버튼 마우스 포인터
		$('#grid_view').css({"border":"2px white solid"});	// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border":"2px solid #a0a0a0"});	// 리스트 뷰 위쪽줄 보이기
		
		});
	
	$('#grid_view').hover(function(){							// 그리드 뷰 버튼 마우스 포인터
		$('#list_view').css({"border":"2px white solid"});	// 리스트 뷰 위쪽 줄 안보이기
		$('#grid_view').css({"border":"2px solid #a0a0a0"});	// 그리드 뷰 위쪽줄 보이기
	});
	
	$('#my_review').hover(function(){
		$('#friends_review').css({"border":"2px white solid"});
		$('#my_review').css({"border":"2px solid #a0a0a0"});
		if($('#grid_view').css({"border":"2px solid #a0a0a0"}))
		{
		$('#list_view').css({"margin-top":"2px solid #a0a0a0;"});
		}
	});
	
	$('#friends_review').hover(function(){
		
		$('#my_review').css({"border":"2px white solid"});
		$('#friends_review').css({"border":"2px solid #a0a0a0"});
		
	});
	
	
	
});