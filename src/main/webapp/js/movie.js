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
			return false;
		}
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'moviecommentprocess.do?comment_write='+$('#comment_write').val()+'&movie='+movie,
			success:commentMessage
		});
		$('#comment_write').val('');
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

function commentMessage(data){
	console.log("commentajax");
	$('.comment_list').empty();
	$.each(data,function(index, value){
		var str='<div class="comment"><img src="'+value.user_photo+'" />'
		+'<div id="content_box"><p id="comment_info">'
		+'<span id="comment_name">'+value.user_nickname+'</span>&nbsp;&nbsp;'
		+'<span id="comment_date">';	
		var d=new Date(value.comment_date);
		str+= d.getFullYear()+'-'+(d.getMonth()<10?'0'+(d.getMonth()+1):(d.getMonth()+1))+'-'
			+(d.getDate()<10?'0'+d.getDate():d.getDate())+'</span><br/></p>';
		str+='<p id="comment_content">'+value.comment_content+'</div></div>';
		$('.comment_list').append(str);	
	});	 
}//end commentMessage

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