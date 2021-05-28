<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="./include/header2.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공공칠방</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root}/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">공공칠방의 서비스를 소개합니다!</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4" onclick="location.href='aptdeal/search'" style="cursor:pointer">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-map-marked-alt fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">부동산 실거래 정보</h4>
                        <p class="text-muted">지역별 / 아파트 이름 별로 <br> 부동산 정보를 검색해보세요!</p>
                    </div>
                    <div class="col-md-4" style="cursor:pointer"
	                    onclick="location.href='interest/Areaofinterest?userid=${userinfo.userid}'">
	                    <span class="fa-stack fa-4x"> <i
	                        class="fas fa-circle fa-stack-2x text-primary"></i> <i
	                        class="fas fa-heart fa-stack-1x fa-inverse"></i>
	                    </span>
	                    <h4 class="my-3">나의 관심지역 살펴보기</h4>
	                    <p class="text-muted">나의 관심 지역 / 부동산의 <br> 주변 상권을 살펴보세요!</p>
	                </div>
                    <div class="col-md-4" onclick="location.href='${root}/chart/chart'" style="cursor:pointer">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-search-dollar fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">통계비교 해보기</h4>
                        <p class="text-muted">공공칠방의 회원들은 어떤 <br> 지역 / 부동산에 관심이 많을까요?</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
			<c:set var="pr" value="${result.pageResult}" />
			<div class="mt-5 container-fluid">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<h1 class="ml-5" style="font-weight: bold; font-size: 40px;">공지사항
							목록</h1>
						<i class="ml-5" style="font-size: 30px;">-총 게시글 ${pr.count}개</i>
						<div class="ml-5">
						<c:if test="${userinfo.userid eq 'admin'}">
							<button class="btn btn-primary" onclick="location.href='${root}/board/mvwrite'">공지사항
								글쓰기</button>
						</c:if>
						</div>
	
						<table class="mt-5 table table-hover" style="font-size: 20px;">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr style="cursor:pointer" class="table-warning"
									onclick="location.href='${root}/board/detail?idx=${top.idx}&count=${top.count}'">
									<td style="width: 10%">인기! <i class="fa fa-fire-alt fa-lg"></i></td>
									<td style="width: 60%">${top.subject}</td>
									<td style="width: 20%">${top.wdate}</td>
									<td style="width: 10%">${top.count}</td>
								</tr>
								<c:forEach var="board" items="${result.list}" varStatus="loop">
									<tr style="cursor:pointer"
										onclick="location.href='${root}/board/detail?idx=${board.idx}&count=${board.count}'">
										<td style="width: 10%">${board.idx}</td>
										<td style="width: 60%">${board.subject}</td>
										<td style="width: 20%">${board.wdate}</td>
										<td style="width: 10%">${board.count}</td>
									</tr>
								</c:forEach>
								<c:if test="${empty result.list}">
									<tr>
										<td colspan="12" style="color: red;">게시글이 존재하지 않습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
	
						<c:if test="${pr.count != 0}">
							<nav style="width: 300px; margin: 0 auto;">
								<ul class="mt-5 pagination">
									<li
										class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
										<a class="page-link"
										href="<c:if test="${pr.prev}">${root}/?pageNo=${pr.beginPage - 1}</c:if>">Previous</a>
									</li>
	
									<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
										<c:choose>
											<c:when test="${i eq pr.pageNo}">
												<li class="page-item active"><a class="page-link"
													href="#1">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="${root}/?pageNo=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li
										class="page-item <c:if test="${not pr.next}">disabled</c:if>">
										<a class="page-link"
										href="<c:if test="${pr.next}">${root}/?pageNo=${pr.endPage + 1}</c:if>">Next</a>
									</li>
								</ul>
							</nav>
						</c:if>
	
					</div>
					<div class="col-sm-1"></div>
				</div>
			</div>
			<div style="height: 70px;"></div>
		</section>
        
        <!-- Contact-->
        <section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">실시간 채팅</h2>
				<h3 class="section-subheading text-muted">실시간으로 부동산 정보를 소통해보세요!</h3>
			</div>
				<div class="row align-items-stretch mb-5" style="justify-content:center">
					<div>
						<i style="color:white" class="fa fa-comments fa-5x"></i>
					</div>
				</div>
				<div class="text-center">
					<button class="btn btn-primary btn-xl text-uppercase"
						  onclick="location.href='${root}/chatPage'">채팅 시작하기</button>
				</div>
		</div>
	</section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">이 서비스를 제작한 팀원 소개</h3>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img style="height:250px" class="mx-auto rounded-circle" src="${root}/img/team1.jpg" alt="..." />
                            <h4>김수현</h4>
                            <p class="text-muted">BE / FE</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img style="height:250px"class="mx-auto rounded-circle" src="${root}/img/team2.jpg" alt="..." />
                            <h4>김재민</h4>
                            <p class="text-muted">BE / FE</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">SSAFY 5기 <br> 대전 4반 7팀 팀원입니다!</p></div>
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <%@ include file="./include/footer.jsp" %>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root}/js/scripts.js"></script>
    </body>
</html>
