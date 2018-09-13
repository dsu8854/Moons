$(document).ready(function(){	
	$('#unProRepBtn').on('click',function(){
		$('.reportWrap').empty();
		$.ajax({
			url: 'adminReportCount.do',
			type: 'GET',
			dataType: 'json',
			data: 'report_state=1',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>신고건수</th><th>처리</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="report_class"><td>'+item.board_num+'</td><td>'+item.report_count+'</td>'
							+'<td><input type="button" value="삭제" id="accBtn" />'
							+'<input type="button" value="보류" id="rejBtn" />'
							+'<input type="button" value="링크" id="linkBtn" />'
							+'<form><input type="hidden" value="'+item.board_num + '" name="board_num" />'
							+'<input type="hidden" name="report_state" /></form></td></tr>'
							+'<tr class="report_content"><td colspan="3"><div class="contentWrap"></div></td></tr>';
				});
				
				$('.reportWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('.reportWrap').on('click','.report_class',function(){
		var report_content = $(this).next();
		var contentWrap = report_content.find('.contentWrap');
		var form = $(this).find('form');
		form.children('[name=report_state]').val(1);
		var formData = form.serialize();
		$.ajax({
			url: 'adminReportList.do',
			type: 'GET',
			dataType: 'json',
			data: formData,
			success: function(res) {
				report_content.slideToggle(0);
				contentWrap.empty();
				$.each(res,function(index,item){
					var report_date = moment(item.report_date);
					contentWrap.append('<div class="report_detail"><div style="text-align:left;">'
											+'<span style="float:right;">'+report_date.format('YYYY-M-DD')+'</span></div>'
											+'<div style="text-align:left;"><span>'+item.report_reason+'</span></div></div>');
				});
			}
		});
	});
	
	$('.reportWrap').on('click','#accBtn',function(){
		var form = $(this).siblings('form');
		form.children('[name=report_state]').val(2);
		form.attr('action','adminReportUpdate.do').submit();
	});
	
	$('.reportWrap').on('click','#rejBtn',function(){
		var form = $(this).siblings('form');
		form.children('[name=report_state]').val(3);
		form.attr('action','adminReportUpdate.do').submit();
	});
	
	$('.reportWrap').on('click','#linkBtn',function(){
		var board_num = $(this).siblings('form').children('[name=board_num]').val();
		timelineNewWindow(board_num);
	});
	
	$('#accRepBtn').on('click',function(){
		$('.reportWrap').empty();
		$.ajax({
			url: 'adminReportCount.do',
			type: 'GET',
			dataType: 'json',
			data: 'report_state=2',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>신고건수</th><th>처리상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="report_class"><td>'+item.board_num+'</td><td>'+item.report_count+'</td>'
							+'<td>삭제 완료 <input type="button" value="복원" id="resBtn" />'
							+'<form><input type="hidden" value="'+item.board_num + '" name="board_num" />'
							+'<input type="hidden" name="report_state" value="3" /></form></td></tr>';
				});
				
				$('.reportWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('.reportWrap').on('click','#resBtn',function(){
		var form = $(this).siblings('form');
		form.attr('action','adminReportUpdate.do').submit();
	});

	$('#rejRepBtn').on('click',function(){
		$('.reportWrap').empty();
		$.ajax({
			url: 'adminReportCount.do',
			type: 'GET',
			dataType: 'json',
			data: 'report_state=3',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>신고건수</th><th>처리상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="report_class"><td>'+item.board_num+'</td><td>'+item.report_count+'</td>'
							+'<td>보류</td></tr>';
				});
				
				$('.reportWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	$('#selfDelBtn').on('click',function(){
		$('.reportWrap').empty();
		$.ajax({
			url: 'adminReportCount.do',
			type: 'GET',
			dataType: 'json',
			data: 'report_state=4',
			success: function(res) {
				var tstart = '<table><thead><tr><th>글번호</th><th>신고건수</th><th>처리상태</th></tr></thead><tbody>';
				var tend = '</tbody></table>';
				var tcontent = '';
				
				$.each(res,function(index,item){
					tcontent += '<tr class="report_class"><td>'+item.board_num+'</td><td>'+item.report_count+'</td>'
							+'<td>본인삭제</td></tr>';
				});
				
				$('.reportWrap').html(tstart+tcontent+tend);
			}
		});
	});
	
	if($('#report_state').val()==2)
		$('#accRepBtn').trigger('click');
	else if($('#report_state').val()==3)
		$('#rejRepBtn').trigger('click');
	else if($('#report_state').val()==4)
		$('#selfDelBtn').trigger('click');
});

function timelineNewWindow(board_num) {
	window.open('timelineDetail.do?board_num='+board_num,'게시글 확인');
}