
$(document).ready(function chart1() {

	var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
	var chartData = [];
	// 차트 생성
	function createChart() {
		var ctx = document.getElementById('myChart').getContext('2d');
		new Chart(ctx, {
			type : 'pie',
			data : pieChartData,
			options : {
				/*scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}, */
				legend: {
		            position: 'right'
		          }
			}
		});
		
	}

	// json 데이터 가져오기
	$.ajax({
		url : "http://localhost:8282/rest/wd_data",
		type : "post",
		cache : false,
		dataType : "json",
		/* data: "", */

		success : function(data) {
			$.each(data, function(key, value) {
				
				chartLabels.push(value.W_REASON);
				chartData.push(value.W_NO_COUNT);
				
				
			});
		
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

	var pieChartData = {
			
		
		labels : chartLabels,
		datasets : [ {
			legend : {
				display : false,
				position : 'bottom'
			},
			label : '방문자수',
			backgroundColor : 'transparent',
			borderColor : 'white',
			fillColor : "#FAB79E", 
			strokeColor : "rgba(220,220,220,1)", 
			pointColor : "rgba(220,220,220,1)", 
			pointStrokeColor : "#fff", 
			pointHighlightFill : "#fff", 
			pointHighlightStroke : "rgba(220,220,220,1)", 
			backgroundColor: [ "#FAB79E", "#5C85AD", "#B2D6FA", "#7981B3", "#9578BF" ],
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

