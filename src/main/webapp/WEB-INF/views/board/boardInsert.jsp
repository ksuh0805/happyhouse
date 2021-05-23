<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:import url="/header.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/js/login.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/brd/board.js"></script>
<link rel="stylesheet" href="/HappyHouseBackEnd/css/main.css" />
<title>돈워리 비싸피 하우스</title>
<script type="text/javascript">
  function boardInsert() {
	if(document.getElementById("subject").value == "") {
		alert("제목 입력!!!!");
		return;
	} else if(document.getElementById("content").value == "") {
	 	console.log("여기까지");
		alert("내용 입력!!!!");
		return;
	} else {
	  	document.getElementById("insertform").action = "${root}/board";
	  	document.getElementById("insertform").submit();
	}
  }
  </script>
</head>
<body>
	<!-- 중앙 content -->
	<div class="container mt-4 table-wrapper-scroll-y my-custom-scrollbar">     
	    <div class="container">
	        <h2 style="text-align: center; margin: 10px;"> 공지사항 작성 </h2><hr>      
	      <form id="insertform" method="post" action="">
		    <input type="hidden" name="act" value="boardInsert">
		        <div class="form-group">
		            <label for="comment">제목 : </label>
		            <textarea class="form-control" rows="1" id="subject" name="subject"></textarea>
		            <label for="comment" class="mt-4">내용 : </label>
		            <textarea class="form-control" rows="20" id="content" name="content"></textarea>
		         </div>
		    <div class="container mt-4 mb-4" style="text-align: center;">
		        <button type="button" class="btn btn-primary" onclick="boardInsert();">작성</button>
		        <button type="button" id="editNoCanBtn" class="btn btn-primary" id="insertCancle">취소</button>
		    </div>
	    	</form>
		</div>
	</div>
	
</body>
</html>


