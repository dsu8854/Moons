$(document).ready(function() {
	$('.follower_image').on('click',function(){
		$(this).next().attr('action','timeline.do').submit();
	});
	
	$('.followerCancelBtn').on('click', function() { // 팔로우 취소 버튼
		var wrap = $(this).parents('.wrap_content');
		if (confirm("정말로 팔로우를 취소하시겠습니까?") == true) {
			var formdata = $(this).parents('#followerForm').serialize();
			$.ajax({
				url: 'followDelete.do',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res) {
						btn.replaceWith('<input type="button" class="followerBtn" value="팔로우 신청" />');
					}
				}
			});
		}
		return false;
	});
	
	$('.followerBtn').on('click', function() { // 팔로우 신청 버튼
		var btn = $(this);
		if (confirm("정말로 팔로우를 신청하시겠습니까?") == true) {
			var formdata = $(this).parents('#followerForm').serialize();
			$.ajax({
				url: 'followApply.do',
				type: 'POST',
				dataType: 'text',
				data: formdata,
				success: function(res) {
					if(res) {
						btn.replaceWith('<input type="button" class="followerCancelBtn" value="팔로우 취소" />');
					}
				}
			});
		}
		return false;
	});
});