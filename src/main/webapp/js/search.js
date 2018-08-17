$(document).ready(function(){
	//search.do가 아닌곳에서 들어왔을 때 최초 출력
	if(window.location.href.indexOf("value")>=0){
		var param = decodeURIComponent((window.location.href.slice(window.location.href.indexOf('=') + 1, window.location.href.length)).split('&')[0]);
		$('#searchField').val(param);
		searchAjax(30,0);
	}

	//소메뉴
	$('li:nth-of-type(1)').css({'border-bottom':'3px solid #33cccc'});
	$('li').on('click',function(){
		$('li').css({'border-bottom':'0px solid #33cccc'});
		$(this).css({'border-bottom':'3px solid #33cccc'});
	});

	$('li:nth-of-type(1)').click(function(){
		$('#searchWrap').empty();
		searchAjax(30,0);
	});
	
	$('li:nth-of-type(2)').click(function(){
		$('#searchWrap').empty();
		//유저ajax실행
	});
	
	//스크롤시 영화 30개 더 로딩
	var start=0;
	$(window).scroll(function() { 
		if ($(window).scrollTop() == $(document).height() - $(window).height() ) {
			start+=30;
			searchAjax(30,start);
		}
	});

	$('#searchbtn').click(function(){
		//검색키워드 없을시 이벤트발생 안됨
		if($('#searchField').val()=="")
			return false;
		$('#searchWrap').empty();
		searchAjax(30,0);
	});
	
	 $('#searchField').on('keypress',function(event){
		 if(event.keyCode==13){
			 if($('#searchField').val()=="")
					return false;
				$('#searchWrap').empty();
				searchAjax(30,0);
		 }
	 });
	
	$(document).on('click','.itembox',function(){
		var a=$(this).find('#code').text().substring(1,$('#code').text().length-1);
		location.href='movie.do?movieSeq='+a;
	});
});

function searchAjax(listCount,startCount){
	$.ajax({
		type:'GET',
		dataType:'xml',
		url:'searchOpen.do?search='+$('#searchField').val()+'&detail=Y&listCount='+listCount+'&startCount='+startCount,
		success:viewMessage
	});
}

function viewMessage(data){
	var xmlData = $(data).find('Result');

	$(xmlData).find('Row').each(function(index){
		var actor="";	
		$(this).find('actorNm').each(function(index,value){
			if(index>2)
				return false;
			if(index==0)
				actor+=$(value).text().substring(1,$(value).text().length-1);
			else
				actor+=", "+$(value).text().substring(1,$(value).text().length-1);
		});
		
		$('#searchWrap').append('<div class="itembox"><ul>' +
				'<li id="image"><img src="'+$(this).find('posters').text().split('|')[0]+
				'"/></li><li id="title">'+$(this).find('title').text()+
				'</li><li id="subtitle">' +$(this).find('titleOrg').text()+
				'</li><li id="pubDate">' +$(this).find('prodYear').text()+
				'</li><li id="director">' +$(this).find('directorNm').text()+
				'</li><li id="actor">' +actor+
				'</li><li id="code" style="display:none;">' +$(this).find('movieSeq').text()+
				'</li></ul></div>');
		});

	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});
}//end viewMessage