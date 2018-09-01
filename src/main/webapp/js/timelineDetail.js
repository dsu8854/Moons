$(document).ready(function(){
	$('#deleteclick').on('click',function(){
		$('#deleteForm').attr('action','deletePost.do').submit();
		return false;
	});
	
	/*첫번째댓글추가시*/
	$(document).on('click', '.comSubBtn', function(){
		var insObj=$(this).parents('.comment_one');
		var board_num=insObj.children('#board_num');
		var reply_content=insObj.children('.reply_content');
		var user_nickname=insObj.children('.comUserNick');
		var reply_num=insObj.children('.reply_num');
		
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
		$(togObj).slideToggle(800);
		
	});
	
	/*대댓글추가시*/
	$(document).on('click','.comRepBtn', function(){
		var reply_content=$(this).parents('.comment_rep').children('.reply_content');
		var reply_num=$(this).parents('.comment_rep').children('.reply_num');
		var reply_step=$(this).parents('.comment_rep').children('.reply_step');
		
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'replyInsertList.do?board_num='+$('#board_num').val()
			+'&reply_content='+$(reply_content).val()
			+'&user_nickname='+$('#comUserNickid').val()
			+'&reply_ref='+$(reply_num).val()
			+'&reply_step='+parseInt($(reply_step).val())+1,			
			success: reply_list
		});
	});
	
});

function reply_list(res){
	/*현재로그인한사용자의 정보*/
	var user_code=$('#comment_user').val();
	var user_nickname=$('#comUserNickid').val();
	
	$('.reply_list').empty();
	
	$.each(res, function(index, value){
		var source="<li class='comment_one'>" +
					"<div class='comment_list'>"
					
					if(value.reply_num != value.reply_ref){
						source+="<img class='repImg' src='images/re.gif'>";
					}
					
			source+="<div class='comUserPhoWrap'><img src='images/back.jpg' class='comUserPho'></div>"+
					"<div class='comUserNick'><span>"+value.user_nickname +"</span><span class='comDate'>"+value.reply_date +"</span></div>"+
					"<div class='comContWrap'><div class='comCont'>"+value.reply_content +"</div></div>"+
					"<div class='comRep'>" +
						"<input type='button' class='replyBtn' value='댓글'>"+
						"<input type='button' class='reportBtn' value='신고'></div></div>"+
					
					"<div class='comment_rep write1'>"+
					"<img class='repImg' src='images/re.gif'>"+
						"<input type='hidden' class='reply_num' name='reply_num' value='"+value.reply_num+"' />"+
						"<div class='comUserPhoWrap'><img src='images/back.jpg' class='comUserPho'></div>"+
						"<div class='comUserNick'>"+user_nickname+"</div>"+
				
						"<textarea class='reply_content' name='reply_content1' placeholder='댓글로 자유롭게 이야기를 나누어 보세요!'></textarea>"+
						"<input class='comRepBtn' type='button' value='등록' >"+
					"</div></li>";
		
		$('.reply_list').append(source);
		
		$('.reply_content').val('');
	});
};