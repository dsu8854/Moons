/*var hostIndex = location.href.indexOf(location.host) + location.host.length;
var contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
*/
$(document).ready(function(){
	
	$('.follow_user').click(function(){				//  팔로우 취소 버튼 
		
		var num = $(this).prev().prev().text();			// 유저번호
		var num2 = $(this).prev().text();				// 팔로우 번호 
		
		 console.log(num);
		 console.log(num2);
		 
		 if(confirm("정말로 팔로우 취소하시겠습니까?")==true){
			
			 $.ajax({
					type:'POST',
					url:'followDelete.do',			// 삭제 컨트롤러 이동
					data:"num2="+num2,				// 팔로우 번호 옮겨주기
					// async: false,
					dataType:'text',
					success:function(res){
						alert(res);
						alert("삭제성공");
						
					}
					
				});
			}
		 else{
				return;
			}// IF(팔로우취소)
		 
			
		 
		 
		 
		 follow_submit
		 
		 $('.follow_submit').click(function(){				//  팔로우 취소 버튼 
				
				var num = $(this).prev().prev().text();			// 유저번호
				var num2 = $(this).prev().text();				// 팔로우 번호 
				
				 console.log(num);
				 console.log(num2);
				 
				 if(confirm("정말로 팔로우 신청하시겠습니까?")==true){
					
					 $.ajax({
							type:'GET',
							url:'follow.do',				// 팔로우 신청 컨트롤러 
							data:"num2="+num2,				// 팔로우 번호 옮겨주기
							// async: false,
							dataType:'text',
							success:function(res){
								alert(res);
								alert("삭제성공");
								
							}
							
						});
					}
				 else{
						return;
					}// IF(팔로우신청)
		 
		 });
		 
				 
		/*
		
		
		var div = $(this).next();			// 팝업창
		var num3 = $(this).parent().text();
		
		console.log(num3);
		$.ajax({
			type:'POST',
			url:'followConfirm.do',
			data:'num='+num+'&num2='+num2,
			dataType:'json',
			success:function(res){
				
				console.log(res.user_photo);
				console.log(res.user_nickname);
				console.log(res.user_introduce);
				
				$('.popLayer').empty();
				var poplist = ''
				poplist+='<div class="content_photo"> <img src="images/'+res.user_photo+'"/> </div>'
				poplist+='<div class="content_nickname">'+res.user_nickname+'</div>'
				poplist+='<div class="content_introduce">'+res.user_introduce+'</div>'
				poplist+='<div class="content_button">'
				poplist+='<input type="submit" id="following_cancel" class="following_cancel" value="팔로우 취소" />'
				poplist+='<input type="button" id="cancel" class="cancel" value="취소" /></div>'
				poplist+='<div id ="user_code2">${followConfirm.user_code}</div>'
				
				$('.popLayer').append(poplist);
				
				div.toggle();
				div
				.css("position","absolute")
				.css("top", Math.max(0, (($(window).height() - div.outerHeight()) / 2) + $(window).scrollTop()) + "px")
				.css("left", Math.max(0, (($(window).width() - div.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
				i=0;
					
			},error:function(error){
				location.href="follow.do"; 
			}
			
			
		});
		*/
		
		});
		
	
	
});

/*$(document).on("click",'.cancel',function(){		// 삭제
	
	$('.popLayer').hide();
});

$(document).on("click",'.following_cancel',function(){		// 삭제
	var div1 = $(this).parent().parent().prev().prev().prev().text();
	var div2 = $(this).parent().parent().prev().prev().text();
	//var div1 = $(".session_user").text();
	//var div2 = $(".content_user_code").text();
	
	
	
	console.log(div1);
	console.log(div2);
	
	if(confirm("정말 팔로우를 삭제하시겠습니까?")==true){
	
		$.ajax({
			type:'POST',
			url:'followDelete.do',
			data:'num1='+div2,
			async: false,
			dataType:'text',
			success:function(res){
				
				alert("삭제 성공");
				
				// location.href="follow.do";
				
			},
			error:function(error){
				alert("삭제되지 않았습니다.");
				
				// location.href="follow.do";
				
				
			}	
		});
	}else{
		return;
	}
	
	
	});
	*/


