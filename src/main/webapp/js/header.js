$(document).ready(function(){	
	//자동검색창 크기조절
	$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
		'left':$('#searchField').offset().left+'px'});
	//창크기 변화시 자동검색창 크기조절
	$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
		'left':$('#searchField').offset().left+'px',
		'width':$('#searchField').width()+'px'});
	$(window).on('resize',function(){
		$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
			'left':$('#searchField').offset().left+'px',
			'width':$('#searchField').width()+'px'});
	});
	
	//search.do가 아닌곳에서 검색버튼 클릭시
	var url=window.location.href;
	$('#searchbtn').click(function(){
		if(!(window.location.href.indexOf("search.do")>=0))
			$('#searchLoc').val(url.slice(url.indexOf('/moons/') + 1, url.length));
			$('#searchFrm').submit();
			//location.href='search.do?value='+$('#searchField').val()+'&searchType='+$('#searchType option:selected').val();
	});
	 $('#searchField').on('keypress',function(event){
		 if(event.keyCode==13){
			if($('#searchField').val()=="")
					return false;
				
			if(!(window.location.href.indexOf("search.do")>=0)){
				//location.href='search.do?value='+$('#searchField').val()+'&searchType='+$('#searchType option:selected').val();
				$('#searchLoc').val(url.slice(url.indexOf('/moons/') + 7, url.length));
			}
			$('#searchFrm').submit();
		 }
	 });
	
	//자동완성:자동검색 이벤트  ajax 발생
	$('#searchField').on('keyup', function(){
		$('#suggest').css({'display':'inline'});
		
		if($('#searchField').val()==""){
			$('#suggest').css({'display':'none'});
			return false;
		}
			
		$.ajax({
			type:'GET',
			dataType:'xml',
			url:'searchMovieOpen.do?search='+$('#searchField').val()+'&listCount=4&startCount=0&detail=N',
			success:suggestMovieMessage
		});
		
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'searchUserOpen.do?search='+$('#searchField').val()+'&listCount=4&startCount=0',
			success:suggestUserMessage
		});
	});
	
	//body클릭시 자동검색창 가려짐
	$('body').on('click',function(){
		if($(this).attr('id')=='suggest')
			return false;
		$('#suggest').css({'display':'none'});
	});

});

	
function suggestMovieMessage(data){
	var xmlData = $(data).find('Result');
	
	$('#suggestMovie').empty();
	
	$(xmlData).find('Row').each(function(index){
		var ap='<div class="searchMovieBox"><div id="movieTitle">'+ $(this).find('title').text() +'<br/>';
		ap+='<input type="hidden" id="movieDirector" value="'+$(this).find('director').text()+'" /></div></div>';
		
		$(document).on('click','.searchBox',function(){
			location.href = 'movie.do?title='+$(this).find('#movieTitle').text()+'&director='+$(this).find('#movieDirector').val();
		});
		
		$('#suggestMovie').append(ap);
	}); 

	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});

}//end viewMessage

function suggestUserMessage(data){
	$('#suggestUser').empty();
	console.log('suggestuser');
	$.each(data, function(index, value){
		var st='<div class="searchUserBox">'
			+'<div id="image"><img src="'+value.user_photo+'"/></div>'
			+'<div id="userName">'+ value.user_nickname 
			+'&nbsp; <span id="userID"> @'+value.user_id +'</span></div>'
			+'<input type="hidden" id="userCode" value="'+value.user_code+'"/></div>';
		
		$(document).on('click','.searchUserBox',function(){
			location.href='timeline.do?user_code='+$(this).find('#userCode').val();
		});
		
		$('#suggestUser').append(st);
	}); 

	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});

}