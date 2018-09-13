var start=0;

$(document).ready(function(){
	$(document).on('click', '.like_icon', function(){
		var icon = this;
		if($('.icon_img',icon).attr('src')=='images/like2.png')
			$('.icon_img',icon).attr('src','images/like1.png');
		else
			$('.icon_img',icon).attr('src','images/like2.png');
		
		var formdata = $('#likeForm',icon).serialize();
		
		$.ajax({
			url: 'likePro.do?',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				$('#likecnt',icon).text(res);
			}
		});
		
		if($('#isLike',icon).val()=='true') {
			$('#isLike',icon).val('false');
			alert('좋아요를 취소하였습니다.');
		} else if($('#isLike',icon).val()=='false'){
			$('#isLike',icon).val('true');
			alert('해당 글을 좋아합니다.');
		}
	});
	
	$(document).on('click', '.share_icon', function(){
		var icon = this;
		if($('.icon_img',icon).attr('src')=='images/share2.png')
			$('.icon_img',icon).attr('src','images/share1.png');
		else
			$('.icon_img',icon).attr('src','images/share2.png');
		
		var formdata = $('#shareForm',icon).serialize();
		
		$.ajax({
			url: 'sharePro.do?',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				$('#sharecnt',icon).text(res);
			}
		});
		
		if($('#isShare',icon).val()=='true') {
			$('#isShare',icon).val('false');
			alert('공유를 취소하였습니다.');
		} else if($('#isShare',icon).val()=='false'){
			$('#isShare',icon).val('true');
			alert('해당 글을 공유하였습니다.');
		}
	});
	
	timelineFollow();
	
	$(window).scroll(function() { 
		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
			start+=8;
			var formdata = new FormData();
			formdata.append('start',start);
			$.ajax({
				type:'POST',
				dataType:'json',
				data:formdata,
				processData: false,
				contentType: false,
				url:'timelineLikeAdd.do',
				success:function(res) {
					$.each(res, function(index, value){
						var source = '<div class="board_card">'+
								   	 '<div class="card_page1">'+
								   	 '<div class="card_head">'+
								   	 '<a href="javascript:timeline()" class="card_writer">';
						
						if(value.user_photo==null)
							source+='<img src="images/basic.png" class="img_writer" alt="">';
						else
							source+='<img src="images/'+value.user_photo+'" class="img_writer" alt="">';
						
							source+=value.user_nickname+
									'</a>'+
									'<form id="timelineForm" method="post">'+
									'<input type="hidden" name="user_code" value="'+value.user_code+'"/>'+
									'</form>';
						
						var now = moment(new Date());
						var board = moment(value.board_date);
						
						if(board.date()==now.date()){
							if(board.hours()==now.hours())
								source+='<span class="write_date">'+(now.minutes()-board.minutes())+'분전</span>';
							else
								source+='<span class="write_date">'+(now.hours()-board.hours())+'시간전</span>';
						} else {
							source+='<span class="write_date">'+board.format("YYYY-MM-DD")+'</span>';
						}

							source+='</div>'+
									'<div class="content_part">'+
									'<div class="content_title">'+value.board_subject+'</div>'+
									'<div class="content_line">'+value.board_content+'</div>'+
									'<a href="timelineDetail.do?board_num='+value.board_num+'" class="more">더보기</a>'+
									'</div>'+
									'</div>'+
									'<div class="card_page2">'+
									'<a href="timelineDetail.do?board_num='+value.board_num+'" class="detail_view">';
							
							if(value.board_photo==null)
								source+='<img src="images/back.jpg" class="cover_img" alt="">';
							else if(value.board_photo.indexOf('http')>0)
								source+='<img src="'+value.board_photo+'" class="cover_img" alt="">';
							else
								source+='<img src="images/'+value.board_photo+'" class="cover_img" alt="">';
							
							source+='</a>'+
									'</div>'+
									'<div class="card_page3">'+
									'<div class="area_taging">';
							
							if(value.board_hashtag!=null){
								var totalTag = value.board_hashtag.split(' ');
								$.each(totalTag,function(index,value){
									source+='<span><a href="timelineHashtag.do?board_hashtag='+encodeURIComponent(value)+'" class="txt_taging">'+value+'</a></span>';
								});
							}
							
							source+='</div>'+
									'<div class="content_write">'+
									'<span class="like_icon icon_link">'+
									'<form id="likeForm" method="post">'+
									'<input type="hidden" id="isLike" name="isLike" value="'+value.isLike+'" />'+
									'<input type="hidden" name="board_num" value="'+value.board_num+'" />'+
									'</form>';
							
						if(value.isLike)	
							source+='<img src="images/like1.png" class="icon_img">';
						else
							source+='<img src="images/like2.png" class="icon_img">';
							
							source+='<span id="likecnt">'+value.board_like+'</span>'+
									'</span>'+
									'<span class="comment_icon content_icon">'+
									'<a href="timelineDetail.do?board_num='+value.board_num+'" class="icon_link">'+
									'<img src="images/comment1.png" class="icon_img">'+
									'<img src="images/comment2.png" class="icon_img">'+value.board_reply+
									'</a>'+
									'</span>'+ 
									'<span class="share_icon icon_link">'+
									'<form id="shareForm" method="post">'+
									'<input type="hidden" id="isShare" name="isShare" value="'+value.isShare+'" />'+
									'<input type="hidden" name="board_num" value="'+value.board_num+'" />'+
									'</form>';
							
						if(value.isShare)	
							source+='<img src="images/share1.png" class="icon_img">';
						else
							source+='<img src="images/share2.png" class="icon_img">';	
							
							source+='<span id="sharecnt">'+value.board_share+'</span>'+
									'</span>'+
									'</div>'+
									'</div>'+
									'</div>';
							
						$('.timelineArea').append(source);
						
						$('.content_line').find('img').parent().remove();
						$('.content_line').find('iframe').parent().remove();
					});
				}
			});
		}
	});
});

