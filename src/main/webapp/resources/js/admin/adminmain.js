$(function(){
	
    var context = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(context, {
	    type: 'line', // 차트의 형태
	    data: { // 차트에 들어갈 데이터
	        labels: [
	            //x 축
	            'Tue','Wed','Thu','Fri','Sat','Sun','Mon'
	        ],
	        datasets: [
	            { //데이터
	                label: '등록 작가 수', //차트 제목
	                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                data: [
	                	1, 3, 2, 5, 10, 5, 4 //x축 label에 대응되는 데이터 값
	                ],
	                backgroundColor: [
	                    //색상
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)'
	                ],
	                borderColor: [
	                    //경계선 색상
	                    'rgba(255, 99, 132, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)',
	                    'rgba(255, 159, 64, 1)'
	                ],
	                borderWidth: 1 //경계선 굵기
	            } ,
	            {
	                label: '등록 작품 수',
	                fill: false,
	                data: [
	                    5, 8, 3, 10, 15, 18, 10
	                ],
	                backgroundColor: '#ffcc00',
	                borderColor: '#f59b25'
	            } 
	        ]
	    },
	    options: {
	    	title : {
	    		display:true,
	    		text : 'artistar 등록 Artist & Art',
	    		fontSize : 25,
	    		fontColor : '#AAA',
	    		fontStyle : 'normal'
	    	},
	        scales: {
	            yAxes: [
	                {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                }
	            ]
	        }
	    }
	});
	
	var context = document.getElementById('myChart2').getContext('2d');
	var myChart = new Chart(context, {
		type: 'bar', // 차트의 형태
		data: { // 차트에 들어갈 데이터
			labels: [
				//x 축
				'Tue','Wed','Thu','Fri','Sat','Sun','Mon'
				],
				datasets: [
					{ //데이터
						label: '회원 활동 수', //차트 제목
						fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data: [
							6,4,10,12,8,19,15 //x축 label에 대응되는 데이터 값
							],
							backgroundColor: [
								//색상
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
								],
								borderColor: [
									//경계선 색상
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)'
									],
									borderWidth: 1 //경계선 굵기
					}
					]
		},
		options: {
	    	title : {
	    		display:true,
	    		text : 'artistar 회원 활동',
	    		fontSize : 25,
	    		fontColor : '#AAA',
	    		fontStyle : 'normal'
	    	},
			scales: {
				yAxes: [
					{
						ticks: {
							beginAtZero: true
						}
					}
					]
			},
		}
	});
	
	
	var artinfoNum=$("#artinfoNum").val();
	$(".deletecont").fadeIn();
	$(".update").click(function(){
		location.href="artUpdate?artinfoNum="+artinfoNum;
	})
	
	$(".ko_name").click(function(){
		console.log("눌렸소");
		$(".profileImageUpdateBtn").hide();
		$(".profileImageUpdate").show();
	})
	
	 
	
});

	function loadImg(f) {
    console.log(f.files); 
    if (f.files.length != 0 && f.files[0] != 0) {
        var reader = new FileReader();
        reader.readAsDataURL(f.files[0]);
        reader.onload = function(e) {
            $("#profileImgView").attr('src', e.target.result);
        }
    } 
}
	
/* global bootstrap: false */
(function () {
  'use strict'
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
})
