<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header2.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="pr" value="${result.pageResult}"/>
<c:set var="searchlist" value="${result.searchlist}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${root}/js/mainhref.js"></script>
<script src="${root}/js/sojaeji.js"></script>
<style>
	.customoverlay {position:relative;bottom:80px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>
<script>
function searchbydong() {
	document.getElementById("searchbydong").submit();
}
function searchbyapt() {
	document.getElementById("searchbyapt").submit();
}
$(document).ready(function(){
	
	// Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#searchpage').offset().top
    }, 'slow');
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=radio]").click(function(){
 
        if($("input[name=radio]:checked").val() == "1"){
            jQuery('#searchbydong').css("display", "block");
            jQuery('#searchbyapt').css("display", "none");
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name=radio]:checked").val() == "0"){
              jQuery('#searchbyapt').css("display", "block"); 
              jQuery('#searchbydong').css("display", "none"); 
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
    /* if("${apt}"){
    	$("input[name=radio]:checked").val(0);
    	jQuery('#searchbyapt').css("display", "block"); 
        jQuery('#searchbydong').css("display", "none");
    }else if("${dong}"){
    	$("input[name=radio]:checked").val(1);
    	jQuery('#searchbydong').css("display", "block");
        jQuery('#searchbyapt').css("display", "none");
    } */
});
</script>

<body>
  <div class="container" id="searchp">
   <h1 style="text-align:center"><kbd>실거래 정보 확인하기</kbd></h1>
    <div class="mt-3 md-3" id="searchpage">
      <h2>검색 형태</h2>
      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
    </div>
    <div class="row" style="justify-content: left; ">
    <div class="col-2">
    <input type="radio" id="dongradio" name="radio" value="1" checked="checked">
    <label for="dongradio">행정동으로 검색</label>
    </div>
    <div class="col-2">
	<input type="radio" id="aptradio" name="radio" value="0">
	<label for="aptradio">아파트로 검색</label>
	</div>
    </div>
    <form id="searchbydong" method="post" action="${root}/aptdeal/searchbydong">
    <div class="row mt-3" style=" justify-content: center;">
      <div class="col-md-2">
        <select class="form-control" name="sido1" id="sido1" style="font-size: 20px;"></select>
      </div>
      <div class="col-md-2">
        <select class="form-control" name="dong" id="dong" style="font-size: 20px;">
          <c:if test="${searchlist.size() != 0}">
          <option selected>${dong} </option>
          </c:if>
          <option>동으로 검색 </option>
          <option>사직동 </option>
          <option>내수동 </option>
          <option>견지동 </option>
          <option>효제동 </option>
          <option>명륜1가 </option>
          <option>명륜2가 </option>
          <option>창신동 </option>
          <option>숭인동 </option>
          <option>평창동 </option>
          <option>익선동 </option>
          <option>평동 </option>
          <option>홍파동 </option>
          <option>무악동 </option>
          <option>인의동 </option>
        </select>
      </div>
      <div class="col-md-2">
        <button class="btn btn-primary w-100 h-100" onclick="javascript:searchbydong();">검색</button>
      </div>
    </div>
    </form>
    <div align="center" style=" justify-content: center;">
    <form id="searchbyapt" style="display:none;"method="post" action="${root}/aptdeal/searchbyapt">
     <div class="d-flex">
     	<c:if test="${!empty apt}">
        <input width="30px" id="apt" name="apt" type="text" class="form-control" value="${apt}">
          </c:if>
     	<c:if test="${empty apt}">
        <input id="apt" name="apt" type="text" class="form-control" placeholder="아파트로 검색">
        </c:if>
        <button class="btn btn-primary w-100 h-100" onclick="javascript:searchbyapt();">검색</button>
      </div>
    </form>
    </div>

    <!-- 게시물 영역 start -->
    <div class="mt-3">
      <h2>실거래 정보</h2>
      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
    </div>
    <div class="row">
	    <div class="col-7">
	    <div id="map" style="width:100%;height:700px;"></div>
	    </div>
	    <div class="col-5">
		    <c:if test="${searchlist.size() != 0}">
		    <c:forEach var="deal" items="${searchlist}">
			  <div class="card-deck">
		      <div class="card">
		        <div class="card-body text-center">
		          <h5>${deal.aptname}</h5>
		          <p class="card-text">실거래금액 : ${deal.dealamount}원</p>
		          <p class="card-text">거래날짜 : ${deal.dealyear}.${deal.dealmonth}.${deal.dealday}</p>
		          <p class="card-text">건축년 : ${deal.dealyear}년</p>
		          <p class="card-text">면적 : ${deal.area} m^2</p>
		          
		          <!-- 즐겨찾기 추가 -->
          <form class="form-inline justify-content-end" action="${root}/interest/insert" method="post" id="searchform">
              <input class="form-control mr-sm-2" type="hidden" id="word" name="word"
              value="${deal.aptname}" >
              <input class="form-control mr-sm-2" type="hidden" id="userid" name="userid"
              value="${userinfo.userid}" >
              <span style="color:orange">관심 목록 &nbsp</span>
           <button class="btn btn-primary" id="AddInt">추가</button>
          </form>
          
		        </div>
		      </div>
		      </div>
			  	</c:forEach>
		   </c:if>
			<c:if test="${searchlist.size() == 0}">
			  <h2>옵션을 선택해주세요</h2>
			</c:if>
		  <!-- pagenation -->
		  <c:if test="${!empty dong}">
			<c:if test="${pr.count != 0}">
		            <nav style="margin:0 auto;">
		               <ul class="mt-2 pagination" style="justify-content: center; ">
					    <li class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
					    
					    	<a class="page-link" href="<c:if test="${pr.prev}">${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${pr.beginPage - 1}</c:if>">Previous</a></li>
					    	
					    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">	
						    <c:choose>
							    <c:when test="${i eq pr.pageNo}">
								    <li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
							    </c:when>
							    <c:otherwise>
								    <li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${i}">${i}</a></li>
							    </c:otherwise>
						    </c:choose>
					    </c:forEach>
					    <li class="page-item <c:if test="${not pr.next}">disabled</c:if>">
					    	<a class="page-link" href="<c:if test="${pr.next}">${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${pr.endPage + 1}</c:if>">Next</a></li>
				 		</ul>
		            </nav>
		        </c:if>
				</c:if>
				 		
			<c:if test="${empty dong}">
			<c:if test="${pr.count != 0}">
		            <nav style="margin:0 auto;">
		               <ul class="mt-2 pagination" style="justify-content: center; ">
					    <li class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
					    
					    	<a class="page-link" href="<c:if test="${pr.prev}">${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${pr.beginPage - 1}</c:if>">Previous</a></li>
					    	
					    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">	
						    <c:choose>
							    <c:when test="${i eq pr.pageNo}">
								    <li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
							    </c:when>
							    <c:otherwise>
								    <li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${i}">${i}</a></li>
							    </c:otherwise>
						    </c:choose>
					    </c:forEach>
					    <li class="page-item <c:if test="${not pr.next}">disabled</c:if>">
					    	<a class="page-link" href="<c:if test="${pr.next}">${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${pr.endPage + 1}</c:if>">Next</a></li>
				 		</ul>
		            </nav>
		        </c:if>
				</c:if>
		  <!-- pagenation -->
			</div>
		  <!-- 게시물 영역 -->
		
	    </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eef4c8cb26c2d520c80149b4197661e4"></script>
