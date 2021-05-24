<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:import url="../include/header2.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/js/login.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/brd/board.js"></script>
<link rel="stylesheet" href="/HappyHouseBackEnd/css/main.css" />
<title>돈워리 비싸피 하우스</title>
</head>
<script>
$(document).ready(function(){
	
	// Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#modifypage').offset().top
    }, 'slow');
});
</script>
<body>
	

	
	<!-- 중앙 content -->
	<%-- <div class="container mt-4">
	<h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 수정</h1>
	    <div class="container">
	    <form method="post">
	        <input type="hidden" id="idx" name="idx" value="${idx}">
	        <div>
	        <label for="subject">제목</label>
	        <input type="text" id="subject" name="subject">
	        </div>
	        <hr>
	        <div><label for="content" class="mt-4">내용</label>
	        <textarea id="content" name="content"></textarea>
	        </div>
	    </form>
	    </div>
		<div class="container mt-4 mb-4" style="text-align: center;">
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/modify'">수정</button>
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/board?pageNo=1'">목록</button>
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/delete?idx=${board.idx}'">삭제</button>
		</div>
	</div> --%>
	<div id="modifypage" style="padding:10px auto">
	<h1 class="ml-5" style="text-align:center; font-weight:bold; font-size:40px;"><kbd>공지사항 수정</kbd></h1>
		<form id="modifyform" method="post" action="${root}/board/modify">
		<h5 style="padding-left:10px"><kbd style="background-color:gray">${board.idx}번 공지사항</kbd></h5>
			<div class="form-group" style="padding-left:50px; padding-right:50px">
				<input type="hidden" class="form-control" id="idx" name="idx" value="${board.idx}">
				<label for="subject"><kbd style="background-color:#fed136">제목</kbd></label>
				<input type="text" class="form-control" id="subject" name="subject" value="${board.subject}">
			</div>
			<div class="form-group" style="padding-left:50px; padding-right:50px">
				<label for="content"><kbd style="background-color:#fed136">내용</kbd></label>
				<textarea class="form-control" rows="15" id="content" name="content">${board.content}</textarea>
			</div>
			<div class="container mt-4 mb-4" style="text-align: center;">
			<button type="submit" id="modifyBtn" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/board/delete?idx=${board.idx}'">삭제</button>
			</div>
		</form>
	</div>

</body>
</html>