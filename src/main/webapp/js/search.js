$(document).ready(function() {

	if($('#prevLoc').val().indexOf('genre')>0){
		$('#searchWrap').append('<span id="findGenre"><b>'+$('#prevLoc').val().split('=')[1]+ '</b> 장르의 작품을 찾으셨나요? </span><br/><br/>');
		searchAjax('genre', 30, 0);
	}
	
	if($('#searchVal').val()!=""){
		$('#searchField').val($('#searchVal').val());
	}
	
	var type=$('#typeVal').val();
	if(type=='movie'){
		$('#searchType option:eq(0)').prop('selected', true);
	} else if(type=='director'){
		$('#searchType option:eq(1)').prop('selected', true);
	} else if(type=='user'){
		$('#searchType option:eq(2)').prop('selected', true);
	}
	
	if($('#searchVal').val()!=""){
		console.log("search");
		searchAjax(type, 30, 0);
	}

	// 스크롤시 영화 30개 더 로딩
	var start = 0;
	$(window).scroll(function() {
		if ($(window).scrollTop() >= $(document).height()- $(window).height()) {
			start += 30;
			if($('#prevLoc').val().indexOf('genre')>0)
				searchAjax('genre', 30, start);
			else
				searchAjax(type, 30, start);
			console.log(start);
		}
	});
	
	// 소메뉴
	var liprev=$('.searchMenu li:nth-of-type('+($('#searchType option:selected').index()+1)+')');
	var licurr;
	liprev.css({
		'border-bottom' : '3px solid #33cccc'
	});
	$('li').on('click', function() {
		$('li').css({'border-bottom' : '0px solid #33cccc'});
		$(this).css({'border-bottom' : '3px solid #33cccc'});
		
		$('#searchWrap').empty();
		searchAjax($(this).attr('value'), 30, 0);
		
		if($(this).attr('value')=='movie'){
			$('#searchType option:eq(0)').prop('selected', true);
		} else if($(this).attr('value')=='director'){
			$('#searchType option:eq(1)').prop('selected', true);
		} else if($(this).attr('value')=='user'){
			$('#searchType option:eq(2)').prop('selected', true);
		}
	});
	
	$('#searchbtn').click(function() {
		// 검색키워드 없을시 이벤트발생 안됨
		if ($('#searchField').val() == "")
			return false;
		$('#searchWrap').empty();
		searchAjax(type, 30, 0);
	});

	$('#searchField').on('keypress', function(event) {
		if (event.keyCode == 13) {
			if ($('#searchField').val() == "")
				return false;
			$('#searchWrap').empty();
			searchAjax(type, 30, 0);
		}
	});

	$(document).on('click','.itembox', function() {
		var title = $(this).find('#title').text();//.substring(1, $('#title').text().length - 1);
		var director = $(this).find('#director').text();//.substring(1, $('#director').text().length - 1);
		console.log($('#director').text().length);
		console.log(title+','+director);
		location.href = 'movie.do?title='+title+'&director='+director;
	});
	
	$(document).on('click','#followApplyBtn', function() { // 팔로우 신청 버튼
		if (confirm("정말로 팔로우를 신청하시겠습니까?") == true) {
			var formdata = $(this).siblings('#followForm').serialize();
			$.ajax({
				url: 'followApply.do',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res) {
						location.reload();
					}
				}
			});
		}
	});
	
	$(document).on('click','#followDeleteBtn', function() { // 팔로우 신청 버튼
		if (confirm("정말로 팔로우를 취소하시겠습니까?") == true) {
			var formdata = $(this).siblings('#followForm').serialize();
			$.ajax({
				url: 'followDelete.do',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res) {
						location.reload();
					}
				}
			});
		}
	});
	
	$(document).on('click','#dmBtn', function() { // 팔로우 신청 버튼
		$(this).siblings('#dmForm').attr('action','dmRoom.do').submit();
	});
});

function searchAjax(type, listCount, startCount) {
	if(type=='movie'){
		$.ajax({
			type : 'GET',
			dataType : 'xml',
			url : 'searchMovieOpen.do?search='+$('#searchField').val()+ '&detail=Y&listCount=' + listCount + '&startCount=' + startCount,
			success : movieSuccessMessage
		});
	} else if(type=='director'){
		$.ajax({
			type : 'GET',
			dataType : 'xml',
			url : 'searchDirectorOpen.do?search='+$('#searchField').val()+'&listCount=' + listCount + '&startCount=' + startCount,
			success : diretorSuccessMessage
		});
	} else if(type=='user'){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'searchUserOpen.do?search='+$('#searchField').val()+'&listCount=' + listCount + '&startCount=' + startCount,
			success : userSuccessMessage
		});
	} else if(type=='genre'){
		$.ajax({
			type : 'GET',
			dataType : 'xml',
			url : 'searchGenreOpen.do?search='+$('#prevLoc').val().split('=')[1]+'&listCount=' + listCount + '&startCount=' + startCount,
			success : genreSuccessMessage
		});
	}
	
}

