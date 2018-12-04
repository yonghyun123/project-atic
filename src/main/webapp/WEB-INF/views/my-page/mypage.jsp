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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>

<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <div style="height: 90px"></div>
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/img/bg-img/24.jpg);">
            <h2>My Page</h2>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### About Area Start ##### -->
    <section class="about-us-area" style="margin-top: 20px;">
        <div class="row" >
          <div class="col-12 text-center">
              <h2>내 정보</h2>
          </div>
        </div>
        <div class="container">
            <div class="row">
              <div class="card-area">
				<div class="card card-inform">
                  <ul class="list-group list-group-flush mb-0">
                    <li class="list-group-item mt-0"><h4>프로필 사진</h4></li>
                  </ul>
				  <div class="profile-row">
                    <img class="card-img-top profile-img" src="/user/profile/${user.id }" alt="Card image cap">
                  </div>
				  <div class="card-body">
				    <div class="uploadDiv">
                      <p class="text-center" id="upload-text">.png 파일만 업로드 가능합니다.</p>
                      <input type="file" name="uploadFile" id="upload-form" multiple>
                      <button id="uploadBtn" disabled>Upload</button>
                    </div>
                  </div>
				</div>
            
                <div class="card card-inform">
                  <ul class="list-group list-group-flush mb-0">
                    <li class="list-group-item mt-0"><h4>상세 정보</h4></li>
                  </ul>
				  <div class="card-body pt-0">
				    <h4 class="card-title">이름</h4>
				    <p class="card-text">${user.name}</p>
                    <h4 class="card-title">전화번호</h4>
				    <p class="card-text">${user.phone}</p>
                    <h4 class="card-title">닉네임</h4>
                    <p class="card-text">${user.nickname}</p>
                    <h4 class="card-title">실 계좌</h4>
                    <p class="card-text">${user.acc_num}</p>
                    <h4 class="card-title">가상 계좌</h4>
                    <c:choose>
                      <c:when test="${empty user.vt_acc_num }">
                        <p class="card-text">개설된 가상계좌가 없습니다.</p>
                      </c:when>
                      <c:otherwise>
                        <p class="card-text">${user.vt_acc_num}</p>
                      </c:otherwise>
                    </c:choose>
				  </div>
				</div>

				<div class="card card-inform">
                  <ul class="list-group list-group-flush mb-0">
                    <li class="list-group-item mt-0"><h4>투자 정보</h4></li>
                  </ul>
				  <div class="card-body pt-0">
				    <h4 class="card-title">총 이자율</h4>
				    <c:set var="profit" value="${userStatus.totalProfit*100}"/>
				    <p class="card-text" style="color: blue">${profit}%</p>
				    </div>
				    <div class="card-body">
				  	<h4 class="card-title">총 적금액</h4>
				  	<p class="card-text" style="color: blue">
                    <c:choose>
                      <c:when test="${empty userStatus.totalMoney }">
                        0원
                      </c:when>
                      <c:otherwise>
                        <fmt:formatNumber value="${userStatus.totalMoney}" pattern="#,###" />원</p>
                      </c:otherwise>
                    </c:choose>
                      
					</div>				  
				</div>	
              </div>	
            </div>
        </div>
        <div>
          <div class="container">
            <div class="col-10 my-deposit-inform">
    			<div class="row" >
    				<div class="col-12 text-center">
    				  <h2>나의 상세 적금 정보</h2>
    				</div>
    			</div>
    			
    			<div class="row">
    			  <ul class="nav nav-tabs" style="width: 100%">
    			    <li class="active"><a data-toggle="tab" href="#deposit">적금현황</a></li>
    			    <li><a data-toggle="tab" href="#graph">수익률 그래프</a></li>
    			    <li><a data-toggle="tab" href="#comp-list">투자 기업 리스트</a></li>
    			  </ul>
    			  <div class="tab-content" style="width: 100%">
    			    <div id="deposit" class="tab-pane fade in active">
    				<div class="col-12">
    	                   <!-- Section Heading -->
    	                   <div class="section-heading">
    	                       <h2>나의 적금현황</h2>
    	                   </div>
    	                   <p>당신의 적금현황을 보여드립니다. 여러 기업에 호감도와 적금을 투자하셔서 12개월 만기를 채우시면 기존 이율보다 높은 수익률을 느끼실 수 있습니다.</p>
    	
    	                   <!-- Progress Bar Content Area -->
                           <p>만기 도달 개월수(%)</p>
    	                   <div class="progress">
    						  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" id="prog-date" aria-valuemin="0" aria-valuemax="100" style="width:50%">
    						    50% Complete (info)
    						  </div>
    						</div>
    	               </div>
    			    </div>
    			    <!-- 수익률 그래프 그려져야 하는 부분 -->
    			    <div id="graph" class="tab-pane fade">
    			      <h3 class="ml-15">수익률 그래프</h3>
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
    			      <div class="container">
      				    <h2>기간 검색</h2>
                        <div class="col-md-12 pl-0 mb-3">
      				      <div class="input-group input-group-sm" style="width: 15%; display: inline-block;" >
      				          <label for="fromDate">시작일</label>
      				        <input type="text" class="form-control" name="fromDate" id="fromDate" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      				      </div>
  				
    				      <div class="input-group input-group-sm" style="width: 15%; display: inline-block;">
  				            <label for="toDate">종료일</label>
  		       	            <input type="text" class="form-control" name="toDate" id="toDate" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
  				          </div>
                          <input type="button" class='btn btn-success btn-block' value="검색하기" id="send-date-btn"/>
                        </div>
    				    <table class="table table-striped">
      				      <thead>
      				        <tr>
      				          <th>투자한 날짜</th>
      				          <th>사업 주제</th>
      				          <th>투자한 기업</th>
      				          <th>투자한 적금 금액</th>
      				          <th>모금 달성률</th>
      				        </tr>
      				      </thead>
    				      <tbody id="table-body-in">
    				      <!-- 여기에 들어가면돼 -->
    				      </tbody>
    				    </table>
    				  </div>
    			    </div>
    			  </div>
    			</div>	
            </div>
          </div>
      </div>
    </section>
    
    <!-- ##### About Area End ##### -->
  
    <!-- ##### All Javascript Files ##### -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    <!-- Popper js -->
    <script src="/resources/js/bootstrap/popper.min.js"></script>
    <!-- All Plugins js -->
    <script src="/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="/resources/js/active.js"></script>
    <!-- Common js -->
    <script src="/resources/js/common.js"></script>
    <!-- char.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
    <script type="my-template" id="table-list">
	<tr>
		<td>{createDate}</td>
		<td>{name}</td>
		<td>{company}</td>
		<td>{deposit}</td>
		<td>{percentage}</td>
	</tr>
	</script>
    <script type="text/javascript">
    var userId = "${loginId}";
    
    /* 날짜계산하기 */
    function calculDate(){
    	var now = new Date();  
    	var year= now.getFullYear();  
    	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);  
    	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();  
    	var curDate = year + '-' + mon + '-' + day;
    	var lastDate = "${date}";
        var arr1 = curDate.split('-');
        var arr2 = lastDate.split('-');
        var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
        var dat2 = new Date(parseInt(arr2[0]) + 1, arr2[1], arr2[2]);
        var diff = dat2 - dat1;
        var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
        var difDate = parseInt(diff/currDay);
        const datePerc = Math.round((365 - difDate) / 365 * 100,2) + "%";
        
        //percent 동적삽입
        $("#prog-date").css("width",datePerc);
        $("#prog-date").text(datePerc+"달성!");
    }
    
 	//오늘 날짜를 출력
 	function datePickFunc(){
 	    $("#today").text(new Date().toLocaleDateString());
 	    //datepicker 한국어로 사용하기 위한 언어설정
 	    $.datepicker.setDefaults($.datepicker.regional['ko']); 
 	    
 	    // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
 	    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
 	    //시작일.
 	    $('#fromDate').datepicker({
 	        dateFormat: "yy-mm-dd",             // 날짜의 형식
 	        changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
 	        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
 	        onClose: function( selectedDate ) {    
 	            // 시작일(fromDate) datepicker가 닫힐때
 	            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
 	            $("#toDate").datepicker( "option", "minDate", selectedDate );
 	        }                
 	    });

 	    //종료일
 	    $('#toDate').datepicker({
 	        dateFormat: "yy-mm-dd",
 	        changeMonth: true,
 	        //minDate: 0, // 오늘 이전 날짜 선택 불가
 	        onClose: function( selectedDate ) {
 	            // 종료일(toDate) datepicker가 닫힐때
 	            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
 	            $("#fromDate").datepicker( "option", "maxDate", selectedDate );
 	        }                
 	    });
 	};
 	
 	function sendFilterList(){
 		$('#send-date-btn').click(function(){
 			
 			const startDate = $('#fromDate').val();
 			const endDate = $('#toDate').val();

 			
 			if(startDate.trim().length == 0 || endDate.trim().length == 0){
 				// 검색조건이 비어있을때 그냥 전체 리스트 ajax로 요청
 				//userId 바꿔줘야해
 				 userStatusService.getCompanyList(userId, function(list){
 					 console.log(list.companyList);
 					 companyListTemplate(list.companyList);
 				 });
 			} else if(startDate && endDate){
 	 			var date = {
 	 					startDate: startDate,
 	 					endDate: endDate
 	 			};
 	 			//userId 바꿔줘야해
 				 userStatusService.postSearchList(userId, date, function(list){
 					 console.log(list.companyList);
 					 companyListTemplate(list.companyList);
 				 });
 			}
 			
 			$('#toDate').val('');
 			$('#fromDate').val('');
 		})
 	}
 	calculDate();
    datePickFunc();
    sendFilterList();
    
	 /*
		 javascript AJAX Service(read, put, post...)
		 created by yonghyun
	 */
	 var userStatusService = (function() {
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
			};
			
			function getCompanyList(userId, callback, error){
				$.get("/users/mypage/corlist/"+userId, function(result){
					if(callback){
						callback(result);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
			};
			
			function postSearchList(userId, data, callback, error){
				$.ajax({
					type : 'post',
					url : "/users/mypage/corlist/"+userId,
					data : JSON.stringify(data),
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

			return {
				get : get,
				getCompanyList : getCompanyList,
				postSearchList : postSearchList
			};

		})();
	 
	 /* AJAX 사용 */
	 //userId가 들어가야함
	 userStatusService.get(userId, function(list){
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
	 
	 /*Ajax로 기업리스트 불러오기 */
	 //userId가 들어가야함
	 userStatusService.getCompanyList(userId, function(list){
		 console.log(list.companyList);
		 companyListTemplate(list.companyList);
	 });
	 
	 /* 기업 리스트 html template */
	 function companyListTemplate(companyList){
		 var originHtml = document.querySelector('#table-list').innerHTML;
		 var newHtml = '';
		 companyList.forEach(function(v) {
		 	newHtml += originHtml.replace('{createDate}', v.createDate)
		 					     .replace('{name}', v.name)
		 					     .replace('{deposit}', v.deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
		 					     .replace('{company}', v.company)
		 					     .replace('{percentage}', Math.round((Number(v.curPrice)/Number(v.goal))*100) + "%");
		 });
		 document.querySelector('#table-body-in').innerHTML = newHtml;
	 }
	 
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
	 
	 /* 프로필 사진 업로드 메서드 */
	 $("#uploadBtn").on("click", function(e) {
		 var formData = new FormData();
		 var inputFile = $("input[name='uploadFile']");
		 var files = inputFile[0].files;
		 var url = '/upload/profile/${loginId }';
		 
		 formData.append("uploadFile", files[0]);
		 $.ajax({
			url: url,
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result) {
				window.location.reload();
				sessionStorage.flag = "popup-message-change-profile-success";
			}
		});
	 })
	 
	 /* 프로필 사진 확장자 체크 */
	 $("#upload-form").on("change", function(e) {
		 var inputFile = $("#upload-form").val();
		 inputFile = inputFile.slice(inputFile.indexOf(".") + 1).toLowerCase();
		 if(inputFile == 'png') {
			 $("#uploadBtn").attr("disabled", false);
		 } else {
			 $("#upload-form").val('');
			 $("#uploadBtn").attr("disabled", true);
			 $("#upload-text").css("color", "red");
			 
		 }
	 })
    </script>
</body>
</html>