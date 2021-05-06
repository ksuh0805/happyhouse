<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" type="text/css" href="noticeList.css" />
<script src="board_main.js" type="text/javascript"></script>
<title>공지사항</title>
<script type="text/javascript">
		function movewrite() {
			location.href="${root}/notice?act=mvwrite";
		}
		function searchArticle() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/notice";
			document.getElementById("searchform").submit();
		}
		</script>
</head>
<body>
	<c:import url="../include/header.jsp" charEncoding="utf-8"></c:import>
	
	<div style="height:170px;"></div>
    <div class="container">
        <h2> Haapy House 서비스의 <span>신규</span> 및 <span>업데이트</span> 소식을 알려드립니다!</h2>
        
        <table class="table table-hover mt-4 ">
            <thead>
                <tr>
                    <th class="text-center" style="width: 60%;">제목</th>
                    <th style="width: 15%;">작성자</th>
                    <th style="width: 15%;">날짜</th>
                    <th style="width: 10%;">조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="notice" items="${noticeList}">   
                <tr>
                    <td id="title"><c:out value="${notice.subject}"/></td>
                    <td><c:out value="${notice.userid}" /></td>
                    <td><c:out value="${notice.regtime}" /></td>
                    <td><c:out value="${notice.hit}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${memberDto.user eq 'admin'}">
	        <div>
	      	  <button type="button">작성</button>
    	    </div>
        </c:if>
    </div>
    
</body>
</html>