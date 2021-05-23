<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header2.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>통계 기능</h1>
</div>
	<div class="row" style="padding-left:20px">
		<div class="col-6">
			<div class="mt-3 md-3">
		      <h2>그래프1</h2>
		      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
		    </div>
		    <div>
		    	 그래프 1 만들기
		    </div>
		</div>
		<div class="col-6">
			<div class="mt-3 md-3">
		      <h2>그래프2</h2>
		      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
		    </div>
		    <div>
		    	 그래프 2 만들기
		    </div>
		</div>
	</div>

	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>