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
        <title>Agency - Start Bootstrap Theme</title>
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
        <!-- Masthead-->
       <!-- <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Enjoy Our Service!</div>
                <div class="masthead-heading text-uppercase">부동산 실거래 검색 페이지</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">서비스 이용하기</a>
            </div>
        </header> -->
        
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4" onclick="location.href='aptdeal/search'">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-map-marked-alt fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">부동산 실거래 정보</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4" onclick="location.href='interest/Areaofinterest'">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-heart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">나의 관심지역 살펴보기</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4" onclick="location.href='${root}/chartPage'">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-search-dollar fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">통계비교 해보기</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
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
						<button class="btn btn-primary" onclick="location.href='${root}/board/mvwrite'">공지사항
							글쓰기</button>
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
								<c:forEach var="board" items="${result.list}" varStatus="loop">
									<tr
										onclick="location.href='${root}/board/detail?idx=${board.idx}&&count=${board.count}'">
										<td style="width: 20%">${board.idx}</td>
										<td style="width: 30%">${board.subject}</td>
										<td style="width: 30%">${board.wdate}</td>
										<td style="width: 20%">${board.count}</td>
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
								<ul class="mt-5 pagination pagination-lg">
									<li
										class="page-item <c:if test="${not pr.prev}">disabled</c:if>">
										<a class="page-link"
										href="<c:if test="${pr.prev}">${root}/board/board?pageNo=${pr.beginPage - 1}</c:if>">Previous</a>
									</li>
	
									<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
										<c:choose>
											<c:when test="${i eq pr.pageNo}">
												<li class="page-item active"><a class="page-link"
													href="#1">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="${root}/board/board?pageNo=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li
										class="page-item <c:if test="${not pr.next}">disabled</c:if>">
										<a class="page-link"
										href="<c:if test="${pr.next}">${root}/board/board?pageNo=${pr.endPage + 1}</c:if>">Next</a>
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
        <!-- About-->
        <!-- <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2009-2011</h4>
                                <h4 class="subheading">Our Humble Beginnings</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>March 2011</h4>
                                <h4 class="subheading">An Agency is Born</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>December 2015</h4>
                                <h4 class="subheading">Transition to Full Service</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>July 2020</h4>
                                <h4 class="subheading">Phase Two Expansion</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                Be Part
                                <br />
                                Of Our
                                <br />
                                Story!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section> -->
        <!-- Contact-->
        <section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">실시간 채팅</h2>
				<h3 class="section-subheading text-muted">실시간으로 부동산 정보를 소통해보세요!</h3>
			</div>
				<div class="row align-items-stretch mb-5">
					<div>
						<!-- 여기에 채팅창 구현  -->

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
                            <img class="mx-auto rounded-circle" src="assets/img/team/1.jpg" alt="..." />
                            <h4>김수현</h4>
                            <p class="text-muted">BE / FE</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/img/team/2.jpg" alt="..." />
                            <h4>김재민</h4>
                            <p class="text-muted">BE / FE</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                </div>
            </div>
        </section>
        <!-- Clients-->
        <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/microsoft.svg" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/google.svg" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/facebook.svg" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/ibm.svg" alt="..." /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <%@ include file="./include/footer.jsp" %>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="${root}/js/scripts.js"></script>
    </body>
</html>
