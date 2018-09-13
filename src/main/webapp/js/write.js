$(document).ready(function(){
	var movie;
	var files;
	var count=0;
	
	$('#header_background_img').on('change',function(){
		files=this.files;
		var reader = new FileReader();
		reader.readAsDataURL(files[0]);
		sendFile(files[0],this);
	});
	
	$('#btn_delete').on('click', function(){ 
		$('.service_header').removeAttr('style');		
		$('.glyphicon').css({"color":"black"});		
		$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0)"});		
		$('.cover_title').css({"color":"black"});		
		$('.cover_subtitle').css({"color":"black"});
		$('[name=board_photo]').val('');
	});
		
		
	$("#upfile1").click(function(){
   	 	$("#header_background_img").trigger('click'); 	
	});
   
	$('#summernote').summernote({
		lang: 'ko-KR',
		height:500,
		minheight: null,
		maxheight: null,
		focus:true,
		popover: {
			image: [['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
					['float', ['floatLeft', 'floatRight', 'floatNone']],
					['remove', ['removeMedia']]],
			link: [['link', ['linkDialogShow', 'unlink']]],
			air: [['color', ['color']],
				  ['font', ['bold', 'underline', 'clear']],
				  ['para', ['ul', 'paragraph']],
				  ['table', ['table']],
				  ['insert', ['link', 'picture']]]},
		dialogsFade: true,
		callbacks:{
			onImageUpload: function(files, editor, welEditable){
				for(var i=files.length-1;i>=0;i--){
					sendFile(files[i],this);
				}
			}
		}
	});
			
	//수정시 영화정보
	if($('#board_movie').val()!=''){
		var movie=$('#board_movie').val().split('*')[0];
		var director=$('#board_movie').val().split('*')[1];
		console.log($('#board_movie').val());
		console.log(movie+','+director);
		$.ajax({
			type:'GET',
			dataType:'xml',
			url:'searchMovieDirectorOpen.do?title='+movie+'&director='+director,
			success: function(xmlData){
				$(xmlData).find('Row').each(function(index) {	
					var actor = "";
					$(this).find('actorNm').each(function(index, value) {
						if (index > 2)
							return false;
						
						if (index == 0)
							actor += $(value).text().substring(1, $(value).text().length - 1);
						else
							actor += ", "+ $(value).text().substring(1, $(value).text().length - 1);
					});

					$('#choiceBox').css('display','none');
					$('#choiceMovie').find('img').attr('src', $(this).find('posters').text().split('|')[0]);
					var m= '<li id="movieInfo"><span id="movieTitle">'+ $(this).find('title').text()+'</span><br/>'
					+'<span id="movieSubTitle">'+$(this).find('titleOrg').text()+'</span><br/>'
					+'<span id="moviePubDate">'+$(this).find('prodYear').text()+'</span><br/>'
					+'<span id="movieDirector">'+$(this).find('directorNm').text()+'</span><br/>'
					+'<span id="movieActor">'+actor+'</span></li>';
					
					$(document.getElementsByTagName('img')).each(function(index, item) {
						if ($(item).attr('src') == "  ") {
							$(item).attr('src', 'images/noimage.png');
						}
					});
					
					movie=$(this).find('#title').text()+'*'+$(this).find('#director').text();
					$('.choiceMovieBox li:nth-of-type(2)').remove();
					$('#movieInfo').remove();
					$('.choiceMovieBox').append(m);
				});
			}
		});
	}
	
	//영화선택
	$('.choiceMovieBox').on('click',function(){
		if($('.choiceMovieBox').attr('id')=='boxOFF') 
			return false;
		$('#choiceBox').css('display','block');     
	});
	
	$('.closeBox').on('click',function(){
		$('#choiceBox').css('display','none');
		$('#resultBox').empty();
		$('#searchMovie').val('');
	});
	
	//자동완성:자동검색 이벤트  ajax 발생
	$('#searchMovie').on('keyup', function(){
		$('#resultBox').empty();
		if($('#searchMovie').val()==""){
			return false;
		}
		
		$.ajax({
			type:'GET',
			dataType:'xml',
			url:'searchMovieOpen.do?search='+$('#searchMovie').val()+'&listCount=12&startCount=0&detail=Y',
			success:choiceMovieMessage
		});
	});

	$(document).on('click','.itembox',function(){
		$('#choiceBox').css('display','none');
		$('#choiceMovie').find('img').attr('src',$(this).find('img').attr('src'));
		
		var m= '<li id="movieInfo"><span id="movieTitle">'+$(this).find('#title').text()+'</span><br/>'
			+'<span id="movieSubTitle">'+$(this).find('#subtitle').text()+'</span><br/>'
			+'<span id="moviePubDate">'+$(this).find('#pubDate').text()+'</span><br/>'
			+'<span id="movieDirector">'+$(this).find('#director').text()+'</span><br/>'
			+'<span id="movieActor">'+$(this).find('#actor').text()+'</span></li>';
		
		movie=$(this).find('#title').text()+'*'+$(this).find('#director').text();
		$('.choiceMovieBox li:nth-of-type(2)').remove();
		$('#movieInfo').remove();
		$('.choiceMovieBox').append(m);
	});
	
	$('#btnSave').on('click',function(){
		if($('#board_hashtag').text()!='') {
			var hashtag = $('#board_hashtag').text().split(' ');
			var isCorrect=true;
			$.each(hashtag,function(index,item){
				if(item.charAt(0)!='#'){
					alert('해시태그 형식이 올바르지 않습니다.(#해시태그1 #해시태그2...)');
					isCorrect=false;
					return false;
				} else if(item.match(/#/g)!=null) {
					if(item.match(/#/g).length > 1) {
						alert('해시태그 형식이 올바르지 않습니다.(#해시태그1 #해시태그2...)');
						isCorrect=false;
						return false;
					}
				}
			});
		
			if(!isCorrect){
				return false;
			}
		}
		
		$('[name=board_content]').val($('#summernote').summernote('code'));
		$('[name=board_subject]').val($('#board_subject_cover').text());
		if($('[name=board_photo]').val()=='') {
			if($('#choiceMovie').children('img').attr('src')!='images/noimage.png'){
				$('[name=board_photo]').val($('#choiceMovie').children('img').attr('src'));
			}
		}
		$('#board_subject_cover').attr('contenteditable','false');
		$('#cover_subtitle').attr('contenteditable','false');
		$('#board_hashtag').attr('contenteditable','false');
		$('#summernote_wrap').css('display','none');
		$('#hash_table').css('display','none');
		$('#board_content').css('display','block');
		$('#board_content').append($('#summernote').summernote('code'));
		$('.wrap_right_inner').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#background_img').css("display","none");
		$('#board_movie').val(movie);
		$('[name=board_hashtag]').val($('#board_hashtag').text());
		$('.choiceMovieBox').css('cursor','default');
		$('.choiceMovieBox').attr('id','boxOFF');
	});
		
	$('#btn_mody').click(function(){
		$('#wrap_right_inner_in').css("display","none");
		$('.wrap_right_inner_modi').css("display","inline");
		$('#board_subject_cover').attr('contenteditable','true');
		$('#cover_subtitle').attr('contenteditable','true');
		$('#board_hashtag').attr('contenteditable','true');
		$('#background_img').css("display","block");
		$('#summernote_wrap').css('display','block');
		$('#board_content').css('display','none');
		$('.choiceMovieBox').css('cursor','pointer');
		$('.choiceMovieBox').attr('id','boxON');
	});
	
	$('#btn_modyc').click(function(){
		$('[name=board_content]').val($('#summernote').summernote('code'));
		$('[name=board_subject]').val($('#board_subject_cover').text());
		if($('[name=board_photo]').val()=='') {
			if($('#choiceMovie').children('img').attr('src')!='images/noimage.png'){
				$('[name=board_photo]').val($('#choiceMovie').children('img').attr('src'));
			}
		}
		$('.wrap_right_inner_modi').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#board_subject_cover').attr('contenteditable','false');
		$('#cover_subtitle').attr('contenteditable','false');
		$('#board_hashtag').attr('contenteditable','false');
		$('#summernote_wrap').css('display','none');
		$('#board_content').css('display','block');
		$('#board_content').empty();
		$('#board_content').append($('#summernote').summernote('code'));
		$('.wrap_right_inner').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#background_img').css("display","none");
		$('#board_movie').val(movie);
		$('[name=board_hashtag]').val($('#board_hashtag').text());
		$('.choiceMovieBox').css('cursor','default');
		$('.choiceMovieBox').attr('id','boxOFF');
	});
	
	$('#btnPost').on('click',function(){
		if($('[name=board_photo]').val()==''){
			if($('#choiceMovie').find('img').attr('src')!='images/noimage.png')
				$('[name=board_photo]').val($('#choiceMovie').find('img').attr('src'));
		}
		if($('#board_movie').val()==''){
			alert('영화를 선택해 주세요');
			return false;
		}
		$('#postForm').attr('action','post.do').submit();
	});
	
	/*수정버튼 클릭시 적용되는 부분 여기만수정함*/
	$('#btnModPost').on('click',function(){
		if($('[name=board_photo]').val()==''){
			if($('#choiceMovie').find('img').attr('src')!='images/noimage.png')
				$('[name=board_photo]').val($('#choiceMovie').find('img').attr('src'));
		}
		if($('#board_movie').val()==''){
			alert('영화를 선택해 주세요');
			return false;
		}
		$('#postForm').attr('action','updatePost.do').submit();
	});
});

function choiceMovieMessage(data){
	var xmlData = $(data).find('Result');

	$(xmlData).find('Row').each(function(index) {	
		var actor = "";
		$(this).find('actorNm').each(function(index, value) {
			if (index > 2)
				return false;
			
			if (index == 0)
				actor += $(value).text().substring(1, $(value).text().length - 1);
			else
				actor += ", "+ $(value).text().substring(1, $(value).text().length - 1);
		});
		
		var str='<div class="itembox"><ul><li id="image"><img src="'
			+ $(this).find('posters').text().split('|')[0]+ '"/></li><li id="title">'
			+ $(this).find('title').text()+ '</li><li id="subtitle">'
			+ $(this).find('titleOrg').text()+ '</li><li id="pubDate">'
			+ $(this).find('prodYear').text()+ '</li><li id="director">'
			+ $(this).find('directorNm').text()+ '</li><li id="actor">'
			+ actor + '</li></ul></div>';
				
		$(document.getElementsByTagName('img')).each(function(index, item) {
			if ($(item).attr('src') == "  ") {
				$(item).attr('src', 'images/noimage.png');
			}
		});
		
		$('#resultBox').append(str);
	});
}

function sendFile(file,el){
	var form_data = new FormData();
	form_data.append('file',file);
	$.ajax({
		data: form_data,
		type: "POST",
		url:'uploadFile.do',
		cache:false,
		contentType:false,
		enctype:'multipart/form-data',
		async:false,
		processData:false,
		success:function(url){
			if($(el)[0]==$('#summernote')[0])
				$(el).summernote('editor.insertImage',"images/"+url);
			else {
				$('[name=board_photo]').val(url);
				$('.service_header').css({"background":"url('images/"+url+"') top fixed / 100% 100%"});
				$('.glyphicon').css({"color":"white"});
				$('.cover_title').css({"color":"white"});
				$('.cover_subtitle').css({"color":"white"});
				$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0.4)"});
				$('#header_background_img').val("");
			}
		}
	});
}