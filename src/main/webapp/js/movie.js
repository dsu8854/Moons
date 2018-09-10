$(document).ready(function(){
	var url=window.location.href.slice(window.location.href.indexOf('title=')+1,window.location.href.length);
	var title=url.split('&')[0].split('=')[1]; //현재 페이지의 title
	var director=url.split('&')[1].split('=')[1]; //현재 페이지의 director
	var movie=decodeURI(title)+'*'+decodeURI(director);

	//최초 영화정보 호출
	$.ajax({
		type:'GET',
		dataType:'xml',
		url:'movieOpen.do?title='+title+'&director='+director,
		success:viewMessage
	});
	
	//코멘트 작성
	$('#comment_submit').on('click',function(){
		//작성칸 비어있으면 수행안함
		if($('#comment_write').val()==''){
			alert('코멘트를 작성해주세요.');
			return false;
		}
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'moviecommentprocess.do?comment_write='+$('#comment_write').val()+'&movie='+movie,
			success:function(res){
				if(res) {
					location.reload();
				} else {
					alert('코멘트 작성에 실패하였습니다.');
				}
			}
		});
	});
	
	//더보기 클릭시 영화에대한 추가정보 보여줌
	$('h2').on('click',function(){
		if($('h2').attr('id')=='more'){
			$('#add').css({'display':'inline'});
			$('h2').attr('id','close');
		}
		else{
			$('#add').css({'display':'none'});
			$('h2').attr('id','more');
		}
	});
	
	//총별점 //
	var allrate=Math.round($('#allrate').val());
	$('#score_all').text($('#allrate').val());
	$('.score_star_all').each(function(index,value){
		if(allrate+1<$(value).index())
			return false;
		$(value).attr('src',$(this).attr('src').replace('off','on'));
	});	
	
	//별점시작////// index: 15~24 
	//처음 뜨는 내별점
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'movieratingprocess.do?score='+$('#score').text()+'&movie='+movie+'&stat=',
		success:ratingMessage
	});
	
	//내별점에 마우스 오버시
	$('.score_star').on('mouseover',function(){	
		var eventIndex=$(this).index()-14;
		//초기화
		$('.score_star').each(function(index,value){
			$(value).attr('src',$(this).attr('src').replace('on','off'));
		});	
		$('.score_star').each(function(index,value){
			if(eventIndex<$(value).index()-14)
				return false;
			$(value).attr('src',$(this).attr('src').replace('off','on'));
		});
	});
		
	//내별점에 마우스 아웃시
	$('.score_star').on('mouseout',function(){
		//초기화
		$('.score_star').each(function(index,value){
			$(value).attr('src',$(this).attr('src').replace('on','off'));
		});	
		//지정된 별점상태로
		$('.score_star').each(function(index,value){
			if($('#score').text()<$(value).index()-14)
				return false;
			$(value).attr('src',$(this).attr('src').replace('off','on'));
		});
	});
	
	//점수주기
	$('.score_star').on('click',function(){
		var stat=''; //별점 insert.update.delete 판별
		var prevScore=$('#score').text();
		//현재 기록한 점수와 동일한 점수 클릭시 점수 초기화
		if($(this).index()-14==$('#score').text()){
			stat='del';
			$('.score_star').each(function(index,value){
				$(value).attr('src',$(this).attr('src').replace('on','off'));
			});	
			$('#score').text('0');
		}else{
			if(prevScore=='0')
				stat='ins';
			else
				stat='upt';
			
			//클릭한 점수 반영
			$('#score').text($(this).index()-14);
		}
		console.log(movie);
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'movieratingprocess.do?score='+$('#score').text()+'&stat='+stat+'&movie='+movie,
			success:ratingMessage
		});
	});
	/////////별점끝////////////
	
	////영화감독 이름 누르면 관련 영화로 검색///
	$('#directorNm').on('click',function(){
		$('#searchFrm #searchField').val($('#directorNm').text());
		$('#searchFrm #searchType option:eq(1)').prop('selected', true);
		$('#searchFrm #searchLoc').val("movie.do");
		$('#searchFrm').submit();
	});
	
	///////관련영화 타임라인//////
	var start=0;
	$(window).scroll(function() { 
		if ($(window).scrollTop() == $(document).height() - $(window).height() ) {
			start+=3;
		}
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
	
	timelineMovie(movie);
});

function viewMessage(data){
	var xmlData = $(data).find('Result');
	
	$(xmlData).find('Row').each(function(index){
		$("#moviePoster img").attr('src',$(this).find('posters').text().split('|')[0]);
		$('#title').text($(this).find('title').text().replace(/<!HS>/gi,'').replace(/<!HE>/gi,''));
		$('#titleOther').text($(this).find('titleOrg').text()+', '
							+$(this).find('titleEng').text()+', '
							+$(this).find('prodYear').text());
		$('#summary').text($(this).find('genre').text() +' | '
							+$(this).find('nation').text() +' | '
							+$(this).find('runtime').text().split(' ')[1] +'분 | '
							+$(this).find('repRlsDate').text().substring(0,5)+'.'
							+$(this).find('repRlsDate').text().substring(5,7)+'.'
							+$(this).find('repRlsDate').text().substring(7,9));
		$('#pubDate').text($(this).find('pubDate').text());
		$('#directorNm').text($(this).find('directorNm').text().replace(/<!HS>/gi,'').replace(/<!HE>/gi,''));
		var actor="";	
		$(this).find('actorNm').each(function(index,value){
			if (index > 4)
				return false;
			if (index == 0)
				actor += $(value).text().substring(1, $(value).text().length - 1);
			else
				actor += " | "+ $(value).text().substring(1, $(value).text().length - 1);
		});
		$('#actorNm').text(actor);
		$('#rating').text($(this).find('ratingGrade').text());
		$('#plot').text($(this).find('plot').text());
	});


	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});

}//end viewMessage

function ratingMessage(res){
	//별점시작////// index: 15~24
	var score=res;//저장되어있는 사용자의 별점
	$('#score').text(score);
	$('.score_star').each(function(index,value){
		if(score<$(value).index()-14)
			return false;
		$(value).attr('src',$(this).attr('src').replace('off','on'));
	});
}//end ratingMessage

function timelineMovie(board_movie) {
	var formdata = new FormData();
	formdata.append('board_movie',board_movie);
	$.ajax({
		url : 'timelineMovie.do?',
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