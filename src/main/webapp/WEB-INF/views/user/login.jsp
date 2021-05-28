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
				<a class="nav-link js-scroll-trigger" style="cursor:pointer" id="loginmodalbtn">Login</a> <a
					class="nav-link js-scroll-trigger" style="cursor:pointer" id="signupmodalbtn">SignUp</a>
			</div>
		</c:when>
		<c:when test="${empty userinfo}">
			<div class="btn-group">
				<a style="color: white; padding: 5px; cursor:pointer" id="loginmodalbtn">Login</a>
				<a style="color: white; padding: 5px; cursor:pointer" id="signupmodalbtn">SignUp</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="btn-group">
				<a style="color: white; padding: 5px; cursor:pointer" id="sendMessage" data-toggle="modal" data-target="#sendMessageModal">
					쪽지 <i style="color:white" class="fa fa-paper-plane fa-lg"></i>
				</a>
				
				<a style="color: white; padding: 5px; cursor:pointer" id='listMessage'>
					쪽지함 <i style="color:white" class="fa fa-envelope-square fa-lg"></i>
				</a>
				
				<a style="color: white; padding: 5px;" type="button" id='infock'
					data-toggle="modal" data-target="#userViewModal"> My Profile</a>
				<c:if test="${userinfo.userid == 'admin'}">
                <a style="color: white; padding: 5px;" type="button" id="memmanagement">회원 관리</a>
            </c:if>
				<a style="color: white; padding: 5px;" type="button" id='logout'>Logout</a>
			</div>
		</c:otherwise>
	</c:choose>


	<script> 
	
	
	// 메세지 상세
	 function deleteMessage(idx){
		 console.log("show");
		 console.log(eval("no="+idx))
		  $.ajax({
	    	    url: '${root}/message/delete',
	    	    type: 'GET',
	    	    dataType: 'json', // 서버로부터 내가 받는 데이터의 타입
	    	    data: 'no='+idx,			//여기에 뭘써야할까요......

	    	    success: function(){
	    	    	$("#userViewModal").remove();
	    	    	$("#detailMessageModal").remove();
		        	$("#sendMessageModal").remove();
		        	$("#listMessageModal").remove();
	    	    	
	    	    },
	    	    error: function (){        
	    	                      
	    	    }
		}); 
	 
	}
	    	    
	
	
	 // 메세지 상세
	 function showdetail(idx){
		 console.log("show");
		 console.log(eval("no="+idx))
		  $.ajax({
	    	    url: '${root}/message/detail',
	    	    type: 'GET',
	    	    dataType: 'json', // 서버로부터 내가 받는 데이터의 타입
	    	    data: 'no='+idx,			//여기에 뭘써야할까요......

	    	    success: function(data){
	    	    	let msgDetail = data;
	    	    	let ttbody = "";
	    	    	
	    			 ttbody += '<p> 보낸 사람 : '+msgDetail.sendID+'</p>'; 
	    			 ttbody += '<p> 제목 : '+msgDetail.title+'</p>';
	    			 ttbody += '<p> 내용 : '+msgDetail.contents+'</p>';
	    			 ttbody += '<button id="deleteMessage" data-dismiss="modal" onclick="deleteMessage('+ msgDetail.no +');">삭제하기 </button>';
	    	    	
	    	    	$("#userViewModal").remove();
	    	    	$("#detailMessageModal").remove();
		        	$("#sendMessageModal").remove();
		        	$("#listMessageModal").remove();
		        	$('body').append(
		        			`  
		    <div class="modal" id="detailMessageModal"  >
		      <div class="modal-dialog">
		        <div class="modal-content">

		          <!-- Modal Header -->
		          <div class="modal-header">
		            <h4 class="modal-title">상세 메세지</h4>
		            <button type="button" class="close" data-dismiss="modal">&times;</button> 
		          </div>

		          <!-- Modal body -->
		          <div class="modal-body">
		    		<ttbody id="messageTbody"> `
		    			+ttbody+
		    			"</ttbody></div></div></div></div>" 
		    			);
		    		
		    		$("#detailMessageModal").modal('show')
		    		
	    	    },
	    	    error: function (){        
	    	                      
	    	    }
		}); 
	 
	}
	 // 메세지 상세
	 /*$('body').on("click","#detailMessage",function(){
		  $.ajax({
	    	    url: '${root}/message/detail',
	    	    type: 'GET',
	    	    dataType: 'json', // 서버로부터 내가 받는 데이터의 타입
	    	    data: "no=1",			//여기에 뭘써야할까요......

	    	    success: function(data){
	    	    	let msgDetail = data;
	    	    	let ttbody = "";
	    	    	
	    			 ttbody += '<p> 보낸 사람 : '+msgDetail.sendID+'</p>';
	    			 ttbody += '<p> 제목 : '+msgDetail.title+'</p>';
	    			 ttbody += '<p> 내용 : '+msgDetail.contents+'</p>';
	    	    	
	    	    	$("#userViewModal").remove();
	    	    	$("#detailMessageModal").remove();
		        	$("#sendMessageModal").remove();
		        	$("#listMessageModal").remove();
		        	$('body').append(
		        			`  
		    <div class="modal" id="detailMessageModal"  >
		      <div class="modal-dialog">
		        <div class="modal-content">

		          <!-- Modal Header -->
		          <div class="modal-header">
		            <h4 class="modal-title">상세 메세지</h4>
		            <button type="button" class="close" data-dismiss="modal">&times;</button> 
		          </div>

		          <!-- Modal body -->
		          <div class="modal-body">
		    		<ttbody id="messageTbody"> `
		    			+ttbody+
		    			"</ttbody></div></div></div></div>" 
		    			);
		    		$("#detailMessageModal").modal('show')
		    		
	    	    },
	    	    error: function (){        
	    	                      
	    	    }
		}); 
	 
	});   */
	
	
	// 메세지 목록 
	 $('#listMessage').click(function(){ 
		 $.ajax({
	    	    url: '${root}/message/list',
	    	    type: 'GET',
	    	    dataType: 'json', // 서버로부터 내가 받는 데이터의 타입
	    	    data: "userid=${userinfo.userid}",

	    	    success: function(data){ 
	    	    	let msgList = data;
		    		 let tbody = "";
		    		 for(let msg of msgList){ 
		    			 /* tbody += '<tr style="cursor:pointer" id="detailMessage"  data-toggle="modal" data-target="#detailMessageModal"  >';	//onclick="location.href=${root}/message/detail?no='+msg.no+' " */ 
		    			 tbody += '<tr style="cursor:pointer" id="detailMessage" data-dismiss="modal" onclick="showdetail('+ msg.no +');"  >';	//onclick="location.href=${root}/message/detail?no='+msg.no+' " 
		    			 tbody += '<td style="width: 30%">'+msg.sendID+'</td>';
		    			 tbody += '<td style="width: 35%">'+msg.title+'</td>';
		    			 tbody += '<td style="width: 35%">'+msg.wdate+'</td>';
		    			 tbody += '</tr>'; 
		    		 }
		    		 if(msgList.length == 0){
		    			tbody = '<tr>';
		    			tbody += '<td colspan="12" style="color: red;">메세지가 존재하지 않습니다.</td>'; 
		    			tbody += '</tr>';
		    		 }
		    		 
		    		 
		    		 
		        	$("#userVuewModal").remove();
		        	$("#sendMessageModal").remove();
		        	$("#listMessageModal").remove();
		        	$("#detailMessageModal").remove();
		        	$('body').append(
		        			`  
		        			<!-- 회원 정보 모달 -->
		    <div class="modal" id="listMessageModal" >
		      <div class="modal-dialog">
		        <div class="modal-content">

		          <!-- Modal Header -->
		          <div class="modal-header">
		            <h4 class="modal-title">메세지함</h4>
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		          </div>

		          <!-- Modal body -->
		          <div class="modal-body">
		          <table class="mt-5 table table-hover" style="font-size: 20px;">
		    		<thead>
		    			<tr>
		    				<th>보낸사람</th>
		    				<th>제목</th>
		    				<th>날짜</th>
		    			</tr>
		    		</thead>
		    		
		    		<tbody id="messageTbody"> `
		    			+tbody+
		    		
		    			"</tbody></table></div></div></div></div>" 
		    			);
		    		$("#listMessageModal").modal('show')
		    		
	    	    },
	    	    error: function (){        
	    	                      
	    	    }
		});
	
	}); 
	
	
	// 회원 정보
