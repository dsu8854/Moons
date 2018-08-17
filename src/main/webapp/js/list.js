$(document).ready(function() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
	
		$.ajax({
			url:contextPath+'/listAdd.do?bnum=0',
			dataType:'text',
			success:function(res){
				$('.bodyWrap').append(res);
			}
		});
		
		$(window).scroll(function() {
			var scrollHeight = $(document).height();
			var scrollPosition = $(window).height() + $(window).scrollTop();
			if ((scrollHeight - scrollPosition)/ scrollHeight === 0) {
				var bnum = $('.board:last-child').children('[name=bnum]').val();
				console.log(bnum);
				$.ajax({
					url:contextPath+'/listAdd.do?bnum='+bnum,
					dataType:'text',
					success:function(res){
						setTimeout(function(){
							$('.bodyWrap').append(res);
						},500);
					}
				});
			}
		});
		
		$('.bodyWrap').on('click','.replyAdd',function(event){
			var target = $(event.target);
			console.log(target);
			var bnum = target.parents('.board').children('[name=bnum]').val();
			var rnum = target.parents('.reply').children('ul').children('li:last-child').children('[name=rnum]').val();
			$.ajax({
				url:contextPath+'/replyAdd.do?bnum='+bnum+'&rnum='+rnum,
				dataType:'text',
				success:function(res){
					target.parents('.reply').children('ul').append(res)
				}
			});
			return false;
		});
	});