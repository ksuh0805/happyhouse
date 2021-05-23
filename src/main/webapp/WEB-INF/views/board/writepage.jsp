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
<title>돈워리 비싸피 하우스</title>
</head>
<body>
	
	
	<!-- 중앙 content -->
	<div style="padding:10px auto">
	<h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 작성</h1>
		<form id="writeform" method="post" action="${root}/board/write">
			<div class="form-group" align="left">
		<input type="hidden" class="form-control" id="idx" name="idx" value="1">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<div class="container mt-4 mb-4" style="text-align: center;">
			<button type="submit" id="writeBtn" class="btn btn-primary">작성</button>
			<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>

</body>
</html>