$('#infock').click(function(){
	$("#userViewModal").remove();
	$("#detailMessageModal").remove();
	$("#sendMessageModal").remove();
	$("#listMessageModal").remove();
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
	


$('#sendMessage').click(function(){
	$("#userVuewModal").remove();
	$("#sendMessageModal").remove();
	$("#listMessageModal").remove();
   	$('body').append(
   			`  
            <div class="modal fade" id="sendMessageModal">
                  <div class="modal-dialog">
                  <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
	       <h4 class="modal-title">메세지 보내기</h4>
	       <button type="button" class="close" data-dismiss="modal">&times;</button>
	     </div>
  	                <!-- Modal body -->
  	                <div class="modal-body">
				      <form id="messageform" method="post" action="${root}/message/send">
				      <div class="form-group">
				      <input type="hidden" class="form-control" id="no" name="no" value="1">
			     	      <input type="hidden" class="form-control" value="${userinfo.userid}" id="sendID" name="SendID">
				          <label for="inputReceivingID">받는 ID :</label>
				          <input type="text" class="form-control" id="receivingID" name="receivingID" >
				      </div>
		   			<div class="form-group">
		   			<label for="inputTitle">제목 :</label>
		   			<input type="text" class="form-control" id="title" name="title" >
		   			</div>
			      <div class="form-group">
			          <label for="inputContents">내용 :</label>
			          <textarea class="form-control" rows="15" id="contents" name="contents"></textarea>
			      </div>
			      <div class="form-group" align="center">
   						<button type="submit" class="btn btn-primary" id="sendBtn">보내기</button>
			      </div>
		      </form>
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