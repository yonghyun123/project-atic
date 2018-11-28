<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
    <!-- Favicon -->
    <link rel="icon" href="/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>

<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/img/bg-img/24.jpg);">
            <h2>ABOUT US</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">

                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### About Area Start ##### -->
    <section class="about-us-area" style="margin-top: 20px;">
        <div class="container">
            <div class="row">
				<div class="card" style="width: 30rem; margin:20px;">
				<img class="card-img-top" src="/resources/img/project-image/1_et_1.png" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">내 정보</h5>
				    <h6 class="card-subtitle mb-2 text-muted">${user.nickname}</h6>
				  </div>
				</div>
            
                <div class="card"  style="width: 30rem; margin:20px;">
				  <div class="card-body">
				    <h5 class="card-title">상세 정보</h5>
				    <p class="card-text">${user.name}</p>
				    <p class="card-text">${user.phone}</p>
				  </div>
				  <ul class="list-group list-group-flush">
				  	<li class="list-group-item">실 계좌</li>
				    <li class="list-group-item">${user.acc_num}</li>
				    <li class="list-group-item">가상 계좌</li>
				    <li class="list-group-item">${user.vt_acc_num}</li>
				  </ul>
				</div>

				<div class="card" style="width: 30rem; margin:20px;">
				  <div class="card-body">
				    <h5 class="card-title">총 이자률</h5>
				    <c:set var="profit" value="${userStatus.totalProfit*100}"/>
				    <p class="card-text">${profit}%</p>
				    </div>
				    <div class="card-body">
				  	<h5 class="card-title">총 적금액</h5>
				  	<p class="card-text">	<fmt:formatNumber value="${userStatus.totalMoney}" pattern="#,###" />원</p>
					</div>				  
				</div>		
            </div>
        </div>
        <div class="container">
			<div class="row" >
				<div class="col-12" style="text-align: center;">
				<h2>나의 상세 적금 정보</h2>
				</div>
			</div>
			
			<div class="row col-12">
			  <ul class="nav nav-tabs" style="width: 100%">
			    <li class="active"><a data-toggle="tab" href="#deposit">적금현황</a></li>
			    <li><a data-toggle="tab" href="#graph">수익률 그래프</a></li>
			    <li><a data-toggle="tab" href="#comp-list">투자 기업 리스트</a></li>
			  </ul>
			  <div class="tab-content">
			    <div id="deposit" class="tab-pane fade in active">
				<div class="col-12">
	                   <!-- Section Heading -->
	                   <div class="section-heading">
	                       <h2>적금현황</h2>
	                       <p>나의 적금현황</p>
	                   </div>
	                   <p>당신의 적금현황을 보여드립니다. 여러 기업에 호감도와 적금을 투자하셔서 12개월 만기를 채우시면 기존 이율보다 높은 수익률을 느끼실 수 있습니다.</p>
	
	                   <!-- Progress Bar Content Area -->
	                   <div class="alazea-progress-bar">
	                       <!-- Single Progress Bar -->
	                       <div class="single_progress_bar">
	                           <p>만기 도달 개월수(%)</p>
	                           <div id="bar1" class="barfiller">
	                               <div class="tipWrap">
	                                   <span class="tip"></span>
	                               </div>
	                               <span class="fill" data-percentage="40.3"></span>
	                           </div>
	                       </div>
	                   </div>
	               </div>
			    </div>
			    <!-- 수익률 그래프 그려져야 하는 부분 -->
			    <div id="graph" class="tab-pane fade">
			      <h3>수익률 그래프</h3>
			      <div class="container">

				    <div class="row my-2">
				        <div class="col-md-12">
				            <div class="card">
				                <div class="card-body" style="width: 60%">
			                		<h4>월별 적립금액 / 월별 수익금</h4>
				                    <canvas id="chLine" height="200"></canvas>
				                </div>
				                <div class="card-body" style="width: 60%">
				                	<h4>월별 이자 상승률</h4>
				                    <canvas id="bar-chart-horizontal" width="800" height="450"></canvas>
				                </div>
				            </div>
				        </div>
				    </div>
				  </div>
			    </div>
			    
			    <!-- 투자한 기업 리스트 보여줘야 하는 부분 -->
			    <div id="comp-list" class="tab-pane fade">
			      <h3>투자 기업 리스트</h3>
			      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			    </div>
			  </div>
			</div>	
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="border-line"></div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- ##### About Area End ##### -->
  
    <!-- ##### All Javascript Files ##### -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    <!-- jQuery-2.2.4 js -->
    <script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <!-- <script src="/resources/js/bootstrap/bootstrap.min.js"></script> -->
    <!-- All Plugins js -->
    <script src="/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="/resources/js/active.js"></script>
    <!-- char.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
    
    <script type="text/javascript">
    
    /* 날짜계산하기 */
    function calculDate(){
    	var now = new Date();  
    	var year= now.getFullYear();  
    	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);  
    	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();  

    	alert(year + mon + day);  
    	alert(year + '년 ' + mon + '월 ' + day + '일');  
    	alert(year + '-'+ mon+ '-' + day); 
    }
    
    calculDate();
    
    
	 /*
	 javascript AJAX Service(read, put, post...)
	 created by yonghyun
	 */
	 var userStatusService = (function() {
			function add(reply, callback, error) {
				console.log("add reply...............");
				$.ajax({
					type : 'post',
					url : '/replies/new',
					data : JSON.stringify(reply),
					contentType : "application/json; charset=utf-8",
					success : function(result, status, xhr) {
						if (callback) {
							callback(result);
						}
					},
					error : function(xhr, status, er) {
						if (error) {
							error(er);
						}
					}
				})
			}

			function get(userId, callback, error) {
				$.get("/users/mypage/graph/"+userId, function(result) {
					if (callback) {
						callback(result);
					}

				}).fail(function(xhr, status, err) {
					if (error) {
						error();
					}
				});
			}

			return {
				add : add,
				get : get
			};

		})();
	 
	 /* AJAX 사용 */
	 userStatusService.get("test1", function(list){
		 // 월별 만기 환급액
		 var totalDepositMonth = [];
		 // 월별 적금액
		 var curDepositMonth = [];
		 // 월별 이자율
		 var profitMonth = [];
		 
		 list.graphList.forEach(function(v) {
		 	totalDepositMonth.push(v.totalMoney);
		 	curDepositMonth.push(v.curMoney);
		 	v.totalProfit = Number(v.totalProfit) * 100;
		 	profitMonth.push(v.totalProfit);
		 });
		 
		 totalDepoitGraph(curDepositMonth,totalDepositMonth);
		 profitGraph(profitMonth);
		 
	 })
	 
	 function totalDepoitGraph(depositDataset, totalDataset){
		 /* chart.js chart examples */
		 // chart colors
		 var colors = ['#007bff','#28a745','#333333','#c3e6cb','#dc3545','#6c757d'];
		 var chLine = document.getElementById("chLine");
		 /* large line chart */
		 
		 var chartData = {
		   labels: ["7월", "8월", "9월", "10월", "11월"],
		   datasets: [{
			 label: "월별 적금 금액",
		     data: depositDataset,
		     backgroundColor: 'transparent',
		     borderColor: colors[0],
		     borderWidth: 4,
		     pointBackgroundColor: colors[0]
		   },
		   {
			 label: "만기시 월별 환금 금액",
			 data: totalDataset,
		     backgroundColor: colors[3],
		     borderColor: colors[1],
		     borderWidth: 4,
		     pointBackgroundColor: colors[1]
		   }]
		 };
		 
		 /*누적금액 월평 금액 선 그래프  */
		 if (chLine) {
		   new Chart(chLine, {
		   type: 'line',

		   data: chartData,
		   options: {
		   	 title:{
		   		 display: true,
			     text: '월별 수익률 현황(원)'
		     },
		     scales: {
		       yAxes: [{
		         ticks: {
		           beginAtZero: false
		         }
		       }]
		     },
		     
		     legend: {
		       display: true
		       
		     },
	         tooltips: {
	            mode: 'label',
	            label: 'mylabel',
	            callbacks: {
	                label: function(tooltipItem, data) {
	                    return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }, 
                },
		     }
		   }
		   });
	 	}
	 }
	 
	 function profitGraph(profitDataset){
		 /* 수평 바 chart 이윤 증가율 */
		 new Chart(document.getElementById("bar-chart-horizontal"), {
		    type: 'horizontalBar',
		    data: {
		      labels: ["7월", "8월", "9월", "10월", "11월"],
		      datasets: [
		        {
		          label: "profit (%)",
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
		          data: profitDataset
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      scales: {
			       xAxes:[{
			    	 ticks:{
			    		 min:2.9
			    	 }   
			       }]
			     },
		      title: {
		        display: true,
		        text: '월별 이자 증가율(%)'
		        
		      }
		    }
		});
	 }
    </script>
</body>
</html>