 $(document).ready(function () {
	 $(document).scrollTop(0);
	 
	 $(window).scroll(function () {
		 var height = $(document).scrollTop();
		 var first_d =$('#first_d');
		 
		 if(height<955) {
			 $('.intro-page__panel-snap-menu').children().attr('class','intro-page__panel-snap-menu-item')
			 $('#first').attr('class','intro-page__panel-snap-menu-item-active');
		 } else if(height>=955&&height<=1360){
			 $('.intro-page__panel-snap-menu').children().attr('class','intro-page__panel-snap-menu-item')
	         $('#second').attr('class','intro-page__panel-snap-menu-item-active');
		 }else{
			 $('.intro-page__panel-snap-menu').children().attr('class','intro-page__panel-snap-menu-item')
	         $('#third').attr('class','intro-page__panel-snap-menu-item-active');
		 }
	 }); 
     
	 $(".intro-page_section").each(function () {
                // 개별적으로 Wheel 이벤트 적용
		 var delta = 0;
		 var count = 1;
		 var moveTop = null;

		 $(this).on("mousewheel DOMMouseScroll", function (e) {
			 e.preventDefault();
			 if (!event) event = window.event;
			 if (event.wheelDelta) {
				 delta = event.wheelDelta / 120;
				 if (window.opera) delta = -delta;
             } else if (event.detail) delta = -event.detail / 3;
			 // 마우스휠을 위에서 아래로
			 if (delta < 0) {
				 if ($(this).next() != undefined) {
					 moveTop = $(this).next().offset().top;
				 }
				 // 마우스휠을 아래에서 위로
                 } else {
                	 if ($(this).prev() != undefined) {
                		 moveTop = $(this).prev().offset().top;
                     }
                 }
                    
                 // 화면 이동 0.8초(800)
                 $("html,body").stop().animate({
                	 scrollTop: moveTop + 'px'
                        
                    }, {
                        duration: 800, complete: function () {
                        }
                    
                    });
       
                });
                $('#first_d').on("click",function(){
                	moveTop=955;
                	console.log(moveTop);
                	 $("html,body").stop().animate({
                         scrollTop: moveTop + 'px'
                         
                     }, {
                         duration: 800, complete: function () {
                         }
                     
                     });
                });
                $('#second_d').on("click",function(){
                	moveTop=1910;
                	console.log(moveTop);
                	 $("html,body").stop().animate({
                         scrollTop: moveTop + 'px'
                         
                     }, {
                         duration: 800, complete: function () {
                         }
                     
                     });
                
                }); 
                $('#third_d').on("click",function(){
                	moveTop=0;
                	console.log(moveTop);
                	 $("html,body").stop().animate({
                         scrollTop: moveTop + 'px'
                         
                     }, {
                         duration: 800, complete: function () {
                         }
                     
                     }); 
                });
                
                $(first_d).mouseover(function(){
                	$(first_d).attr('class','glyphicon glyphicon-download white');
                });
                $(first_d).mouseleave(function(){
                	$(first_d).attr('class','glyphicon glyphicon-download');
                });
                $(second_d).mouseover(function(){
                	$(second_d).attr('class','glyphicon glyphicon-download white');
                });
                $(second_d).mouseleave(function(){
                	$(second_d).attr('class','glyphicon glyphicon-download');
                });
                $(third_d).mouseover(function(){
                	$(third_d).attr('class','glyphicon glyphicon-upload white');
                });
                $(third_d).mouseleave(function(){
                	$(third_d).attr('class','glyphicon glyphicon-upload');
                });
	 });
});