

// 일간
$(document).ready(function chart1() {

	var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
	var chartData = [];
	// 차트 생성
	function createChart() {
		var ctx = document.getElementById('myChart').getContext('2d');
		LineChartDemo = Chart.Line(ctx, {
			data : lineChartData,
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}, 
				legend: {
		            display: false //라벨가리기
		          }
			}
		});
	}

	// json 데이터 가져오기
	$.ajax({
		url : "http://localhost:8282/rest/chart_data",
		type : "post",
		cache : false,
		dataType : "json",
		/* data: "", */

		success : function(data) {
			$.each(data, function(key, value) {
				
				chartLabels.push(value.st_date);
				chartData.push(value.st_visitor_num);
				
				
			});
			
			//최근 값 7개가 최근순으로 불러와지므로 reverse를 이용해 역순으로 바꿔줌
			chartLabels.reverse();
			chartData.reverse();
			// ajax로 불러온 데이터 콘솔에 출력해서 확인
			console.log(chartLabels);
			console.log(chartData);
			createChart();

		},

		error : function(request, status, error) {
			console.log(request.responseText);
			console.log(error);

		}

	});

	var lineChartData = {
			
		
		labels : chartLabels,
		datasets : [ {
			legend : {
				display : false,
				position : 'bottom'
			},
			label : '방문자수',
			backgroundColor : 'transparent',
			borderColor : '#FAB79E',
			data : chartData
		} ],

		// 옵션
	/*	options: {
	          legend: {
	            display: false
	          }
		}*/

	}
	
});

// 주간
$(document).ready(
		function chart2() {

			var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
			var chartData = [];
			// 차트 생성
			function createChart() {
				var ctx = document.getElementById('myChart2').getContext('2d');
				LineChartDemo = Chart.Line(ctx, {
					data : lineChartData,
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}, 
						legend: {
				            display: false //라벨가리기
				          }
					}
				});
			}

			// json 데이터 가져오기
			$.ajax({
				url : "http://localhost:8282/rest/chart_data",
				type : "post",
				cache : false,
				dataType : "json",
				/* data: "", */

				success : function(data) {
					$.each(data, function(key, value) {
						
						chartLabels.push(value.st_date);
						chartData.push(value.st_visitor_num);
						
						
					});
					
					//최근 값 7개가 최근순으로 불러와지므로 reverse를 이용해 역순으로 바꿔줌
					chartLabels.reverse();
					chartData.reverse();
					// ajax로 불러온 데이터 콘솔에 출력해서 확인
					console.log(chartLabels);
					console.log(chartData);
					createChart();

				},

				error : function(request, status, error) {
					console.log(request.responseText);
					console.log(error);

				}

			});

			var lineChartData = {
					
				
				labels : chartLabels,
				datasets : [ {
					legend : {
						display : false,
						position : 'bottom'
					},
					label : '방문자수',
					backgroundColor : 'transparent',
					borderColor : '#FAB79E',
					data : chartData
				} ],

				// 옵션
			/*	options: {
			          legend: {
			            display: false
			          }
				}*/

			}
			
});

// 월간
$(document).ready(
		function chart3() {

			var ctx = document.getElementById('myChart3').getContext('2d');
			var chart = new Chart(ctx, {
				// 차트 종류를 선택
				type : 'line',
				// 차트를 그릴 데이타
				data : {
					labels : [ 'January', 'February', 'March', 'April', 'May',
							'June', 'July' ],
					datasets : [ {
						label : '게시글 수',
						backgroundColor : 'transparent',
						borderColor : '#7981B3',
						data : [ 0, 10, 15, 22, 34, 44, 67 ],
					/* lineTension : 0.1 //직선 곡선 */
					} ]
				},

				// 옵션
				options : {
					legend : {
						display : false,
					/* position : 'bottom' */
					}
				}
			});

		});

// 연간
$(document).ready(
		function chart4() {

			var ctx = document.getElementById('myChart4').getContext('2d');
			var chart = new Chart(ctx, {
				// 차트 종류를 선택
				type : 'line',
				// 차트를 그릴 데이타
				data : {
					labels : [ 'January', 'February', 'March', 'April', 'May',
							'June', 'July' ],
					datasets : [ {
						label : '게시글 수',
						backgroundColor : 'transparent',
						borderColor : '#7981B3',
						data : [ 0, 10, 15, 22, 34, 44, 67 ],
					/* lineTension : 0.1 //직선 곡선 */
					} ]
				},

				// 옵션
				options : {
					legend : {
						display : false,
					/* position : 'bottom' */
					}
				}
			});

		});
