$(document).ready(function(){
	
	$(document).on('click', '.comSubBtn', function(){
		var insObj=$(this).parents('.comment_one');
		var board_num=insObj.children('#board_num');
		var reply_content=insObj.children('.reply_content');
		var user_nickname=insObj.children('.comUserNick');
		var reply_num=insObj.children('.reply_num');
		
		alert($(reply_num).val());
		$('[name=reply_content]').val($('[name=reply_content]').val().replace(/\n/gi, '<br/>'));
		
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'replyInsertList.do?board_num='+$(board_num).val()
				+'&reply_content='+$(reply_content).val()
				+'&user_nickname='+$('.comUserNick').text(),
			success: reply_list
		});
	});
	

	$(document).on('click','.replyBtn', function(){
		var togObj= $(this).parents('.comment_list').next();
		console.log(togObj);
		$(togObj).slideToggle(800);
		
	});
	
	/*댓글추가작업중*/
	$(document).on('click','.comRepBtn', function(){
		var reply_content=$(this).parents('.comment_rep').children('.reply_content');
		var reply_num=$(this).parents('.comment_rep').children('.reply_num');
		console.log(reply_content);
		console.log(reply_num);
		
		$.ajax({
			type: 'GET',
			dataType: 'text',
			url: 'replyInsertList.do?board_num='+$('#board_num').val()
			+'&reply_content='+$(reply_content).val()
			+'&user_nickname='+$('#comUserNickid').val()
			+'&reply_ref='+$(reply_num).val(),
			success: reply_list
		});
	});
	
	
	/*$('#comRepBtn').on('click', function(){
		$('[name=reply_content]').val($('[name=reply_content]').val().replace(/\n/gi, '<br/>'));
		
		var reply_content=$(this).parents('.comment_one').children('.reply_content');
		var reply_num=$(this).parents('.comment_one').children('.rep_num');
		
		$.ajax({
			type: 'GET',
			dataType: 'text',
			url: 'replyInsertList.do?board_num='+$('#board_num').val()
			+'&reply_content='+$(reply_content).val()
			+'&user_nickname='+$('#comUserNickid').val()
			+'&reply_num='+$(reply_num).val(),
			success: reply_list
		});
	});
	*/
});


function reply_list(res){
	/*현재로그인한사용자의 정보*/
	var user_code=$('#comment_user').val();
	/*var board_num=$('#board_num').val();*/
	var user_nickname=$('#comUserNickid').val();
	console.log(user_code);
	console.log(user_nickname);
	
	$('.reply_list').empty();
	/*$('#comment_count').text(res.length);*/
	
	$.each(res, function(index, value){
		var source="<li class='comment_one'>" +
					"<div class='comment_list'>"+
					"<div class='comUserPhoWrap'><img src='images/back.jpg' class='comUserPho'></div>"+
					"<div class='comUserNick'><span>"+value.user_nickname +"</span><span class='comDate'>"+value.reply_date +"</span></div>"+
					"<div class='comContWrap'><div class='comCont'>"+value.reply_content +"</div></div>"+
					"<div class='comRep'>" +
						"<input type='button' class='replyBtn' value='댓글'>"+
						"<input type='button' class='reportBtn' value='신고'></div></div>"+
					
					"<div class='comment_rep write1'>"+
					"<img class='repImg' src='images/re.gif'>"+
						"<input type='hidden' id='comment_user1' name='user_code1' value='"+user_code+"'>"+
						"<input type='hidden' id='board_num1' name='board_num1' value='"+value.board_num+"'>"+
						"<input type='hidden' class='reply_num' name='reply_num' value='"+value.reply_num+"' />"+
						"<div class='comUserPhoWrap'><img src='images/back.jpg' class='comUserPho'></div>"+
						"<div class='comUserNick'>"+user_nickname+"</div>"+
				
						"<textarea class='reply_content' name='reply_content1' placeholder='댓글로 자유롭게 이야기를 나누어 보세요!'></textarea>"+
						"<input class='comRepBtn' type='button' value='등록' >"+
					"</div></li>";
		
		$('.reply_list').append(source);
		
		$('.reply_content').val('');
	});
	
	/*
	$('.reply_list').empty();
	$('#comment_count').text(res.length);
	$.each(res, function(index, value){
		var source="<li class='comment_one'>"+
		"<div id='comUserPhoWrap'><img src='images/back.jpg' id='comUserPho'></div>"+
		"<div id='comUserNick'><span>"+value.user_nickname +"</span><span id='comDate'>"+value.replyDate +"</span></div>"+
		"<div id='comContWrap'><div id='comCont'>"+value.reply_content +"</div></div>";
	});
	*/
	
	
};


/*$(document).ready(function(){
	$('#comSubBtn').on('click', function(){
		//작성칸이 비어있을 경우 수행안함
		if($('#comWriteText').val()==''){
			return false;
		}
		
		alert('test');
		
		$.ajax({
			type:'GET',
			dataType: 'text',
			url: 'replyInsertList.do?'+
			'user_code=${userInfo.user_code }&reply_content='+$('#comWriteText').val(),
			success: commentIns
		});
		
	});
	
	
});

function commentIns(res){
	$('#comWriteText').empty();
	alert(res);
}

function reply_list(){
	
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url : 'replyInsertList.do',
		data: 'board_num=${bdto.board_num}&'+
		'user_code=${rdto.user_code}&'+
		'reply_content='+$('#comWriteText').val(),
		success:function(res){
			console.log(res);
		}
		
	});
	
}*/