<script>

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	if('${dongmarkerlistjson}' != '') {
		var arr = JSON.parse('${dongmarkerlistjson}');
		console.log("dongmarker");
		console.log(arr);
		markerlist();
	}
	if('${aptmarkerlistjson}' != '') {
		var arr = JSON.parse('${aptmarkerlistjson}');
		console.log("aptmarker");
		console.log(arr);
		markerlist();
	}
	
	function markerlist(){
		var aptArr = new Array();
		var apt = new Object();
		 
		for(var i = 0; i < arr.length; i++) {
		  apt = new Object();  //초기화
		  apt.lat = arr[i].lat;
		  apt.lng = arr[i].lng;
		  apt.name = arr[i].aptname;
		  
		  console.log(apt);
		  aptArr.push(apt);
		}
		placesSearch(aptArr);
	}
	
	function placesSearch (data) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	        console.log(bounds);

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].lat, data[i].lng));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    // 마커를 생성하고 지도에 표시합니다
	    /* var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.lat, place.lng)
	    }); */
	    /* // 마커에 클릭이벤트를 등록합니다
	    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;text-align:center;">' + place.name + '</div>');
	        infowindow.open(map, marker);
	    }); */
//	    var imageSrc = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconsdb.com%2Fred-icons%2Fhome-5-icon.html&psig=AOvVaw1lf9BMnHLwCmX0uAZWYZdu&ust=1621697074649000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLihiciK2_ACFQAAAAAdAAAAABAT', // 마커이미지의 주소입니다    
	    var imageSrc = '${root}/img/hmark2.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(50, 53), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(place.lat, place.lng); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  

	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var content = '<div class="customoverlay">' +
	    '  <a>' +
	    '    <span class="title"> '+ place.name + '</span>' +
	    '  </a>' +
	    '</div>';

	// 커스텀 오버레이가 표시될 위치입니다 
	var position = new kakao.maps.LatLng(place.lat, place.lng);  

	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    map: map,
	    position: position,
	    content: content,
	    yAnchor: 1 
	});
	}
</script>




  <!-- Footer-->
        <%@ include file="../include/footer.jsp" %>

</body>
</html>