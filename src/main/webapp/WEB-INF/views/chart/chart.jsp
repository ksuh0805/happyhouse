<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header2.jsp"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script src="http://d3js.org/d3.v3.min.js"></script>
<script
	src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
	type="text/JavaScript"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap" rel="stylesheet">
<script src="${root}/js/mainhref.js"></script>
<title>공공칠방</title>
</head>
<script>
$(document).ready(function(){
	
	// Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#chartpage').offset().top
    }, 'slow');
});
</script>
<body>
<h1 style="text-align:center"><kbd>실시간 관심 키워드 살펴보기</kbd></h1>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" id="chartpage">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#home">전체 사용자 관심 키워드</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu1">성별 통계</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu2">연령별 통계</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu3">직업별 통계</a></li>
	</ul>
	<br>

	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane container active" id="home">
			<div style="width: 100%">
				<h2>전체 사용자 관심 키워드 살펴보기</h2>

				<div class="mb-3"
					style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			</div>
			<div class="row" style="padding-left: 20px">
				<div class="col-6">
					<canvas id="myChart"></canvas>

				</div>
				<div class="col-6">
					<h2>워드 클라우드</h2>
					<div id="wordcloud" align="center"></div>
				</div>


				<script>
					var wordcloudlist = $.ajax({

						type : "GET",
						url : "wordcloudtest.do",
						dataType : "json",
						contentType : "application/json; charset:UTF-8",
						async : false
					}).responseText;

					var wordcloudtest = [ {
						"word" : "맨유",
						"mount" : 40
					}, {
						"word" : "맨사타",
						"mount" : 15
					}, {
						"word" : "첼시",
						"mount" : 10
					}, {
						"word" : "토트넘",
						"mount" : 35
					}, {
						"word" : "리버풀",
						"mount" : 30
					}, {
						"word" : "인천유나이티드",
						"mount" : 20
					} ];

					var x = JSON.parse(wordcloudlist);
					var y = wordcloudtest;

					console.log("Json데이터 ", x)
					console.log("12", y)

					var color = d3.scale.linear() //선형적인 스케일로 표준화를 시킨다.
					.domain([ 0, 1, 2, 3, 4, 5, 6, 8, 10, 20, 100 ])//데이터의 범위, 입력 크기
					.range([ "#c71585", "#ba55d3", "#4169e1", "#ff4500" ,"#008b8b", "#6495ed", "#40e0d0", "#ff00ff", "#dc143c", "#a52a2a", "#1e90ff", "#48d1cc", "#777", "#666", "#555", "#444", "#333", "#222"]);//표시할 범위, 출력 크기[0.50]
					//ex)"#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"

					d3.layout.cloud().size([ 600, 300 ]) //[width,height] [800, 300]
					.words(x).rotate(0).fontSize(function(d) {
						return d.mount;
					}).on("end", draw).start();

					function draw(words) {
						d3.select("#wordcloud").append("svg")//wordcloud 테이블에 svg를 붙이고
						.attr("width", 650) //850  350
						.attr("height", 350).attr("class", "wordcloud").append(
								"g").attr("transform", "translate(300, 150)") //320  200
						.selectAll("text").data(words).enter().append("text")
								.style("font-family", 'Jua')
								.style("font-size", function(d) {
									return d.mount + "px";
								}).style("fill", function(d, i) {
									return color(i);
								}).attr(
										"transform",
										function(d) {
											return "translate(" + [ d.x, d.y ]
													+ ")rotate(" + d.rotate
													+ ")";
										}).text(function(d) {
									return d.word;
								});
					}
				</script>

				<script>
					var labels = new Array();
					var data = new Array();
					<c:forEach items="${chart2}" var="chart2" >
					var json = new Object();
					labels.push("${chart2.word}");
					data.push("${chart2.countWord}");
					</c:forEach>
					var ctx = document.getElementById('myChart');
					var myChart = new Chart(ctx, {
						type : 'bar',
						data : {
							labels : labels,
							datasets : [ {
								label : '전체 관심 키워드 Top5',
								data : data,
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)' ],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							"scales": {
				                "yAxes": [{
				                    "ticks": {
				                        "beginAtZero": true
				                    }
				                }],
				                "xAxes":[]
				            }
				        }
					});
				</script>
			</div>
		</div>
		<div class="tab-pane container fade" id="menu1">
			<h2>성별 분류별 관심 키워드 통계</h2>
			<div class="mb-3"
				style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			<label for="genderchart">성별 통계</label>
			<div class="row" id="genderchart">
				<div class="col-6">
					<canvas id="menchart"></canvas>
				</div>
				<div class="col-6">
					<canvas id="womenchart"></canvas>
				</div>
			</div>

		</div>
		<div class="tab-pane container fade" id="menu2">
			<h2>연령 분류별 관심 키워드 통계</h2>
			<div class="mb-3"
				style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			<label for="genderchart">연령별 통계</label>
			<div class="row" id="agechart">
				<div class="col-4">
					<canvas id="chart10"></canvas>
				</div>
				<div class="col-4">
					<canvas id="chart20"></canvas>
				</div>
				<div class="col-4">
					<canvas id="chart30"></canvas>
				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<canvas id="chart40"></canvas>
				</div>
				<div class="col-4">
					<canvas id="chart50"></canvas>
				</div>
				<div class="col-4">
					<canvas id="chart60"></canvas>
				</div>
			</div>

		</div>
		<div class="tab-pane container fade" id="menu3">
			<h2>직업 분류별 관심 키워드 통계</h2>
			<div class="mb-3"
				style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			<label for="jobchart">직업별 통계</label>
			<div class="col-auto my-1">
				<label class="mr-sm-2" for="job">직업 분류 선택</label> <select
					class="custom-select mr-sm-2" id="job"
					onchange="jobchange(this.value)">
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
			<div>
				<canvas id="jobchart"></canvas>
			</div>

		</div>
	</div>

	<script>
		var arrw = JSON.parse('${womenjson}');
		var arrm = JSON.parse('${menjson}');
		var arr10 = JSON.parse('${json10}');
		var arr20 = JSON.parse('${json20}');
		var arr30 = JSON.parse('${json30}');
		var arr40 = JSON.parse('${json40}');
		var arr50 = JSON.parse('${json50}');
		var arr60 = JSON.parse('${json60}');
		var arrjob = JSON.parse('${studentjson}');
		var typelist = [ 'bar', 'line', 'radar' ];
		var ccolor = [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
				'rgba(153, 102, 255, 0.2)', ];
		var bcolor = [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)', ];
		drawchart(arrm, 'menchart', typelist[Math.floor(Math.random() * 3)],
				'남성');
		drawchart(arrw, 'womenchart', typelist[Math.floor(Math.random() * 3)],
				'여성');
		drawchart(arr10, 'chart10', typelist[Math.floor(Math.random() * 3)],
				'10대');
		drawchart(arr20, 'chart20', typelist[Math.floor(Math.random() * 3)],
				'20대');
		drawchart(arr30, 'chart30', typelist[Math.floor(Math.random() * 3)],
				'30대');
		drawchart(arr40, 'chart40', typelist[Math.floor(Math.random() * 3)],
				'40대');
		drawchart(arr50, 'chart50', typelist[Math.floor(Math.random() * 3)],
				'50대');
		drawchart(arr60, 'chart60', typelist[Math.floor(Math.random() * 3)],
				'60대');
		drawchart(arrjob, 'jobchart', 'doughnut',
				'학생');

		function jobchange(job) {
			if (job == '학생')
				arrjob = JSON.parse('${studentjson}');
			else if (job == '무직')
				arrjob = JSON.parse('${nojobjson}');
			else if (job == '회사원')
				arrjob = JSON.parse('${bussinessjson}');
			else if (job == '엔지니어')
				arrjob = JSON.parse('${engineerjson}');
			else if (job == '공무원')
				arrjob = JSON.parse('${publicjson}');
			else if (job == '자영업')
				arrjob = JSON.parse('${selfjson}');
			else if (job == '전문직')
				arrjob = JSON.parse('${projson}');
			else if (job == '주부')
				arrjob = JSON.parse('${housejson}');
			else if (job == '프리랜서')
				arrjob = JSON.parse('${freejson}');
			else if (job == '교사')
				arrjob = JSON.parse('${teacherjson}');
			else if (job == '농수산업')
				arrjob = JSON.parse('${farmjson}');
			else if (job == '기타')
				arrjob = JSON.parse('${etcjson}');
			drawchart(arrjob, 'jobchart', 'doughnut', job);
		}

		function drawchart(result, chartid, ctype, name) {
			//차트 값 생성
			var labelsc = new Array();
			var datac = new Array();
			for (let i = 0; i < result.length; i++) {
				labelsc.push(result[i].word);
				datac.push(result[i].countWord);
			}
			var ctxc = document.getElementById(chartid);
			var myChartc = new Chart(ctxc, {
				type : ctype,
				data : {
					labels : labelsc,
					datasets : [ {
						label : name + ' 관심 키워드 Top5',
						data : datac,
						backgroundColor : [
								ccolor[Math.floor(Math.random() * 5)],
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)', ],
						borderColor : [ bcolor[Math.floor(Math.random() * 5)],
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)', ],
						borderWidth : 1
					} ]
				},
				options : {
					"scales": {
		                "yAxes": [{
		                    "ticks": {
		                        "beginAtZero": true
		                    }
		                }],
		                "xAxes":[]
		            }
		        }
			});
		}
	</script>



	<%@ include file="../include/footer.jsp"%>
</body>
</html>