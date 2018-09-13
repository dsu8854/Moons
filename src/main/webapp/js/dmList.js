$(document).ready(function() {
	$(document).on('click','.dmRoomBtn',function() {
		$(this).parent().attr('action', 'dmRoom.do').submit();
		return false;
	});
});