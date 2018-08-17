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
	$('#searchbtn').click(function(){
		if(!(window.location.href.indexOf("search.do")>=0))
			location.href='search.do?value='+$('#searchField').val();
	});
	 $('#searchField').on('keypress',function(event){
		 if(event.keyCode==13){
			if($('#searchField').val()=="")
					return false;
				
			if(!(window.location.href.indexOf("search.do")>=0))
				location.href='search.do?value='+$('#searchField').val();
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
			url:'searchOpen.do?search='+$('#searchField').val()+'&listCount=4&startCount=0&detail=N',
			success:suggestMessage
		});
	});
	
	//body클릭시 자동검색창 가려짐
	$('body').on('click',function(){
		if($(this).attr('id')=='suggest')
			return false;
		$('#suggest').css({'display':'none'});
	});

});

	
function suggestMessage(data){
	var xmlData = $(data).find('Result');
	
	$('#suggestMovie').empty();
	
	$(xmlData).find('Row').each(function(index){
		var ap='<div class="searchBox"><div id="movieTitle">'+ $(this).find('title').text() +'<br/>';
		ap+='<span id="code" style="display:none;">' +$(this).find('movieSeq').text();
		ap += '</div><div id="image"><img src="'+$(this).find('posters').text().split('|')[0]+'"/></div></div>';
		
		$(document).on('click','.searchBox',function(){
			var a=$(this).find('#code').text().substring(1,$('#code').text().length-1);
			console.log(a);
			location.href='movie.do?movieSeq='+a;
		});
		
		$('#suggestMovie').append(ap);
	}); 

	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});

}//end viewMessage