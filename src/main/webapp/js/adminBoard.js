$(document).ready(function(){
	$('#boardLikeBtn').on('click',function(){
		$('.boardWrap').empty();
		$.ajax({
			url: 'adminBoardList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=1',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>회원코드</th><th>영화코드</th><th>글제목</th>'
							+'<th>좋아요 수</th><th>공유 수</th><th>댓글 수</th><th>작성일자</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="board_class"><td>'+item.board_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.board_movie+'</td><td>'+item.board_subject+'</td><td>'+item.board_like+'</td>'
							+'<td>'+item.board_share+'</td><td>'+item.board_reply+'</td>';
							
					var now = moment(new Date());
					var board = moment(item.board_date);
					
					tcontent+='<td><span class="board_date">'+board.format("YYYY-MM-DD")+'</span></td>';
					
					tcontent+='<td><input type="hidden" value="'+item.board_num + '" name="board_num" />'							
							 +'<input type="button" value="보기" id="viewBtn" onclick="javascript:timelineNewWindow('+item.board_num+')"/>'
							 +'<input type="button" value="등록" id="enrollBtn" /></td></tr>';
				});
				
				$('.boardWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('#boardShareBtn').on('click',function(){
		$('.boardWrap').empty();
		$.ajax({
			url: 'adminBoardList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=2',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>회원코드</th><th>영화코드</th><th>글제목</th>'
							+'<th>좋아요 수</th><th>공유 수</th><th>댓글 수</th><th>작성일자</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="board_class"><td>'+item.board_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.board_movie+'</td><td>'+item.board_subject+'</td><td>'+item.board_like+'</td>'
							+'<td>'+item.board_share+'</td><td>'+item.board_reply+'</td>';
							
					var now = moment(new Date());
					var board = moment(item.board_date);
					
					tcontent+='<td><span class="board_date">'+board.format("YYYY-MM-DD")+'</span></td>';
					
					tcontent+='<td><input type="hidden" value="'+item.board_num + '" name="board_num" />'							
							 +'<input type="button" value="보기" id="viewBtn" onclick="javascript:timelineNewWindow('+item.board_num+')"/>'
							 +'<input type="button" value="등록" id="enrollBtn" /></td></tr>';
				});
				
				$('.boardWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('#boardReplyBtn').on('click',function(){
		$('.boardWrap').empty();
		$.ajax({
			url: 'adminBoardList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=3',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>회원코드</th><th>영화코드</th><th>글제목</th>'
							+'<th>좋아요 수</th><th>공유 수</th><th>댓글 수</th><th>작성일자</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="board_class"><td>'+item.board_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.board_movie+'</td><td>'+item.board_subject+'</td><td>'+item.board_like+'</td>'
							+'<td>'+item.board_share+'</td><td>'+item.board_reply+'</td>';
							
					var now = moment(new Date());
					var board = moment(item.board_date);
					
					tcontent+='<td><span class="board_date">'+board.format("YYYY-MM-DD")+'</span></td>';
					
					tcontent+='<td><input type="hidden" value="'+item.board_num + '" name="board_num" />'							
							 +'<input type="button" value="보기" id="viewBtn" onclick="javascript:timelineNewWindow('+item.board_num+')"/>'
							 +'<input type="button" value="등록" id="enrollBtn" /></td></tr>';
				});
				
				$('.boardWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('#boardDateBtn').on('click',function(){
		$('.boardWrap').empty();
		$.ajax({
			url: 'adminBoardList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=4',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>회원코드</th><th>영화코드</th><th>글제목</th>'
							+'<th>좋아요 수</th><th>공유 수</th><th>댓글 수</th><th>작성일자</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="board_class"><td>'+item.board_num+'</td><td>'+item.user_code+'</td>'
							+'<td>'+item.board_movie+'</td><td>'+item.board_subject+'</td><td>'+item.board_like+'</td>'
							+'<td>'+item.board_share+'</td><td>'+item.board_reply+'</td>';
							
					var now = moment(new Date());
					var board = moment(item.board_date);
					
					tcontent+='<td><span class="board_date">'+board.format("YYYY-MM-DD")+'</span></td>';
					
					tcontent+='<td><input type="hidden" value="'+item.board_num+'" name="board_num" />'							
							 +'<input type="button" value="보기" id="viewBtn" onclick="javascript:timelineNewWindow('+item.board_num+')"/>'
							 +'<input type="button" value="등록" id="enrollBtn" /></td></tr>';
				});
				
				$('.boardWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$(document).on('click','#enrollBtn',function(){
		$('.board_enroll').remove();
		var board_num = $(this).siblings('[name=board_num]').val();
		var tstart='<tr class="board_enroll"><td colspan="9">';
		var tend='</td></tr>';
		var tcontent='<div class="linkArea"><input type="radio" name="link_type" value="1" checked="checked">TOP'
					+'<input type="radio" name="link_type" value="2">BOTTOM</div>'
					+'<div class="locationArea"><input type="radio" name="location" value="1" checked="checked">1번'
					+'<input type="radio" name="location" value="2">2번<input type="radio" name="location" value="3">3번'
					+'<input type="radio" name="location" value="4">4번<input type="radio" name="location" value="5">5번'
					+'<input type="radio" name="location" value="6">6번</div>'
					+'<div class="btnArea"><input type="button" value="게시하기" onclick="updateLink(this,'+board_num+')"></div>';
		$(this).parents('tr').after(tstart+tcontent+tend);
	});
});

function timelineNewWindow(board_num) {
	window.open('timelineDetail.do?board_num='+board_num,'게시글 확인');
}

function updateLink(target, board_num) {
	var input_link = document.getElementsByName('link_type');
	var link_type;
	for(var i=0; i<input_link.length; i++) {
	    if(input_link[i].checked) {
	        link_type = input_link[i].value;
	    }
	}
	
	var input_location = document.getElementsByName('location');
	var location;
	for(var i=0; i<input_location.length; i++) {
	    if(input_location[i].checked) {
	    	location = input_location[i].value;
	    }
	}
	
	$.ajax({
		url: 'adminLinkUpdate.do',
		type: 'GET',
		dataType: 'text',
		data: 'link_type='+link_type+'&location='+location+'&board_num='+board_num,
		success: function(res) {
			if(res){
				alert('게시 완료');
				location.reload();
			} else {
				alert('게시 실패');
			}
		}
	});
}