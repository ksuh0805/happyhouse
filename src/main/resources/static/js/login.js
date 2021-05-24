window.onload = function(){

// $('#infock').click(function(){
// $(this).attr('data-toggle', "modal").attr('data-target', "#InfoCheckModal");
// })
	

	
	
	
	$('#logout').click(function(){
		$(location).attr("href", "/logout");
	});
	$('#memmanagement').click(function(){
		$(location).attr("href", "/user/list");
	});
	

    // data-toggle="modal" data-target="#LoginModal"
    $('#loginmodalbtn').click(function(){
    	$("#userRegModal").remove();
    	$("#LoginModal").remove();
        $('body').append(
          `  
          <script type="text/javascript">
			$(document).ready(function() {
				$("#loginBtn").click(function() {
					
					if($("#userid").val() == "") {
						alert("아이디 입력!!!");
						return;
					} else if($("#userpwd").val() == "") {
						alert("비밀번호 입력!!!");
						return;
					} else {
						$("#loginform").attr("action", "/login").submit();
					}
				});
				 
			});
			</script>
          
          <div class="modal fade" id="LoginModal" data-backdrop="static">
                <div class="modal-dialog">
                <div class="modal-content">

                <!-- Modal Header -->
                <form id="loginform" method="post">
	                <div class="modal-header">
	                <h4 class="modal-title">LogIn</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	
	                <!-- Modal body -->
	                <div class="modal-body">
	                <div class="form-group">
	                    <label for="inputName">ID:</label>
	                    <input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
	                </div>
	                <div class="form-group">
	                    <label for="inputPassword">Password:</label>
	                    <input type="text" class="form-control" id="userpwd" name="userpwd" placeholder="Password">
	                </div>
	                </div>
	
	                <!-- Modal footer -->
	                <div class="modal-footer">
	             
	                <button type="button" class="btn btn-primary" id = "loginBtn">로그인</button>
                </form>
            </div>
            </div>
        </div>
        </div>`
        );

        $(this).attr('data-toggle', "modal").attr('data-target', "#LoginModal");
    });
    

    
   $('#signupmodalbtn').click(function(){
	   $("#userRegModal").remove();
	   $("#LoginModal").remove();
    	$('body').append(
    			`
    			
    			<script>
    			
    			$('#duplicatecheck').click(function(){
		console.log("aaaaaa")
		id = $("#userid").val();
    	
    	$.ajax({
    	    url: '/admin/ID_Check',
    	    type: 'POST',
    	    dataType: 'text', // 서버로부터 내가 받는 데이터의 타입
    	    contentType : 'text/plain; charset=utf-8;',// 내가 서버로 보내는 데이터의 타입
    	    data: id ,

    	    success: function(data){
    	         if(data == 0){
    	         console.log("아이디 없음");
    	         alert("사용하실 수 있는 아이디입니다.");
    	         }else{
    	         	console.log("아이디 있음");
    	         	alert("중복된 아이디가 존재합니다.");
    	         	$( 'input#userid' ).val("");
    	         }
    	    },
    	    error: function (){        
    	                      
    	    }
	});
	});
    			
    			$("#registerBtn").click(function() {
	let registerinfo = JSON.stringify({
		"username" : $("#username").val(), 
		"userid" : $("#userid").val(), 
		"userpwd" : $("#userpwd").val(), 
		"email" : $("#email").val(), 
		"address" : $("#address").val(),
		"age" : $("#age").val(),
		"gender" : $("#gender").val(),
		"job" : $("#job").val()
	  });
	$.ajax({
		url:'/admin/user',  
		type:'POST',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		data: registerinfo,
		success:function(users) {
			$("#username").val('');
			$("#userid").val('');
			$("#userpwd").val('');
			$("#email").val('');
			$("#address").val('');
			$("#age").val('');
			$("#gender").val('');
			$("#job").val('');
		 	/* $("#userRegModal").modal("hide");  */
			makeList(users);
		},
		error:function(xhr,status,msg){
			console.log("상태값 : " + status + " Http에러메시지 : "+msg);
		}
		
	});
	$(location).attr("href", "/");
});
    			</script>

			<div class="modal" id="userRegModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">회원등록</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <form id="memberform" method="post" action="">
					<input type="hidden" name="act" id="act" value="">
						<div class="form-group" align="left">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="username" name="username" placeholder="">
						</div>
						<div class="form-group" align="left">
							<label for="">아이디</label>
							<input type="text" class="form-control" id="userid" name="userid" placeholder="">
							
    						<button id="duplicatecheck" type="button" ">중복체크</button>
    			
						</div>
						<div class="form-group" align="left">
							<label for="">비밀번호</label>
							<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
						</div>
						<div class="form-group" align="left">
							<label for="email">이메일</label><br>
							<input type="text" class="form-control" id="email" name="email" placeholder="">
						</div>
						<div class="form-row align-items-center">
						    <div class="col-auto my-1">
						      <label class="mr-sm-2" for="age">연령대</label>
						      <select class="custom-select mr-sm-2" id="age">
						        <option value="10">10대</option>
						        <option value="20">20대</option>
						        <option value="30">30대</option>
    							<option value="40">40대</option>
				    			<option value="50">50대</option>
				    			<option value="60">60대 이상</option>
						      </select>
						    </div>
			    			<div class="col-auto my-1">
				    			<label class="mr-sm-2" for="gender">성별</label>
				    			<select class="custom-select mr-sm-2" id="gender">
					    			<option value="남성">남성</option>
					    			<option value="여성">여성</option>
				    			</select>
			    			</div>
			    			<div class="col-auto my-1">
				    			<label class="mr-sm-2" for="job">직업</label>
				    			<select class="custom-select mr-sm-2" id="job">
					    			<option value="학생">학생</option>
					    			<option value="무직">무직</option>
					    			<option value="회사원">회사원</option>
					    			<option value="엔지니어">엔지니어</option>
					    			<option value="교사">교사</option>
					    			<option value="전문직">전문직</option>
					    			<option value="프리랜서">프리랜서</option>
					    			<option value="주부">주부</option>
					    			<option value="자영업">자영업</option>
					    			<option value="농수산업">농수산업</option>
					    			<option value="공무원">공무원</option>
					    			<option value="기타">기타</option>
				    			</select>
			    			</div>
						</div>
						<div class="form-group" align="left">
							<label for="">주소</label>
							<input type="text" class="form-control" id="address" name="address" placeholder="">
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
							<button type="reset" class="btn btn-warning">초기화</button>
						</div>
					</form>
			      </div>
			    </div>
			  </div>
			</div>
    	`);
    	$(this).attr('data-toggle', "modal").attr('data-target', "#userRegModal");
      });


// $("#registerBtn").click(function() {
// let registerinfo = JSON.stringify({
// "username" : $("#username").val(),
// "userid" : $("#userid").val(),
// "userpwd" : $("#userpwd").val(),
// "email" : $("#email").val(),
// "address" : $("#address").val()
// });
// $.ajax({
// url:'${root}/admin/user',
// type:'POST',
// contentType:'application/json;charset=utf-8',
// dataType:'json',
// data: registerinfo,
// success:function(users) {
// $("#username").val('');
// $("#userid").val('');
// $("#userpwd").val('');
// $("#email").val('');
// $("#address").val('');
// /* $("#userRegModal").modal("hide"); */
// makeList(users);
// },
// error:function(xhr,status,msg){
// console.log("상태값 : " + status + " Http에러메시지 : "+msg);
// }
//		
// });
// $(location).attr("href", "/");
// });
      
      
    // 테이블 클릭시 행번호 찍기
    $('#postlist tr').click(function(){
        var str = "";
        var tdArr = new Array();
        var tr = $(this);
        var td = tr.children();

        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });

        var no = td.eq(0).text();

        console.log(no);
    })

    $('#postlist').click((e)=>{
        var str = "";
        var tdArr = new Array();
        var tr = $(e.target);
        var td = tr.children();

        console.log("클릭한 Row의 모든 데이터 : " + tr.text());

        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
        
        console.log("배열에 담긴 값 : "+tdArr);
    })
}

