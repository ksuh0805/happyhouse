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
</head>


<body>

<c:set var="pr" value="${result.pageResult}" />
<div class="mt-5 container-fluid">
	 <div class="row">
	  <div class="col-sm-1"></div>
	  <div class="col-sm-10">
	  <h1 class="ml-5" style="font-weight:bold; font-size:40px;">공지사항 목록</h1>
	     <i class="ml-5" style="font-size:30px;">-총 게시글 ${pr.count}개</i>
	  <table class="mt-5 table table-hover" style="font-size:20px;">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>날짜</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach var="board" items="${result.list}" varStatus="loop">
	      	<tr onclick="location.href='${root}/board/detail?idx=${board.idx}'">
	      		<td style="width:20%">${(pr.pageNo - 1) * 10 + loop.count}</td>
	      		<td style="width:30%">${board.subject}</td>
	      		<td style="width:30%">${board.wdate}</td>
	      		<td style="width:20%">${board.count}</td>
	      	</tr>
	      </c:forEach>
	      <c:if test="${empty result.list}">
	      	<tr>
	      		<td colspan="12" style="color:red;">게시글이 존재하지 않습니다.</td>
	      	</tr>
	      </c:if>
	    </tbody>
	  </table>
	  
		 <c:if test="${pr.count != 0}">
            <nav style="width:300px; margin:0 auto;">
               <ul class="mt-5 pagination pagination-lg">
			    <li class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
			    	<a class="page-link" href="<c:if test="${pr.prev}">${root}/board/board?pageNo=${pr.beginPage - 1}</c:if>">Previous</a></li>
			    	
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">	
				    <c:choose>
					    <c:when test="${i eq pr.pageNo}">
						    <li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item"><a class="page-link" href="${root}/board/board?pageNo=${i}">${i}</a></li>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			    <li class="page-item <c:if test="${not pr.next}">disabled</c:if>">
			    	<a class="page-link" href="<c:if test="${pr.next}">${root}/board/board?pageNo=${pr.endPage + 1}</c:if>">Next</a></li>
		 		</ul>
            </nav>
        </c:if>
        
	  </div>
	  <div class="col-sm-1"></div>
	  </div>
	</div>
	<div style="height:70px;"></div>
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