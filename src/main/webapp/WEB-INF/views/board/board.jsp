<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:import url="../include/header.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/main.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/brd/board.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/js/login.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/signUp.js"></script>
<script type="text/javascript" src="/HappyHouseBackEnd/favoriteArea.js"></script>
<link rel="stylesheet" href="/HappyHouseBackEnd/css/main.css" />
<title>게시판</title>
<script>
function boardSelect() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/board";
			document.getElementById("searchform").submit();
		}
</script>
<style>
td{
	background-color:#ffffff;
}
</style>
</head>


<body>

<div>
	<img src="${root}/img/background.jpg" height="300px" width="100%" style="opacity:0.6">
</div>

<!-- 중앙 content -->
<div class="container mt-4 table-wrapper-scroll-y my-custom-scrollbar" align="">
    <div class="container" align="center">
		<div class="col-lg-8" align="right">
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>게시글 목록</h2>
	  <table class="table table-borderless">
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  
	  <input type="hidden" name="act" id="act" value="list">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="idx">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력" name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="boardSelect();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  
	  <!-- 게시글 출력되는 부분 start -->
	  <c:if test="${list.size() != 0}">
	  	<c:forEach var="article" items="${list}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${article.idx}. ${article.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">${article.content}</td>
	      </tr>
	      <tr>
	        <td colspan="2">
			<a href="${root}/board?act=mvBoardUpdate&idx=${article.idx}">수정</a>
			<a href="${root}/board?act=boardDelete&idx=${article.idx}">삭제</a>
			</td>
	      </tr>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  
	  <c:if test="${list.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  <!-- 게시글 출력되는 부분 end -->
	  
	  </div>
	</div>
    <button class="btn btn-outline-primary" id="insertBoard">글쓰기</button>
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