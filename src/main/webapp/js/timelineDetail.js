$(document).ready(function(){
	$('#deleteclick').on('click',function(){
		$('#boardForm').attr('action','deletePost.do').submit();
		return false;
	});
	
	$('#reportclick').on('click',function(){
		$('.reportArea').slideToggle(0);
		return false;
	});
	
	$('#reportBtn').on('click',function(){
		$('[name=report_reason]').val($('#report_reason').val());
		$('#boardForm').attr('action','reportPost.do').submit();
	});
	
	$('.cover_movie').on('click',function(){
		window.open($('.service_header').css('backgroundImage').split('"')[1],'사진 확인');
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
			success: function(res){
				if(res) {
					location.reload();
				} else {
					alert('댓글 작성 실패');
				}
			}
		});
	});
	

	$(document).on('click','.replyBtn', function(){
		var togObj= $(this).parents('.comment_list').next();
		$(togObj).slideToggle(0);
	});
	
	/*대댓글추가시*/
	$(document).on('click','.comRepBtn', function(){
		var reply_content=$(this).parents('.comment_rep').children('.reply_content');
		var reply_num=$(this).parents('.comment_rep').children('.reply_num');
		var reply_step=$(this).parents('.comment_rep').children('.reply_step');
		var reply_step_val = parseInt(reply_step.val())+1;
		
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'replyInsertList.do?board_num='+$('#board_num').val()
			+'&reply_content='+reply_content.val()
			+'&user_nickname='+$('#comUserNickid').val()
			+'&reply_ref='+reply_num.val()
			+'&reply_step='+reply_step_val,
			success: function(res){
				if(res) {
					location.reload();
				} else {
					alert('댓글 작성 실패');
				}
			}
		});
	});
	
	
	/*삭제버튼클릭시*/
	$(document).on('click','.repDeleteBtn',function(){
		var reply_num=$(this).parents('.comment_list').children('.rep_num');
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'replyDelete.do?reply_num='+$(reply_num).val()
			+'&board_num='+$('#board_num').val(),
			success: function(res){
				if(res) {
					location.reload();
				} else {
					alert('댓글 삭제 실패');
				}
			}
		});
		
	});
	
	/*수정버튼클릭시*/
	$(document).on('click','.repModifyBtn',function(){
		var comList=$(this).parents('.comment_list');
		var reply_num=comList.children('.rep_num');
		var reply_ref=comList.children('.ref_num');
		var btnObj=comList.children('.btnWrap');
		var modObj=comList.children('.comContWrap');
		var repCont=comList.children(".rep_cont");
		
		repCont.val(repCont.val().replace(/<br\s?\/?>/g, "\n"));
		var repContText=repCont.val();
		
		btnObj.remove();
		
		if(reply_num.val() != reply_ref.val()){
			modObj.html('<textarea class="reply_content" name="reply_content" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!" style="width: 580px">'+repContText+'</textarea><input class="cancelBtn" type="button" value="취소" ><input class="modSubBtn" type="button" value="등록" >');
		} else {
			modObj.html('<textarea class="reply_content" name="reply_content" placeholder="댓글로 자유롭게 이야기를 나누어 보세요!" style="width: 615px">'+repContText+'</textarea><input class="cancelBtn" type="button" value="취소" ><input class="modSubBtn" type="button" value="등록" >');
		}

		/*수정후 등록버튼 클릭시*/
		$(document).on('click', '.modSubBtn', function(){
			var modCont=$(this).siblings('.reply_content');
			
			$(modCont).val($(modCont).val().replace(/\n/gi, '<br/>'));
			
			$.ajax({
				type: 'GET',
				dataType: 'json',
				url: 'replyUpdate.do?reply_num='+$(reply_num).val()
				+'&reply_content='+modCont.val()
				+'&board_num='+$('#board_num').val(),
				success: function(res){
					if(res) {
						location.reload();
					} else {
						alert('댓글 수정 실패');
					}
				}
			});	
		});
		
		/*수정후 취소버튼 클릭시*/
		$(document).on('click', '.cancelBtn', function(){
			var comList=$(this).parents('.comment_list');
			$(this).parents('.comContWrap').html('<div class="comCont">'+repContText+'</div>');
			
			var source = "<div class='btnWrap'>"+
		 				 "<div class='editRep'>"+
		 				 "<input type='button' class='repModifyBtn' value='수정'>"+
		 				 "<input type='button' class='repDeleteBtn' value='삭제'>"+
		 				 "<input type='button' class='replyBtn' value='댓글'>"+
		 				 "</div>"+
		 				 "</div>";		

			comList.append(source);
		});
	});
	
	$('.like_icon').on('click', function(){
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
		} else if($('#isLike',icon).val()=='false'){
			$('#isLike',icon).val('true');
		}
	});
	
	$('.share_icon').on('click', function(){
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
		} else if($('#isShare',icon).val()=='false'){
			$('#isShare',icon).val('true');
		}
	});
	
	$('.scrap_icon').on('click', function(){
		var icon = this;
		
		var formdata = $('#scrapForm',icon).serialize();
		
		$.ajax({
			url: 'scrapPro.do?',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				if(!res){
					alert('스크랩 실패')
				} else {
					location.reload();
				}
			}
		});
		
		if($('#isScrap',icon).val()=='true') {
			$('#isScrap',icon).val('false');
		} else if($('#isScrap',icon).val()=='false'){
			$('#isScrap',icon).val('true');
		}
	});
	
	$(document).on('click','.comUserPho',function(){
		$(this).next().attr('action','timeline.do').submit();
	});
	
	$('#writer_photo').on('click',function(){
		$(this).next().attr('action','timeline.do').submit();
	});
	
	$('#copyclick').on('click',function(){
		$('#urlArea').text(window.location.href);
		$('#urlArea').select();
		document.execCommand('copy');
		alert('클립보드에 주소가 복사되었습니다. Ctrl + V 로 붙여넣기 하세요.');
		return false;
	});
	
	$('.time_tag').on('click',function(){
		return false;
	});
	
	$('#modifyclick').on('click',function(){
		$('#updateForm').attr('action','updatePost.do').submit();
		return false;
	});
});

function donateForm() {
	$('#donateForm').submit();
}

function followApply() {
	if (confirm("정말로 팔로우를 신청하시겠습니까?") == true) {
		var formdata = $('#followForm').serialize();
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
}

function followDelete() {
	if (confirm("정말로 팔로우를 취소하시겠습니까?") == true) {
		var formdata = $('#followForm').serialize();
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
}

function timelineHashtag(board_hashtag) {
	location.href = 'timelineHashtag.do?board_hashtag='+encodeURIComponent(board_hashtag);
}