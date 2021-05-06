<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/header.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/js/login.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/brd/board.js"></script>
<link rel="stylesheet" href="/HappyHouseBackEnd/css/main.css" />
<title>돈워리 비싸피 하우스</title>
</head>
<body>
	<div>
		<img src="/HappyHouseBackEnd/img/background.jpg" height="300px" width="100%" style="opacity:0.6">
	</div>
	
	<!-- 중앙 content -->
	<div class="container mt-4">           
	    <div class="container">
	        <div><label for="comment">이것은 제목입니다</label></div>
	        <hr>
	        <div><label for="comment" class="mt-4">
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	            이것은 내용입니다 <br>
	        </label></div>
	    </div>
		<div class="container mt-4 mb-4" style="text-align: center;">
		    <button type="button" class="btn btn-primary" id="editNoBtn">수정</button>
		    <button type="button" class="btn btn-primary" id="showNoBtn">목록</button>
		    <button type="button" class="btn btn-primary" id="delNoBtn" data-toggle="modal" data-target="#delNoModal">삭제</button>
		</div>
	</div>
	<!-- footer -->
	<div class="footer">
	  <ul>
	    <li>사이트소개</li>
	    <li>개인정보처리방침</li>
	    <li>이용약관</li>
	    <li>오시는길</li>
	  </ul>
	</div>
</body>
</html>