<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="./include/header2.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root}/css/styles.css" rel="stylesheet" />
<script src="${root}/js/filtering.js"></script>
</head>
<body id="page-top">

	
	<script type="text/javascript">
	
	var ws;
	function connectWs() {
		ws = new WebSocket('ws://' + location.host + '/chat');
		ws.onmessage = function(data) {
			let today = new Date();
			console.log(data.data);
			var words = data.data.toString();
			if(filter(words)) {
				alert('사용할 수 없는 단어입니다!');
				return;
			}
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();  // 분
			let seconds = today.getSeconds();  // 초
/* 			let d = '${userinfo.userid}' + " : " + data.data; */
			$("<br>").prependTo('#chat');
			$("<span style='color:gray; text-size:3px'>"+'&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  ' + hours+' : ' + minutes + ' : ' + seconds + "</span>").prependTo('#chat');
			$("<span>"+'&nbsp  '+data.data+"</span>").prependTo('#chat');
		}

		$('#startBtn').hide();
	}



	function send() {
		ws.send("${userinfo.userid}" + " : " +$("#chatting").val());
		$('#chatting').val("");
	}
</script>
	
	
	<!-- Contact-->
	<section class="page-section" id="contact">
		<div class="container" style="justify-content:center">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">실시간 채팅</h2>
				<h3 class="section-subheading text-muted">실시간으로 부동산 정보를 소통해보세요!</h3>
			</div>
			<button class="btn btn-primary" onclick="connectWs()" id="startBtn"> 채팅 시작하기</button>
			<input id="chatting" placeholder="chat!"></input><button class="btn btn-primary" onclick="send()"> 보내기 </button>
			<div>
				<p id="chat" style="color: white; border:1px solid white"></p>
			</div>
		</div>
	</section>
	
	 <!-- Footer-->
        <%@ include file="./include/footer.jsp" %>
	<!-- Team-->

	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root}/js/scripts.js"></script>
</body>
</html>



