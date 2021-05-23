<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${root}/css/styles.css" rel="stylesheet" />
    <script src="${root}/js/login.js"></script>
</head>
<body>
<!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Enjoy Our Service!</div>
                <div class="masthead-heading text-uppercase">부동산 실거래 검색 페이지</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services" id="main">서비스 이용하기</a>
            </div>
        </header>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <!-- <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="..." /></a> -->
                <a onclick="location.href='${root}/'"><img src="${root}/img/ssafy_logo.png"></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services" id="service">Services</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">Notice</a></li>
                        <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li> -->
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Live Chat</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">Team</a></li>
                    	<li class="nav-item"> <%@ include file="/WEB-INF/views/user/login.jsp" %> </li>
                    </ul>
                </div>
            </div>
        </nav>   
         <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root}/js/scripts.js"></script>   
</body>
</html>