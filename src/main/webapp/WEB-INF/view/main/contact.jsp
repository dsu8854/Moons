<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonS 오시는길</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30e6344acdd6f3fdbf8867992864a359"></script>
</head>
<body>
<div class="map_wrap">

<div id="map"

style="width: 1900px; height: 800px; position: relative; overflow: hidden;"></div>

<div class="hAddr">

<span class="title">MoonS 오시는길</span> <span id="centerAddr"></span>

</div>

</div>

<div style="height: 300px"></div>

<div>

<h6 id="result"></h6>
<br>
</div>
<script src="/js/jquery.min.js"></script>

<script type="text/javascript"

src="//apis.daum.net/maps/maps3.js?apikey=30e6344acdd6f3fdbf8867992864a359&libraries=services"></script>

<script>

/* var center = new daum.maps.LatLng(33.450701, 126.570667); */

var center = new daum.maps.LatLng(37.543693, 126.901555);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = {

center : center, // 지도의 중심좌표

level : 4

// 지도의 확대 레벨

};



// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다

var map = new daum.maps.Map(mapContainer, mapOption);

var places = new daum.maps.services.Places();



// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다

daum.maps.event.addListener(map, 'center_changed', function() {



// 지도의  레벨을 얻어옵니다

var level = map.getLevel();



// 지도의 중심좌표를 얻어옵니다 

var latlng = map.getCenter();


var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 '
+ latlng.getLng() + '입니다</p>';

var resultDiv = document.getElementById('result');

resultDiv.innerHTML = message;
center = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());
places.categorySearch($("#select").val(), callback, {

location : center

});

});

var geocoder = new daum.maps.services.Geocoder();



var positions = [];

//주변 정보 중심좌표는 location에 따름

var callback = function(status, result, pagination) {

if (status === daum.maps.services.Status.OK) {

positions = result.places;



callMarker(positions);

}

};



//마커를 담을 배열

var markers = [];

// 마커 이미지의 이미지 주소입니다

var imageSrc = "images/markerStar.png";

var callMarker = function(positions) {

removeMarker();

// 마커 이미지의 이미지 크기 입니다

var imageSize = new daum.maps.Size(24, 35);

var markerImage;

var posx;

var posy;

var marker;

var iwContent;



for (var i = 0; i < positions.length; i++) {

if ((positions[i].category.indexOf('계곡') != -1

&& positions[i].title.indexOf('골') != -1)

|| positions[i].category.indexOf('저수지') != -1) {

//계곡이면서 골 이라는 글자가 포함되있다면 , 다음걸로 넘어감 , 저수지여도 넘어감

continue;

}

// 마커 이미지를 생성합니다    

markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);



// 마커를 생성합니다

posx = positions[i].latitude;

posy = positions[i].longitude;



marker = new daum.maps.Marker({

map : map, // 마커를 표시할 지도

clickable : true,

position : new daum.maps.LatLng(posx, posy), // 마커를 표시할 위치

title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다

// 마커 이미지 

});



iwContent = iwRemoveable = true;

// 마커에 표시할 인포윈도우를 생성합니다 

if (positions[i].imageUrl == "") {

positions[i].imageUrl = 'http://www.moaksanjujo.kr/planweb/images/mall/defaultGoods.jpg';

}

var infowindow = new daum.maps.InfoWindow(

{

removable : iwRemoveable,

content : '<div id='+i+' class>'

+ '    <div class="info">'

+ '        <div class="title" name='+positions[i].title+'>'

+ positions[i].title

+ '        </div>'

+ '        <div class="body">'

+ '            <div class="img">'

+ '                <img src="'+positions[i].imageUrl+'" width="73" height="70">'

+ '           </div>'

+ '            <div class="desc">'

+ '                <div class="jibun ellipsis">'

+ positions[i].address

+ '</div>'
+ '                <div><input type="button" id="'
+ i
+ '" value="선택하기"  onclick=buttonclick(this)></div>'
+ '            </div>' + '        </div>'
+ '    </div>' + '</div>'
// 인포윈도우에 표시할 내용
});

daum.maps.event.addListener(marker, 'click', makeOverListener(
map, marker, infowindow));
markers.push(marker);
}
}
function makeOverListener(map, marker, infowindow) {
return function() {
infowindow.open(map, marker);
}
}
//마커지우기
function removeMarker() {
for (var i = 0; i < markers.length; i++) {
markers[i].setMap(null);
}
markers = [];
}
var marker = new daum.maps.Marker({
	position:map.getCenter()
});

marker.setMap(map);

daum.maps.event.addListener(daumMap, 'click', function(mouseEvent) {
    console.log("mouseEvent = " + mouseEvent);
    // null 이면...
    if(!myPositionMarker){
        // 마커를 생성합니다
        myPositionMarker = new daum.maps.Marker({
            position: mouseEvent.latLng
        });

        myPositionMarker.setImage(makeMyMarkerImage());
        // 마커가 지도 위에 표시되도록 설정합니다
        myPositionMarker.setMap(daumMap);
    }else{
        myPositionMarker.setPosition(mouseEvent.latLng);
    }
    moveTo({lat:mouseEvent.latLng.bb ,lng:mouseEvent.latLng.ab });
});
//클릭한 지역의 좌표와 주소(법정 동)으로 콘솔로그에 출력 
var realX;
var realY;

var readAddr;

daum.maps.event.addListener(map, 'click', function(mouseEvent) {

searchDetailAddrFromCoords(mouseEvent.latLng, function(status,
result) {

if (status === daum.maps.services.Status.OK) {

realX = result[0].x;

realY = result[0].y;

readAddr = result[0].region;



console.log(realX);

console.log(realY);

console.log(readAddr);

}

});

});


// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다

var zoomControl = new daum.maps.ZoomControl();

map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


</script>


</body>
</html>