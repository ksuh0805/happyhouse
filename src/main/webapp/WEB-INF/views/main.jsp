<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:import url="./include/header.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/js/main.js"></script>
<script src="/HappyHouseBackEnd/js/login.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${root}/css/main.css">
<title>돈워리 비싸피 하우스</title>
</head>
<body>
	<div>
		<img src="${root}/img/background.jpg" height="300px"
			width="100%" style="opacity: 0.6">
	</div>

	<section class="section1">
		<div class="container">
			<div style="float: left; width: 33%;">
				<div class="servicebox text-center">
					<div class="service-icon">
						<div class="dm-icon-effect-1" data-effect="slide-left">
							<button type="button" class="btn" id="img_btn1"
								onclick="location.href='aptdeal/search'">
								<img src="${root}/img/search.png">
							</button>
						</div>
						<div class="servicetitle">
							<h4>SEARCH</h4>
							<hr>
						</div>
						<p>
							아파트 실 거래가 검색<br> 뭐쓸까요???<br> 뭐쓸까요???<br> 뭐쓸까요???<br>
						</p>
					</div>
					<!-- service-icon -->
				</div>
				<!-- servicebox -->
			</div>
			<!-- large-4 -->

			<div style="float: left; width: 33%;">
				<div class="servicebox text-center">
					<div class="service-icon">
						<div class="dm-icon-effect-1" data-effect="slide-bottom">
							<button type="button" class="btn" id="img_btn1"
								onclick="location.href='${root}/interest/Area_of_interest.jsp'">
								<img src="${root}/img/search.png">
							</button>
						</div>
						<div class="servicetitle">
							<h4>Area of ​​interest</h4>
							<hr>
						</div>
						<p>
							관심 지역<br> 뭐쓸까요???<br> 뭐쓸까요???<br>
						</p>
					</div>
					<!-- service-icon -->
				</div>
				<!-- servicebox -->
			</div>
			<!-- large-4 -->

			<div style="float: left; width: 33%;">
				<div class="servicebox text-center">
					<div class="service-icon">
						<div class="dm-icon-effect-1" data-effect="slide-right">
							<button type="button" class="btn" id="img_btn1"
								onclick="location.href='board/board'">
								<img src="${root}/img/search.png">
							</button>
						</div>
						<div class="servicetitle">
							<h4>NEWS</h4>
							<hr>
						</div>
						<p>
							공지 사항<br> 뭐쓸까요???<br> 뭐쓸까요???<br> 뭐쓸까요???<br>
						</p>
					</div>
					<!-- service-icon -->
				</div>
				<!-- servicebox -->
			</div>
			<!-- large-4 -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<%-- <div>
		<h3>환경 정보 검색</h3>
		<form action="${root}/main">
			<input type="hidden" value="env" id="act" name="act"> <input
				type="text" class="env" placeholder="검색할 동이름을 적어주세요." id="dongName"
				name="dongName" />
			<button class="btn btn-primary">검색</button>
		</form>
	</div> --%>
	<c:if test="${envinfo ne null}">
		<div>${envinfo.dong} ${envinfo.env}</div>
	</c:if>


	<div class="footer">
		<ul>
			<li>사이트소개</li>
			<li>개인정보처리방침</li>
			<li>이용약관</li>
			<li>오시는길</li>
		</ul>
	</div>
	<div class="footer"></div>



</body>
</html>
