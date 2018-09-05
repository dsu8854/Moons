$(document).ready(function(){
	var submenu1 = $("#u_0_16").next();
	var submenu2 = $("#u_0_17").next();
	var i = 0;
	var type =1;	// 타임라인 형식 표현
	var start =0;		// 시작 지점
	
	
	
	
	$('#grid_view').css({"border-top":"none"});					// 그리드 뷰 버튼 위쪽 줄 안보이기
	
	$('.board_grid_wrap').css({"display":"none"});				// 내 글 그리드 뷰 안보이기 
	
	$('#scrapList').css({"display":"none"});					// 스크랩 리스트 뷰 안보이기
	$('#scrapGrid').css({"display":"none"});					// 스크랩 그리드 뷰 안보이기
	
	$('#likeList').css({"display":"none"});						// 좋아요 리스트 뷰 안보이기
	$('#likeGrid').css({"display":"none"});						// 좋아요 리스트 뷰 안보이기
	
	
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
	

		$('#list_view').hover(function(){							// 리스트 뷰 버튼 마우스 포인터
		$('#grid_view').css({"border-top":"2px white solid"});	// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border-top":"2px aqua solid"});	// 리스트 뷰 위쪽줄 보이기
		
		});
	
	$('#grid_view').hover(function(){							// 그리드 뷰 버튼 마우스 포인터
		$('#list_view').css({"border-top":"2px white solid"});	// 리스트 뷰 위쪽 줄 안보이기
		$('#grid_view').css({"border-top":"2px aqua solid"});	// 그리드 뷰 위쪽줄 보이기
	});
	///////////////////////////////////////////////////////////////// 처음 초기화 상태
	
	
	
	
	
	///////////////////////////////////////////////////////////////// 내 글,스크랩,좋아요 버튼상태 
	var user_code = $('[name=user_code]').val();
	
	$('#my_review').click(function(){							// 내글 버튼 보기			
		
		$('.board_grid_wrap').css({"display":"none"});			// 그리드 뷰 안보이기
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		
		$('#myWriteList').css({'display':'inline-block'});		// 내글 보이기
		$('#scrapList').css({'display':'none'});				// 스크랩 안보이기
		$('#likeList').css({'display':'none'});					// 좋아요 안보이기
		
		
		type = 1;
		
		
		
		$('#list_view').on('click',function(){	
		$('.board_grid_wrap').css({"display":"none"});		
		$('#myWriteGrid').css({'display':'none'});			
		$('#myWriteList').css({'display':'display'});	
		
		
		// 더보기 추가 작성
		$.ajax({
			url:'timelineList.do',
			type:'POST',
			dataType:'json',
			data:'user_code='+user_code+'&type='+type+'&start='+ start,
			success:function(){	
				
				
				
				
				console.log('내 글 받아오기 성공');
				
				
				}
			
			});
		});
		
		$('#grid_view').on('click',function(){	
			
			$('#myWriteList').css({'display':'none'});
			
			$('#myWriteGrid').css({"display":"grid"});		// 안보이는 걸 grid로 변경 
			$('.board_grid').css({"display":"grid"});			// 안보이는 걸 grid로 변경 
			
			
			$('#scrapGrid').css({"display":"none"});		 
			$('#likeGrid').css({"display":"none"});		
			
			
			
			$.ajax({
				url:'timelineList.do',
				type:'POST',
				dataType:'json',
				data:'user_code='+user_code+'&type='+type,
				success:function(){	
					console.log('내 글 받아오기 성공');
					
					
					}
				
				});
			});
		
		
		
		
	});
	
	$('#scrap_review').click(function(){						// 스크랩 버튼 클릭시
		type = 2;												// 타입 2
		
		$('.board_grid_wrap').css({"display":"none"});			// 그리드 뷰 안보이기
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		
		$('#myWriteList').css({'display':'none'});				// 내글 안보이기
		$('#scrapList').css({'display':'inline-block'});		// 스크랩 보이기
		$('#likeList').css({'display':'none'});					// 좋아요 안보이기 
		
		
		$('#list_view').on('click',function(){	
			$('#scrapGrid').css({'display':'none'});
			$('#scrapList').css({'display':'display'});	
			
			$.ajax({
				url:'timelineList.do',
				type:'POST',
				dataType:'json',
				data:'user_code='+user_code+'&type='+type,
				success:function(){	
					console.log('스크랩 받아오기 성공');
					
					}
				
				});
			});
			
			$('#grid_view').on('click',function(){				
				
				$('#scrapList').css({'display':'none'});
				$('#scrapGrid').css({"display":"grid"});		// 안보이는 걸 grid로 변경
				$('.board_grid').css({'display':'grid'});
				
			
				$('.board_grid').css({"display":"grid"});			// 안보이는 걸 grid로 변경 
				
				
				$('#myWriteGrid').css({"display":"none"});		 
				$('#likeGrid').css({"display":"none"});		
				
				
				
				$.ajax({
					url:'timelineList.do',
					type:'POST',
					dataType:'json',
					data:'user_code='+user_code+'&type='+type,
					success:function(){	
						console.log('스크랩 받아오기 성공');
						
						
						}
					
					});
				});
		
	});
	
	$('#like_review').click(function(){
		type = 3;
		$('.board_grid_wrap').css({"display":"none"});			// 그리드 뷰 안보이기
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		
		$('#myWriteList').css({'display':'none'});				// 내글 안보이기
		$('#scrapList').css({'display':'none'});				// 스크랩 안보이기
		$('#likeList').css({'display':'inline-block'});			// 좋아요 보이기 
		
		
		$('#list_view').on('click',function(){	
			$('#likeGrid').css({'display':'none'});
			$('#likeList').css({'display':'display'});	
			
			$.ajax({
				url:'timelineList.do',
				type:'POST',
				dataType:'json',
				data:'user_code='+user_code+'&type='+type,
				success:function(){	
					console.log('스크랩 받아오기 성공');
					
					
					}
				
				});
			});
			
			$('#grid_view').on('click',function(){	
				$('#likeList').css({'display':'none'});
				$('#likeGrid').css({"display":"grid"});		// 안보이는 걸 grid로 변경
				$('.board_grid').css({'display':'grid'});
				
				$.ajax({
					url:'timelineList.do',
					type:'POST',
					dataType:'json',
					data:'user_code='+user_code+'&type='+type,
					success:function(){	
						console.log('스크랩 받아오기 성공');
						
						
						}
					
					});
				});
			
			
	});

	// 처음 일때 리스트뷰,그리드 뷰 
	$('#list_view').on('click',function(){	
		$('.board_grid_wrap').css({"display":"none"});			// 그리드 뷰 안보이기
		
		$('.content_h3_wrap').css({"display":"inline-block"});	// 리스트 뷰 보이기 
		
		$('#scrapList').css({"display":"none"});				// 스크랩 리스트 뷰 안보이기
		$('#likeList').css({"display":"none"});
		
		
		$('#grid_view').css({"border-top":"2px white solid"});	// 그리드 뷰 위쪽 줄 안보이기
		$('#list_view').css({"border-top":"2px aqua solid"});	// 리스트 뷰 위쪽줄 보이기
		
	
	});// 리스트뷰로 보기

	
	$('#grid_view').on('click',function(){		// 그리드뷰로 보기
		$('.content_h3_wrap').css({"display":"none"});
		$('#myWriteGrid').css({"display":"grid"});			// 안보이는 걸 grid로 변경 
		$('.board_grid').css({"display":"grid"});			// 안보이는 걸 grid로 변경 
		
		
	});
	
	
	
	
});