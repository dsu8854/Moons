$(document).ready(function() {
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
						wrap.remove();
						$('#follow_list_label').text('팔로잉 : '+(parseInt($('#followCount').val())-1)+'명');
						$('#followCount').val(parseInt($('#followCount').val())-1);
					}
				}
			});
		}
		return false;
	});
});