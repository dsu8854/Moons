$(document).ready(function() {
	$('.follow_image').on('click',function(){
		$(this).next().attr('action','timeline.do').submit();
	});
	
	$('.followBtn').on('click', function() { // 팔로우 신청 버튼
		var wrap = $(this).parents('.wrap_content');
		if (confirm("정말로 팔로우를 신청하시겠습니까?") == true) {
			var formdata = $(this).parents('#followForm').serialize();
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
		return false;
	});
	
	$('.followCancelBtn').on('click', function() { // 팔로우 취소 버튼
		var wrap = $(this).parents('.wrap_content');
		if (confirm("정말로 팔로우를 취소하시겠습니까?") == true) {
			var formdata = $(this).parents('#followForm').serialize();
			$.ajax({
				url: 'followDelete.do?',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res) {
						if($('[name=follow_following]').val()==$('#user_code')) {
							wrap.remove();
							$('#follow_list_label').text('팔로잉 : '+(parseInt($('#followCount').val())-1)+'명');
							$('#followCount').val(parseInt($('#followCount').val())-1);
						}
					}
				}
			});
		}
		return false;
	});
});