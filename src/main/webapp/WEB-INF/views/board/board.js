$(document).ready(function(){
	// 공지사항 조회 버튼
	$('#showNotice').click(function(){
		location.href='showNotice.jsp';
	})
	
	// 공지사항 창 이동
	$('#notice').click(function(){
		location.href='Notice.html';
	})
	
	// 공지사항 수정 창으로 이동
	$('#editNoBtn').click(function(){
		location.href='editNotice.html';
	})
	
	// 공지사항 수정 취소 버튼
	$('#editNoCanBtn').click(function(){
		location.href='showNotice.jsp';
	})
	
	// 공지사항 게시글 작성
	$('#insertBoard').click(function(){
		location.href='/HappyHouseBackEnd/brd/boardInsert.jsp';
	})
	
	// 공지사항 게시글 작성 취소
	$('#insertCancle').click(function(){
		location.href='board.jsp';
	})
});