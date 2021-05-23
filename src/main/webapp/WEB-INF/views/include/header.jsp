<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="memberDto" value="${sessionScope.memberinfo}" />
<c:set var="iArea" value="${sessionScope.iArea}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>돈 워리 비싸피 하우스</title>
<script src="${root}/js/login.js"></script>
<link rel="stylesheet" href="${root}/css/main.css">
 
</head>
<body>
    <div
        class="font-weight-bold font-size-5 main-home sticky-top shadow bg-light">
        <div class="container-fluid">
            <div class="form-row float-right" style="margin-right: 10px;">
                 <form>
                 <%@ include file="/WEB-INF/views/user/login.jsp" %> 
                    <%-- <c:choose>
                        <c:when test="${empty memberDto}">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary"
                                    id="loginmodalbtn">Login</button>
                                <button type="button" class="btn btn-info" id="signupmodalbtn">SignUp</button> 
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="btn-group">
                                <button type="button" id='infock' class="btn btn-secondary" data-toggle="modal" data-target="#InfoCheckModal">My
                                    Profile</button>
                                <button type="submit" id='logout' class="btn btn-secondary">Logout</button>
                            </div>
                        </c:otherwise>
                    </c:choose>  --%>
                </form>
            </div>
            <div class="form-row float-right"
                style="margin-right: 10px; margin-top: 10px;">
                <div class="loginInfo">
                    <span class="badge badge-light"></span>
                </div>
            </div>
            <a onclick="location.href='${root}/'"><img src="${root}/img/ssafy_logo.png"></a> Don't worry, Be
            SSAFY House

        </div>
    </div>

    <div class="modal fade" id="InfoCheckModal" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원정보</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="inputName">User ID</label>
                            <p class="font-weight-bold">${memberDto.userId}</p>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">User Password(* 20자 이내)</label>
                            <p class="font-weight-bold">${memberDto.userPwd}</p>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">User E-mail(* 50자 이내)</label>
                            <p class="font-weight-bold">${memberDto.email}</p>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">User Address(*)</label>
                            <p class="주소주소주소">${memberDto.address}</p>
                        </div>
                    </form>
                    <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle"
                            data-toggle="dropdown">관심지역 목록</button>
                        <div class="dropdown-menu">
                            <c:choose>
                                <c:when test="${empty iArea}">
                                    <a class="dropdown-item" href="#">관심지역이 없습니다.</a>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="result" items="${iArea}">
                                        <a class="dropdown-item"
                                            href="${root}/apt?act=aptSelect&key=${result.key}&word=${result.word}">${result.key}
                                            : ${result.word}</a>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <form name="exitCh" action="/HappyHouseBackEnd/member">
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" id="exitbtn">탈퇴</button>
                            <button type="button" class="btn btn-primary" id="chbtn">수정</button>
                        </div>
                        <input type="hidden" class="form-control" id="actHidden"
                            name="act" value="secession"> <input type="hidden"
                            class="form-control" name="id" value="${memberDto.userId}">
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>