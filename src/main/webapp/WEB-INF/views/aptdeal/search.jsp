<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../include/header.jsp" charEncoding="utf-8"></c:import>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="pr" value="${result.pageResult}"/>
<c:set var="searchlist" value="${result.searchlist}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="boardResult.css" />
  <link rel="stylesheet" href="index.css">
</head>
<script>
function searchbydong() {
	document.getElementById("searchbydong").submit();
}
function searchbyapt() {
	document.getElementById("searchbyapt").submit();
}
</script>

<body>

  <div class="container">
    <div class="mt-3 md-3">
      <h2>주거 유형</h2>
      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
    </div>
    <div class="row ">
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 아파트</button></div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 빌라, 투룸+</button></div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 오피스텔</button></div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 사무실</button> </div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 임시</button> </div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 임시</button></div>
    </div>
    <div class="mt-3 md-3">
      <h2>계약 형태</h2>
      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
    </div>
    <div class="row ">
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 매매</button></div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 전세</button></div>
      <div class="col-md-2"><button class="btn btn-outline-success w-100 h-100"># 월세</button></div>
    </div>
    <form id="searchbydong" method="post" action="${root}/aptdeal/searchbydong">
    <div class="row mt-5">
      <div class="col-md-4"></div>
      <div class="col-md-2">
        <select class="form-control" id="city" style="font-size: 20px;">
        <c:if test="${searchlist.size() != 0}">
          <option selected>서울시</option>
          </c:if>
          <option>지역선택</option>
          <option>서울시</option>
          <option>경기도</option>
          <option>인천광역시</option>
          <option>부산광역시</option>
          <option>대전광역시</option>
          <option>대구광역시</option>
          <option>울산광역시</option>
          <option>세종</option>
          <option>광주광역시</option>
          <option>강원도</option>
          <option>충청북도</option>
          <option>충청남도</option>
        </select>
      </div>
      <div class="col-md-2">
        <select class="form-control" name="dong" id="dong" style="font-size: 20px;">
          <c:if test="${searchlist.size() != 0}">
          <option selected>${dong} </option>
          </c:if>
          <option>동으로 검색 </option>
          <option>사직동 </option>
          <option>내수동 </option>
          <option>견지동 </option>
          <option>효제동 </option>
          <option>명륜1가 </option>
          <option>명륜2가 </option>
          <option>창신동 </option>
          <option>숭인동 </option>
          <option>평창동 </option>
          <option>익선동 </option>
          <option>평동 </option>
          <option>홍파동 </option>
          <option>무악동 </option>
          <option>인의동 </option>
        </select>
      </div>
      <div class="col-md-2">
        <button class="btn btn-outline-success w-100 h-100" onclick="javascript:searchbydong();">검색</button>
      </div>
    </div>
    </form>
    <div align="center" style="margin-top:20px">
    <form id="searchbyapt" method="post" action="${root}/aptdeal/searchbyapt">
     <div class="d-flex">
     	<c:if test="${!empty apt}">
        <input id="apt" name="apt" type="text" class="form-control" value="${apt}">
          </c:if>
     	<c:if test="${empty apt}">
        <input id="apt" name="apt" type="text" class="form-control" placeholder="아파트로 검색">
        </c:if>
        <button class="btn btn-outline-success w-100 h-100" onclick="javascript:searchbyapt();">검색</button>
      </div>
    </form>
    </div>

    <!-- 게시물 영역 start -->
    <div class="mt-3">
      <h2>실거래 정보</h2>
      <div class="mb-3" style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
    </div>
    <c:if test="${searchlist.size() != 0}">
    <c:forEach var="deal" items="${searchlist}">
	  <div class="card-deck">
      <div class="card">
        <div class="card-body text-center">
          <h5>${deal.aptname}</h5>
          <p class="card-text">실거래금액 : ${deal.dealamount}원</p>
          <p class="card-text">거래날짜 : ${deal.dealyear}.${deal.dealmonth}.${deal.dealday}</p>
          <p class="card-text">건축년 : ${deal.dealyear}년</p>
          <p class="card-text">면적 : ${deal.area} m^2</p>
        </div>
      </div>
      </div>
	  	</c:forEach>
   </c:if>
	<c:if test="${searchlist.size() == 0}">
	  <h2>옵션을 선택해주세요</h2>
	</c:if>
	</div>
  <!-- 게시물 영역 -->

  <!-- pagenation -->
  <!-- <nav aria-label="...">
    <ul class="pagination justify-content-center mt-4">
      <li class="page-item disabled">
        <span class="page-link">Previous</span>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item active">
        <span class="page-link">
          2
          <span class="sr-only">(current)</span>
        </span>
      </li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item">
        <a class="page-link" href="#">Next</a>
      </li>
    </ul>
  </nav> -->
  <%-- <c:if test="${count != 0}">
		 	<nav>
		 		<ul class="pagination justify-content-center mt-4">
		 			<c:forEach var="i" begin="1" end="${lastPage}">
		 				<c:choose>
		 					<c:when test="${i eq pageNo}">
		 						<li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
		 					</c:when>
		 					<c:otherwise>
		 					<c:if test="${!empty dong}">
		 						<li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbydong/?dong=${dong}&pageNo=${i}">${i}</a></li>
		 					</c:if>
		 					<c:if test="${empty dong}">
		 						<li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbyapt/?apt=${apt}&pageNo=${i}">${i}</a></li>
		 					</c:if>
		 					</c:otherwise>
		 				</c:choose>
		 			</c:forEach>
		 		</ul>
		 	</nav>
	</c:if> --%>
			    <c:if test="${!empty dong}">
	<c:if test="${pr.count != 0}">
            <nav style="width:300px; margin:0 auto;">
               <ul class="mt-5 pagination pagination-lg">
			    <li class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
			    
			    	<a class="page-link" href="<c:if test="${pr.prev}">${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${pr.beginPage - 1}</c:if>">Previous</a></li>
			    	
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">	
				    <c:choose>
					    <c:when test="${i eq pr.pageNo}">
						    <li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${i}">${i}</a></li>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			    <li class="page-item <c:if test="${not pr.next}">disabled</c:if>">
			    	<a class="page-link" href="<c:if test="${pr.next}">${root}/aptdeal/searchbydong?dong=${dong}&pageNo=${pr.endPage + 1}</c:if>">Next</a></li>
		 		</ul>
            </nav>
        </c:if>
		 		</c:if>
		 		
			    <c:if test="${empty dong}">
	<c:if test="${pr.count != 0}">
            <nav style="width:300px; margin:0 auto;">
               <ul class="mt-5 pagination pagination-lg">
			    <li class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
			    
			    	<a class="page-link" href="<c:if test="${pr.prev}">${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${pr.beginPage - 1}</c:if>">Previous</a></li>
			    	
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">	
				    <c:choose>
					    <c:when test="${i eq pr.pageNo}">
						    <li class="page-item active"><a class="page-link" href="#1">${i}</a></li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item"><a class="page-link" href="${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${i}">${i}</a></li>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			    <li class="page-item <c:if test="${not pr.next}">disabled</c:if>">
			    	<a class="page-link" href="<c:if test="${pr.next}">${root}/aptdeal/searchbyapt?apt=${apt}&pageNo=${pr.endPage + 1}</c:if>">Next</a></li>
		 		</ul>
            </nav>
        </c:if>
		 		</c:if>
  <!-- pagenation -->

  
  <script src="js/index.js" type="text/javascript"></script>
</body>
</html>