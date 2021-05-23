<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<title>Insert title here</title>

</head>
<body>

	<c:choose>
		<c:when test="${msg != null && empty userinfo}">
			<script>
				alert("${msg}");
			</script>
			<div>
				<a class="nav-link js-scroll-trigger" id="loginmodalbtn">Login</a>
				<a class="nav-link js-scroll-trigger" id="signupmodalbtn">SignUp</a>
			</div>
		</c:when>
		<c:when test="${empty userinfo}">
			<div class="btn-group">
				<a style="color: white; padding: 5px;" id="loginmodalbtn">Login</a>
				<a style="color: white; padding: 5px;" id="signupmodalbtn">SignUp</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="btn-group">
				<a style="color: white; padding: 5px;" type="button" id='infock'
				data-toggle="modal" data-target="#userViewModal"
				> My	Profile</a> <a style="color: white; padding: 5px;" type="button"
					id="memmanagement">회원 관리</a> <a style="color: white; padding: 5px;"
					type="button" id='logout'>Logout</a>
			</div>
		</c:otherwise>
	</c:choose>
	
	<script>
$('#infock').click(function(){
    	$("#userVuewModal").remove();
    	$('body').append(
    			`  
    			<!-- 회원 정보 모달 -->
<div class="modal" id="userViewModal" >
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	<table class="table table-bordered">
            <colgroup>
                <col width="120">
                <col width="*">
                <col width="120">
                <col width="*">
            </colgroup>
            <tbody>
            <tr>
                <th class="text-center">ID</th>
                <td class="text-left" id="vid">${userinfo.userid}</td>
                <th class="text-center">회원명</th>
                <td class="text-left" id="vname">${userinfo.username}</td>
            </tr>
            <tr>
            	<th class="text-center">이메일</th>
                <td class="text-left" id="vemail">${userinfo.email}</td>
                <th class="text-center">가입일</th>
                <td class="text-left" id="vjoindate">${userinfo.joindate}</td>
            </tr>
            <tr>
                <th class="text-center">주소</th>
                <td class="text-left" colspan="3" id="vaddress">${userinfo.address}</td>
            </tr>
            <tr>
                <th class="text-center">연령대</th>
                <td class="text-left" colspan="3" id="vage">${userinfo.age}대</td>
            </tr>
            <tr>
                <th class="text-center">성별</th>
                <td class="text-left" colspan="3" id="vgender">${userinfo.gender}</td>
            </tr>
            <tr>
                <th class="text-center">직업</th>
                <td class="text-left" colspan="3" id="vjob">${userinfo.job}</td>
            </tr>
            
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>  
`
);
});
    	</script>

</body>
</html>