function timelineFollow() {
	$.ajax({
		url : 'timelineLikeList.do',
		type : 'POST',
		dataType : 'json',
		processData: false,
	    contentType: false,
		success : function(res) {
			$.each(res, function(index, value){
				var source = '<div class="board_card">'+
						   	 '<div class="card_page1">'+
						   	 '<div class="card_head">'+
						   	 '<a href="javascript:timeline()" class="card_writer">';
				
				if(value.user_photo==null)
					source+='<img src="images/basic.png" class="img_writer" alt="">';
				else
					source+='<img src="images/'+value.user_photo+'" class="img_writer" alt="">';
				
					source+=value.user_nickname+
							'</a>'+
							'<form id="timelineForm" method="post">'+
							'<input type="hidden" name="user_code" value="'+value.user_code+'"/>'+
							'</form>';
				
				var now = moment(new Date());
				var board = moment(value.board_date);
				
				if(board.date()==now.date()){
					if(board.hours()==now.hours())
						source+='<span class="write_date">'+(now.minutes()-board.minutes())+'분전</span>';
					else
						source+='<span class="write_date">'+(now.hours()-board.hours())+'시간전</span>';
				} else {
					source+='<span class="write_date">'+board.format("YYYY-MM-DD")+'</span>';
				}

					source+='</div>'+
							'<div class="content_part">'+
							'<div class="content_title">'+value.board_subject+'</div>'+
							'<div class="content_line">'+value.board_content+'</div>'+
							'<a href="timelineDetail.do?board_num='+value.board_num+'" class="more">더보기</a>'+
							'</div>'+
							'</div>'+
							'<div class="card_page2">'+
							'<a href="timelineDetail.do?board_num='+value.board_num+'" class="detail_view">';
					
					if(value.board_photo==null)
						source+='<img src="images/back.jpg" class="cover_img" alt="">';
					else if(value.board_photo.indexOf('http')>0)
						source+='<img src="'+value.board_photo+'" class="cover_img" alt="">';
					else
						source+='<img src="images/'+value.board_photo+'" class="cover_img" alt="">';
					
					source+='</a>'+
							'</div>'+
							'<div class="card_page3">'+
							'<div class="area_taging">';
					
					if(value.board_hashtag!=null){
						var totalTag = value.board_hashtag.split(' ');
						$.each(totalTag,function(index,value){
							source+='<span><a href="timelineHashtag.do?board_hashtag='+encodeURIComponent(value)+'" class="txt_taging">'+value+'</a></span>';
						});
					}
					
					source+='</div>'+
							'<div class="content_write">'+
							'<span class="like_icon icon_link">'+
							'<form id="likeForm" method="post">'+
							'<input type="hidden" id="isLike" name="isLike" value="'+value.isLike+'" />'+
							'<input type="hidden" name="board_num" value="'+value.board_num+'" />'+
							'</form>';
					
				if(value.isLike)	
					source+='<img src="images/like1.png" class="icon_img">';
				else
					source+='<img src="images/like2.png" class="icon_img">';
					
					source+='<span id="likecnt">'+value.board_like+'</span>'+
							'</span>'+
							'<span class="comment_icon content_icon">'+
							'<a href="timelineDetail.do?board_num='+value.board_num+'" class="icon_link">'+
							'<img src="images/comment1.png" class="icon_img">'+
							'<img src="images/comment2.png" class="icon_img">'+value.board_reply+
							'</a>'+
							'</span>'+ 
							'<span class="share_icon icon_link">'+
							'<form id="shareForm" method="post">'+
							'<input type="hidden" id="isShare" name="isShare" value="'+value.isShare+'" />'+
							'<input type="hidden" name="board_num" value="'+value.board_num+'" />'+
							'</form>';
					
				if(value.isShare)	
					source+='<img src="images/share1.png" class="icon_img">';
				else
					source+='<img src="images/share2.png" class="icon_img">';	
					
					source+='<span id="sharecnt">'+value.board_share+'</span>'+
							'</span>'+
							'</div>'+
							'</div>'+
							'</div>';
					
				$('.timelineArea').append(source);
				
				$('.content_line').find('img').parent().remove();
				$('.content_line').find('iframe').parent().remove();
			});
		}
	});
}

function timeline() {
	$('#timelineForm').attr('action','timeline.do').submit();
}