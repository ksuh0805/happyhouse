<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:import url="/header.jsp" charEncoding="utf-8"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	<div>
		<img src="/HappyHouseBackEnd/img/background.jpg" height="300px" width="100%" style="opacity:0.6">
	</div>
	
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
	
	<!-- footer -->
	<div class="footer">
	  <ul>
	    <li>사이트소개</li>
	    <li>개인정보처리방침</li>
	    <li>이용약관</li>
	    <li>오시는길</li>
	  </ul>
	</div>
	
	<!-- 로그인 Modal -->
	<div class="modal" id="logInModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">로그인</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="container">
			    <div class="form-group">
			      <label for="id" style="font-weight:bold">ID :</label>
			      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
			    </div>
			    <div class="form-group">
			      <label for="pw" style="font-weight:bold">Password :</label>
			      <input type="password" class="form-control" id="pw" placeholder="Enter Password" name="pw">
			    </div>
				<div><button class="btn btn-outline-primary" id="editPassBtn" data-toggle="modal" data-target="#editPassModal">비밀번호 찾기</button></div>
			</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary" id="logInModalBtn">로그인</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
		
	    </div>
	  </div>
	</div>
	
	<!-- 회원 정보 조회 Modal -->
	<div class="modal" id="userInfoModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 정보 확인</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="container">
			    <table class="table table-borderless">
				    <tbody>
				      <tr>
				        <td>아이디</td>
				        <td>asdf</td>
				      </tr>
				      <tr>
				        <td>비밀번호</td>
				        <td>asdfasdf</td>
				      </tr>
				      <tr>
				        <td>이름</td>
				        <td>가나다</td>
				      </tr>
				      <tr>
				        <td>이메일</td>
				        <td>asdf@gmail.com</td>
				      </tr>
				      <tr>
				        <td>주소</td>
				        <td>대한민국</td>
				      </tr>
				      <tr>
				        <td>전화번호</td>
				        <td>01012345678</td>
				      </tr>
				    </tbody>
			  </table>
			</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary mr-auto" data-dismiss="modal" data-toggle="modal" data-target="#deleteInfoModal">탈퇴</button>
	      	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editInfoModal">수정</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- 회원 정보 수정 Modal -->
	<div class="modal" id="editInfoModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 정보 수정</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="container">
			    <table class="table table-borderless">
				    <tbody>
				      <tr>
				        <td>아이디</td>
				        <td><input type="text" value="asdf"></td>
				      </tr>
				      <tr>
				        <td>비밀번호</td>
				         <td><input type="password" value="asdfasdf"></td>
				      </tr>
				      <tr>
				        <td>이름</td>
				        <td><input type="text" value="가나다"></td>
				      </tr>
				      <tr>
				        <td>이메일</td>
				        <td><input type="text" value="asdf@gmail.com"></td>
				      </tr>
				      <tr>
				        <td>주소</td>
				        <td><input type="text" value="대한민국"></td>
				      </tr>
				      <tr>
				        <td>전화번호</td>
				        <td><input type="text" value="01012345678"></td>
				      </tr>
				    </tbody>
			  </table>
			</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="editInfoBtn">완료</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- 회원 탈퇴 Modal -->
	<div class="modal" id="deleteInfoModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="container">
				정말로 탈퇴하시겠습니까?
			</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="deleteInfoBtn" >확인</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 변경 Modal -->
	<div class="modal" id="editPassModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="container">
			    <table class="table table-borderless">
				    <tbody>
				      <tr>
				        <td>이름:</td>
				         <td><input type="text" value="asdfasdf"></td>
				      </tr>
				      <tr>
				        <td>아이디:</td>
				        <td><input type="text" value="asdf"></td>
				      </tr>
				      <tr>
				        <td>전화번호</td>
				        <td><input type="tel" value="01012345678"></td>
				      </tr>
				    </tbody>
			  </table>
			</div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="editInfoBtn">완료</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>


