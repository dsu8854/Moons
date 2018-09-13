$(document).ready(function(){
	$('#memberPostBtn').on('click',function(){
		$('.memberWrap').empty();
		$.ajax({
			url: 'adminMemberList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=1',
			success: function(res) {
				var tstart = '<table id="member_table"><thead><tr><th>회원코드</th><th>닉네임</th><th>게시물 수</th><th>좋아요 수</th>'
							+'<th>공유 수</th><th>후원금액</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="member_class"><td>'+item.user_code+'</td><td>'+item.user_nickname+'</td>'
							+'<td>'+item.user_post+'</td><td>'+item.user_like+'</td><td>'+item.user_share+'</td><td>'+item.user_donate+'</td>';
							
					tcontent+='<td><input type="button" value="타임라인" id="viewBtn" onclick="javascript:timelineNewWindow('+item.user_code+')"/>';
				});
				
				$('.memberWrap').html(tstart+tcontent+tend);
				
				$('.memberWrap').append('<a id="excelBtn" href="" download="">내려받기</a>');
			}
		});
	});
	
	$('#memberLikeBtn').on('click',function(){
		$('.memberWrap').empty();
		$.ajax({
			url: 'adminMemberList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=2',
			success: function(res) {
				var tstart = '<table id="member_table"><thead><tr><th>회원코드</th><th>닉네임</th><th>게시물 수</th><th>좋아요 수</th>'
							+'<th>공유 수</th><th>후원금액</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="member_class"><td>'+item.user_code+'</td><td>'+item.user_nickname+'</td>'
							+'<td>'+item.user_post+'</td><td>'+item.user_like+'</td><td>'+item.user_share+'</td><td>'+item.user_donate+'</td>';
							
					tcontent+='<td><input type="button" value="타임라인" id="viewBtn" onclick="javascript:timelineNewWindow('+item.user_code+')"/>';
				});
				
				$('.memberWrap').html(tstart+tcontent+tend);
				
				$('.memberWrap').append('<a id="excelBtn" href="" download="">내려받기</a>');
			}
		});
	});
	
	$('#memberShareBtn').on('click',function(){
		$('.memberWrap').empty();
		$.ajax({
			url: 'adminMemberList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=3',
			success: function(res) {
				var tstart = '<table id="member_table"><thead><tr><th>회원코드</th><th>닉네임</th><th>게시물 수</th><th>좋아요 수</th>'
							+'<th>공유 수</th><th>후원금액</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="member_class"><td>'+item.user_code+'</td><td>'+item.user_nickname+'</td>'
							+'<td>'+item.user_post+'</td><td>'+item.user_like+'</td><td>'+item.user_share+'</td><td>'+item.user_donate+'</td>';
							
					tcontent+='<td><input type="button" value="타임라인" id="viewBtn" onclick="javascript:timelineNewWindow('+item.user_code+')"/>';
				});
				
				$('.memberWrap').html(tstart+tcontent+tend);
				
				$('.memberWrap').append('<a id="excelBtn" href="" download="">내려받기</a>');
			}
		});
	});
	
	$('#memberDonateBtn').on('click',function(){
		$('.memberWrap').empty();
		$.ajax({
			url: 'adminMemberList.do',
			type: 'GET',
			dataType: 'json',
			data: 'search_type=4',
			success: function(res) {
				var tstart = '<table id="member_table"><thead><tr><th>회원코드</th><th>닉네임</th><th>게시물 수</th><th>좋아요 수</th>'
							+'<th>공유 수</th><th>후원금액</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="member_class"><td>'+item.user_code+'</td><td>'+item.user_nickname+'</td>'
							+'<td>'+item.user_post+'</td><td>'+item.user_like+'</td><td>'+item.user_share+'</td><td>'+item.user_donate+'</td>';
							
					tcontent+='<td><input type="button" value="타임라인" id="viewBtn" onclick="javascript:timelineNewWindow('+item.user_code+')"/>';
				});
				
				$('.memberWrap').html(tstart+tcontent+tend);
				
				$('.memberWrap').append('<a id="excelBtn" href="" download="">내려받기</a>');
			}
		});
	});
	
	$(document).on("click",'#excelBtn',function () {
		var uri = $("#member_table").excelexportjs({
            containerid: "member_table"
            , datatype: 'table'
            , returnUri: true
        });

        $(this).attr('download', 'member.xls').attr('href', uri).attr('target', '_blank');
	});
});

function timelineNewWindow(user_code) {
	window.open('timeline.do?user_code='+user_code,'활동내역 확인');
}