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
	<section class="page-section">
	<div style="padding:10px auto">
	<h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 상세 보기</h1>
	<br>
		<div style="justify-content: center" class="row">
			<table class="thead-dark table-bordered table-striped" style="width:90%; height:500px; text-align:center; border-radius: 1em;">
				<tr class="table-warning">
					<th colspan='6'>${board.subject}</th>
				</tr>
				<tr>
					<td style="font-weight:bold">작성자</td>
					<td colspan="3">관리자</td>
					<td style="font-weight:bold">조회수</td>
					<td>${board.count}</td>
				</tr>
				<tr style="text-align:left; padding-left:10px">
					<td rowspan="8" colspan="6">${board.content}</td>
				</tr>
			</table>
		</div>
			
			<div class="container mt-4 mb-4" style="text-align: center;">
			<button type="button" id="modifyBtn" class="btn btn-primary" onclick="location.href='${root}/board/mvmodify?idx=${board.idx}'">수정</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${root}/board/delete?idx=${board.idx}'">삭제</button>
			</div>
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
    </section>
 
<!--                     추가                         -->
<%@ include file="commentS.jsp" %>

<!-- Footer-->
        <%@ include file="../include/footer.jsp" %>
</body>
</html>