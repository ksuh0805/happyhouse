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
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>통계 기능</h1>
	</div>
	<div class="row" style="padding-left: 20px">
		<div class="col-6">
			<div class="mt-3 md-3">
				<h2>사용자 분류별 관심 키워드 통계</h2>
				<div class="mb-3"
					style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			</div>
			<div class="row">
				<div class="col-6">
					<canvas id="menchart"></canvas>
				</div>
				<div class="col-6">
					<canvas id="womenchart"></canvas>
				</div>
			</div>
		</div>
		<script>
		
		var arrw = JSON.parse('${womenjson}');
		var arrm = JSON.parse('${menjson}');
		console.log('${json10}');
		drawchart(arrm, 'menchart', 'bar', '남성');
		drawchart(arrw, 'womenchart', 'radar', '여성');
		
		function drawchart(result, chartid, ctype, name){
			//차트 값 생성
			var labelsc = new Array();
			var datac = new Array();
			for(let i = 0; i < result.length; i++){
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
	                scales : {
                    	yAxes: [{ ticks: { beginAtZero:true } }]
		            }
		        }
			});
		}
		</script>
		
		
		
		
		<div class="col-6">
			<div class="mt-3 md-3">
				<h2>전체 사용자 관심 키워드 살펴보기</h2>
				<div class="mb-3"
					style="border-bottom: 2px solid rgb(233, 232, 232);"></div>
			</div>
			<div>
				<div>
					<canvas id="myChart"></canvas>
				</div>

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
								label : '관심 키워드 Top5',
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
                            scales : {
                                yAxes: [{ ticks: { beginAtZero:true } }]

                        }
                    }
					});
				</script>
			</div>
		</div>
	</div>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>