function movieSuccessMessage(data) {
	var xmlData = $(data).find('Result');

	$(xmlData).find('Row').each(function(index) {	
		var actor = "";
		$(this).find('actorNm').each(function(index, value) {
			if (index > 2)
				return false;
			
			if (index == 0)
				actor += $(value).text().substring(1, $(value).text().length - 1);
			else
				actor += ", "+ $(value).text().substring(1, $(value).text().length - 1);
		});
		
		var str='<div class="itembox"><ul><li id="image"><img src="'
			+ $(this).find('posters').text().split('|')[0]+ '"/></li><li id="title">'
			+ $(this).find('title').text()+ '</li><li id="subtitle">'
			+ $(this).find('titleOrg').text()+ '</li><li id="pubDate">'
			+ $(this).find('prodYear').text()+ '</li><li id="director">'
			+ $(this).find('directorNm').text()+ '</li><li id="actor">'
			+ actor + '</li><li id="code" style="display:none;">'
			+ $(this).find('movieSeq').text() + '</li></ul></div>';
				
		$(document.getElementsByTagName('img')).each(function(index, item) {
			if ($(item).attr('src') == "  ") {
				$(item).attr('src', 'images/noimage.png');
			}
		});
		
		$('#searchWrap').append(str);
	});
}// end viewMessage

function diretorSuccessMessage(data) {
	var xmlData = $(data).find('Result');

	$('#searchWrap').append('<span id="findDirector"><b>'+$('#searchField').val()+ '</b> 감독의 작품을 찾으셨나요? </span><br/><br/>');
	$(xmlData).find('Row').each(function(index) {
		var actor = "";
		$(this).find('actorNm').each(function(index, value) {
			if (index > 2)
				return false;
			
			if (index == 0)
				actor += $(value).text().substring(1, $(value).text().length - 1);
			else
				actor += ", "+ $(value).text().substring(1, $(value).text().length - 1);
		});
		
		var str='<div class="itembox"><ul><li id="image"><img src="'
			+ $(this).find('posters').text().split('|')[0]+ '"/></li><li id="title">'
			+ $(this).find('title').text()+ '</li><li id="subtitle">'
			+ $(this).find('titleOrg').text()+ '</li><li id="pubDate">'
			+ $(this).find('prodYear').text()+ '</li><li id="director">'
			+ $(this).find('directorNm').text()+ '</li><li id="actor">'
			+ actor + '</li><li id="code" style="display:none;">'
			+ $(this).find('movieSeq').text() + '</li></ul></div>';
				
		$(document.getElementsByTagName('img')).each(function(index, item) {
			if ($(item).attr('src') == "  ") {
				$(item).attr('src', 'images/noimage.png');
			}
		});
		
		$('#searchWrap').append(str);
	});

	$(document.getElementsByTagName('img')).each(function(index, item) {
		if ($(item).attr('src') == "  ") {
			$(item).attr('src', 'images/noimage.png');
		}
	});
}// end viewMessage

function userSuccessMessage(data) {
	$.each(data, function(index, value) {
		if($('#user_code').val()!=value.user_code){
			var str='<div class="userBox">';
		
			if(value.user_photo==null)
				str+='<img src="images/basic.png" id="userPhoto" /><br/>';
			else
				str+='<img src="images/'+value.user_photo+'" id="userPhoto" /><br/>';
			
			str+='<span id="userNickname">'+value.user_nickname+'</span><br/>'
				+'<span id="userID">@'+value.user_id+'</span><br/><br/>'
				+'<p id="userIntro">'+value.user_introduce+'</p><br/>';
		
			if(value.follow_check>0){
				str+='<input type="button" class="userBtn" id="followDeleteBtn" value="언팔로우"/>';
			}else{
				str+='<input type="button" class="userBtn" id="followApplyBtn" value="팔로우"/>';
			}
		
			str+='&nbsp;<input type="button" class="userBtn" id="dmBtn" value="쪽지"/>'
				+'<form id="followForm" method="post"><input type="hidden" value="'+value.user_code+'" name="follow_following"></form>'
				+'<form id="dmForm" method="post"><input type="hidden" value="'+value.user_code+'" name="dm_receiver"></form>'
				+'</div>';
		
			$('#searchWrap').append(str);
		}
	});
}// end viewMessage

function genreSuccessMessage(data) {
	var xmlData = $(data).find('Result');

	$(xmlData).find('Row').each(function(index) {
		var actor = "";
		$(this).find('actorNm').each(function(index, value) {
			if (index > 2)
				return false;
			
			if (index == 0)
				actor += $(value).text().substring(1, $(value).text().length - 1);
			else
				actor += ", "+ $(value).text().substring(1, $(value).text().length - 1);
		});
		
		var str='<div class="itembox"><ul><li id="image"><img src="'
			+ $(this).find('posters').text().split('|')[0]+ '"/></li><li id="title">'
			+ $(this).find('title').text()+ '</li><li id="subtitle">'
			+ $(this).find('titleOrg').text()+ '</li><li id="pubDate">'
			+ $(this).find('prodYear').text()+ '</li><li id="director">'
			+ $(this).find('directorNm').text()+ '</li><li id="actor">'
			+ actor + '</li><li id="code" style="display:none;">'
			+ $(this).find('movieSeq').text() + '</li></ul></div>';
				
		$(document.getElementsByTagName('img')).each(function(index, item) {
			if ($(item).attr('src') == "  ") {
				$(item).attr('src', 'images/noimage.png');
			}
		});
		
		$('#searchWrap').append(str);
	});

	$(document.getElementsByTagName('img')).each(function(index, item) {
		if ($(item).attr('src') == "  ") {
			$(item).attr('src', 'images/noimage.png');
		}
	});
}// end viewMessage