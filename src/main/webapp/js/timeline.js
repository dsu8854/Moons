var listType;
var viewType;
var user_code;

$(document).ready(function(){
	user_code=$('#profileForm').children('input[name=user_code]').val();
	$('#profileBtn').on('click',function(){
		$('#profileForm').attr('action','profile.do').submit();
	});
	
	$('#followListBtn').on('click',function(){
		$('#profileForm').attr('action','follow.do').submit();
	});
	
	$('#followerListBtn').on('click',function(){
		$('#profileForm').attr('action','follower.do').submit();
	});
	
	$('#dmBtn').on('click',function(){
		$('#dmForm').attr('action','dmRoom.do').submit();
	});
	
	$('#grid_view').on('click',function(){		// 그리드뷰로 보기
		
	});// 그리드뷰로 보기
	
	$('#list_view').on('click',function(){
		viewType=1;
		
		var formdata = new FormData();
		formdata.append('user_code',user_code);
		formdata.append('listType',listType);
		formdata.append('viewType',viewType);

		$('#list_view').css({"border":"2px red solid"});	
		$('#grid_view').css({"border":"2px gray solid"});	
		
		$('.content_h3_wrap').css({'display':'inline-block'});
		$('.board_grid_wrap').css({'display':'none'});
		
		$('.content_h3_wrap').empty();
		$.ajax({
			url : 'timelineMenu.do?',
			type : 'POST',
			dataType : 'json',
			data : formdata,
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
					else
						source+='<img src="images/'+value.board_photo+'" class="cover_img" alt="">';
						
						source+='</a>'+
								'</div>'+
								'<div class="card_page3">'+
								'<div class="area_taging">';
						
					var totalTag = value.board_hashtag.split(' ');
					$.each(totalTag,function(index,value){
						source+='<span><a href="timelineHashtag.do?board_hashtag='+encodeURIComponent(value)+'" class="txt_taging">'+value+'</a></span>';
					});
						
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
						
					$('.content_h3_wrap').append(source);
					
					$('.content_line').find('img').parent().remove();
					$('.content_line').find('iframe').parent().remove();
				});
			}
		});
	});// 리스트뷰로 보기
	
	$('#grid_view').on('click',function(){
		viewType=2;
		
		var formdata = new FormData();
		formdata.append('user_code',user_code);
		formdata.append('listType',listType);
		formdata.append('viewType',viewType);
		
		$('#list_view').css({"border":"2px gray solid"});	
		$('#grid_view').css({"border":"2px red solid"});	
		
		$('.content_h3_wrap').css({'display':'none'});
		$('.board_grid_wrap').css({'display':'grid'});
		
		$('.board_grid_wrap').empty();
		$.ajax({
			url : 'timelineMenu.do?',
			type : 'POST',
			dataType : 'json',
			data : formdata,
			processData: false,
		    contentType: false,
			success : function(res) {
				$.each(res, function(index, value){
					var source;
					if(value.board_photo==null) {
						source='<a href="timelineDetail.do?board_num='+value.board_num+'" class="link_detail">'+
							   '<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/back.jpg); background-position: center; background-repeat: no-repeat; background-size: cover;" >'+
							   '<div class="board_subject">'+value.board_subject+'</div></div></a>';
					} else {
						source='<a href="timelineDetail.do?board_num='+value.board_num+'" class="link_detail">'+
							   '<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/'+value.board_photo+'); background-position: center; background-repeat: no-repeat; background-size: cover;" >'+
							   '<div class="board_subject">'+value.board_subject+'</div></div></a>';
					}
					$('.board_grid_wrap').append(source);
					$('.board_grid').css({'display':'grid'});
				});
			}
		});
	});
	
	$('#my_review').on('click',function(){
		listType=1;	
		$.each($('#view_clear').children('button'),function(index,value){
			$(value).css({"border":"2px gray solid"});
		});
		$(this).css({"border":"2px red solid"});
		$('#list_view').trigger('click');
	});
	
	$('#scrap_review').on('click',function(){
		listType=2;
		$.each($('#view_clear').children('button'),function(index,value){
			$(value).css({"border":"2px gray solid"});
		});
		$(this).css({"border":"2px red solid"});
		$('#list_view').trigger('click');
	});
	
	$('#like_review').on('click',function(){
		listType=3;
		$.each($('#view_clear').children('button'),function(index,value){
			$(value).css({"border":"2px gray solid"});
		});
		$(this).css({"border":"2px red solid"});
		$('#list_view').trigger('click');
	});
	
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
	
	$('#my_review').trigger('click');
});

function timeline() {
	$('#timelineForm').attr('action','timeline.do').submit();
}

function getFormatDate(date){
	var year = date.getFullYear();              //yyyy
	var month = (1 + date.getMonth());          //M
	month = month >= 10 ? month : '0' + month;  // month 두자리로 저장
	var day = date.getDate();                   //d
	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	return  year + '' + month + '' + day;
}