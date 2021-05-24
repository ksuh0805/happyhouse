<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${root}/js/filtering.js"></script>
 
<script>
var bno = '${board.idx}'; //게시글 번호
	var userid = '${userinfo.userid}';
	console.log(userid);
	console.log("dd");
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	console.log($('#content').val());
	let con = $('#content').val();
	if(filter(con)){
		alert('사용할 수 없는 단어입니다!');
		$('#content').val("");
		return;
	}
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

/* function commentList(){
    $.ajax({
    	url : './detail', 
    	type : 'get',
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
} */
 
 
//댓글 목록 
 function commentList(){
    $.ajax({
        url : '/comment/list', 
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'ID : '+value.userid;
                if(value.userid == userid){
	                a += '<button class="btn" style="color:darkcyan" onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </button>';
	                a += '<button class="btn" style="color:skyblue" onclick="commentDelete('+value.cno+');"> 삭제 </button>';
                }
	           	a += '</div>';
                a += '<div class="commentContent'+value.cno+'"> <p>'+value.content + '<code>  ' + value.reg_date + '</code>' +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
} 
 
//댓글 등록
function commentInsert(insertData){
	
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    console.log(updateContent);
	if(filter(updateContent)){
		alert('사용할 수 없는 단어입니다!');
		return;
	}
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
