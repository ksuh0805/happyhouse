<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:import url="../include/header2.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>돈워리 비싸피 하우스</title>
</head>
<body>
	<!-- 중앙 content -->
	<%-- <div class="container mt-4">
	<h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 상세 보기</h1>
	    <div class="container">
	        <div><label for="subject">제목</label>${board.subject}</div>
	        <hr>
	        <div><label for="content" class="mt-4">
	            내용
	        </label>${board.content}</div>
	    </div>
		<div class="container mt-4 mb-4" style="text-align: center;">
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/mvmodify?idx=${board.idx}'">수정</button>
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/board?pageNo=1'">목록</button>
		    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/delete?idx=${board.idx}'">삭제</button>
		</div>
	</div> --%>
	<div style="padding:10px auto">
	<h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 상세 보기</h1>
		<form id="modifyform" method="post" action="${root}/board/modify">
			<div class="form-group" align="left">
		<input type="hidden" class="form-control" id="idx" name="idx" value="${idx}">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${board.subject}">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${board.content}</textarea>
			</div>
			<div class="container mt-4 mb-4" style="text-align: center;">
			<button type="button" id="modifyBtn" class="btn btn-primary" onclick="location.href='${root}/board/mvmodify?idx=${board.idx}'">수정</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/board/delete?idx=${board.idx}'">삭제</button>
			</div>
		</form>
	</div>
	
	<!-- 댓글 -->
	<!--  댓글  -->

    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${board.idx}"/>
               <input type="hidden" name="userid" value="${userinfo.userid}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div style="margin-top:10px" class="commentList" ></div>
    </div>
 
<!--                     추가                         -->
<%@ include file="commentS.jsp" %>


</body>
</html>