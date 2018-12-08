<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modal/adminCompany.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Simple Tables</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        
            <!-- Favicon -->
	    <link rel="icon" href="/resources/img/core-img/favicon.ico">
	
	    <!-- Core Stylesheet -->
	    <link rel="stylesheet" href="/resources/css/style.css">
	    
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="/resources/css/common.css">
    	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    
    </head>
    <body class="container">
        <%@ include file="/WEB-INF/views/modal/logout.jsp"%>
        <!-- header logo: style can be found in header.less -->
        <div class="wrapper row-offcanvas row-offcanvas-left col-md-10" style="margin: 0 auto;">
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    <img alt="" src="/resources/img/logoss.png" style="width: 300px; margin-left: -2.5%;"><br>
                                    <h4 class="mt-15 mb-15 mr-15" style="display: inline-block;">관리자 페이지</h4>
                                    <button class="admin-logout" id="logout">로그아웃</button>
                                </header>
                                <div class="panel-body">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>No.</th>
                                            <th>회사명</th>
                                            <th>사업형태</th>
                                            <th>이메일</th>
                                            <th>진행상태</th>
                                            <th></th>
                                        </tr>
                                        <tbody id="comp-list-in">
                                        
                                        </tbody>

 
                                    </table>
                                    <div class="table-foot">
                                        <ul class="pagination pagination-sm no-margin pull-right">
                                        <li><a href="#">&laquo;</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">&raquo;</a></li>
                                    </ul>
                                    </div>
                                </div><!-- /.panel-body -->

                            </div><!-- /.panel -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        

 
    <!-- ##### All Javascript Files ##### -->
      <!-- ##### All Javascript Files ##### -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!-- jQuery-2.2.4 js -->
  <script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>
  <!-- Popper js -->
  <script src="/resources/js/bootstrap/popper.min.js"></script>
  <!-- slick js -->
  <script type="text/javascript" src="/resources/js/slick.min.js"></script>
  <!-- Bootstrap js -->
  <script src="/resources/js/bootstrap/bootstrap.min.js"></script>
  <!-- All Plugins js -->
  <script src="/resources/js/plugins/plugins.js"></script>
  <!-- Active js -->
  <script src="/resources/js/active.js"></script>
  <!-- Common js -->
  <script src="/resources/js/common.js"></script>
      <!-- char.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  
  <script type="my-template" id="comp-list">
	<tr>
	<td class="comp-id">{id}</td>
	<td class="company" onclick="showModal(this)" style="cursor: -webkit-grabbing;">{name}</td>
	<td>{comType}</td>
	<td class="email">{email}</td>
	<td>{flag}</td>
	<td><input type="button" value="메일 발송"></td>
	</tr>
  </script>
  
  <script type="my-template" id="comp-detail">
<p class="preExplain"><strong>기업이름</strong>: {name}</p>
<p class="preExplain"><strong>이메일</strong>: {email}</p>
<p class="preExplain"><strong>설립일</strong>: {createDate}</p>
<p class="preExplain"><strong>투자받은 날짜</strong>: {firstDate} <span class="ml-15" style="color:#70c745;">1차 투자액: {firstFund}원</span></p>
<p class="preExplain"><strong>투자받은 날짜</strong>: {secondDate} <span class="ml-15" style="color:#70c745;">2차 투자액: {secondFund}원</span></p>
<p class="preExplain"><strong>특허 보유</strong>: {hasPatent}</p> 			    
<p class="preExplain">사업자등록증: <span class="selectFile"><a href="/user/download/{fileBusiRegistration}?suffix={suffix1}"&dir=사업자등록증>{fileBusiRegistration}</a></span></p>
<p class="preExplain">기업 인증서: <span class="selectFile"><a href="/user/download/{fileCompCertification}?suffix={suffix2}"&dir=사업자인증서>{fileCompCertification}</a></span></p>
<p class="preExplain">특허 인증서: <span class="selectFile"><a href="/user/download/{filePatentCertification}?suffix={suffix3}"&dir=특허인증서>{filePatentCertification}</a></span></p>
<p class="preExplain">투자유치 인증서: <span class="selectFile"><a href="/user/download/{fileInvestCertification}?suffix={suffix4}"&dir=투자유치인증>{fileInvestCertification}</a></span></p>
 			    
<h1 style="color: #70c745;">총 평가 점수 : {totalResult}</h1>
  </script>
  <script>
  window.chartColors = {
		  red: 'rgb(255, 99, 132)',
		  orange: 'rgb(255, 159, 64)',
		  yellow: 'rgb(255, 205, 86)',
		  green: 'rgb(75, 192, 192)',
		  blue: 'rgb(54, 162, 235)',
		  purple: 'rgb(153, 102, 255)',
		  grey: 'rgb(231,233,237)'
  };
  var color = Chart.helpers.color;
  
  //로그아웃 이벤트
  $("#logout").on("click", function(e) {
	  $("#logout-modal").modal('show');
  });
  
  
  
  function eventRegist(){
  	$("input[type='button']").on("click",function(){
  		//alert('눌럿져');
  		sendInfo(this);
  	})
  	
  	//$()
  }
  
  
  /*메일 발송*/
  function sendInfo(value){
  	var email = $(value).closest("tr").find(".email").text();
  	alert("메일수신을 완료하였습니다.");
  	$.ajax({
  		url:"/email/filelist",
  		type: "post",
  		data:{
  			email:email
  		},
  		dataType: "text",
  		success: function(data){
  			
  		}
  	})
  }
  
  function getCompanyListAjax(){
  	$.ajax({
  		url:"/judge/list",
  		type: "get",
  		success: function(data){
  			console.log(data.companyList);
  			makeCompanyListTemplate(data.companyList);
  		}
  	})
  }
  
  //list template
  function makeCompanyListTemplate(data){
	  var originHtml = document.querySelector('#comp-list').innerHTML;
	  var newhtml = '';
	  data.forEach(function(v) {
		  if(v.flag == '0'){
			  newhtml += originHtml.replace("{id}", v.id)
				.replace("{name}", v.name)
				.replace("{email}", v.email)
				.replace('{comType}',v.comType)
				.replace('{flag}', '가입신청완료')
		  } else if(v.flag == '0'){
			  newhtml += originHtml.replace("{id}", v.id)
				.replace("{name}", v.name)
				.replace("{email}", v.email)
				.replace('{comType}',v.comType)
				.replace('{flag}','서류제출완료')
		  }
	  })
	  document.querySelector('#comp-list-in').innerHTML = newhtml;
	  eventRegist();
  }
  
  function getCompanyDetailAjax(id){
	  	$.ajax({
	  		url:"/judge/detail/"+id,
	  		type: "get",
	  		success: function(data){
	  			console.log(data.detailCompany);
	  			makeCompanyDetail(data.detailCompany);
	  			$("#company").addClass("active in show");
	  			$("#company-desc").removeClass('active in show');
	  			changeActive(1);
	  		  	$("#adminCompany").modal('show');
	  		  	
	  		}
	  	})
  }

  function makeCompanyDetail(data){
	  var originHtml = document.querySelector('#comp-detail').innerHTML;
	  var newhtml = '';
	  
	  newhtml = originHtml.replace("{id}", data.id)
						   .replace("{name}", data.name)
					       .replace("{email}", data.email)
						   .replace('{createDate}',data.createDate)
						   .replace('{firstDate}', data.firstDate)
						   .replace('{firstFund}', data.firstFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
						   .replace('{hasPatent}', data.hasPatent)
						   .replace('{secondDate}', data.secondDate)
						   .replace('{secondFund}', data.secondFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
						   .replace('{totalResult}', data.totalResult)
						   .replace(/{fileBusiRegistration}/gi, data.fileBusiRegistration)
						   .replace('{suffix1}', data.fileBusiRegistration.split('.')[1])
						   .replace(/{fileCompCertification}/gi, data.fileCompCertification)
						   .replace('{suffix2}', data.fileCompCertification.split('.')[1])
						   .replace(/{filePatentCertification}/gi, data.filePatentCertification)
						   .replace('{suffix3}', data.filePatentCertification.split('.')[1])
						   .replace(/{fileInvestCertification}/gi, data.fileInvestCertification)
						   .replace('{suffix4}', data.fileInvestCertification.split('.')[1])
	  document.querySelector('#company').innerHTML = newhtml; 	
	  var downList = document.querySelectorAll('.selectFile');
	  $('.selectFile').click(function(e){
		 	var fileName = e.target.innerText;
		 	console.log(fileName);
		 	location.replace = "localhost:8080/user/download/"+fileName;
	  })
	  
  }
  
  
  function getEvalCompanyAjax(id){
	  
	  	$.ajax({
	  		url:"/judge/eval/"+id,
	  		type: "get",
	  		success: function(data){
	  			console.log(data.evalCompany);
	  			var dataset = [];
	  			dataset.push(data.evalCompany.firstResult);
	  			dataset.push(data.evalCompany.secondResult);
	  			dataset.push(data.evalCompany.thirdResult);
	  			dataset.push(data.evalCompany.fourthResult);
	  			dataset.push(data.evalCompany.fifthResult);
	  			dataset.push(data.evalCompany.sixthResult);
	  			dataset.push(data.evalCompany.seventhResult);
	  			dataset.push(data.evalCompany.eighthResult);
	  			dataset.push(data.evalCompany.ninethResult);
	  			
	  			evalGraph(dataset);
	  		}
	  	})
  }

  
  function showModal(value){
  	var email = $(value).closest("tr").find(".email").text();
  	var id = $(value).closest("tr").find(".comp-id").text();
  	getCompanyDetailAjax(id);
  	getEvalCompanyAjax(id);
  }
  
  getCompanyListAjax();
  
  function changeActive(index) {
	  if(index == 1) {
		  $("#tab" + index).css("color", "#70c745");
		  index = parseInt(index) + 1;
		  $("#tab" + index).css("color", "black");
	  } else {
		  $("#tab" + index).css("color", "#70c745");
		  index = index - 1;
		  $("#tab" + index).css("color", "black");
	  }
  }
  
 function evalGraph(evalDataset){
	 /* 수평 바 chart 이윤 증가율 */
	 new Chart(document.getElementById("bar-horizontal"), {
	    type: 'radar',
	    data: {
	      labels: ['투자시기', '평균 임직원 수', '설립일 일치빈도', '업종별 가중치', '업종별 투자액', '투자액 상승폭', '1차 투자 가중치', '업력별 가중치', '홍보활동'],
	      datasets: [
	        {
	          label: "심사결과",
	          backgroundColor: color(window.chartColors.green).alpha(0.2).rgbString(),
	          data: evalDataset,
	          notes:["투자 시기 데이터 평균: 19.572개월"+' 평균점수: 8점','asdfsadf','asdfasdfasdf','asdfasdfsdf']
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      scales: {
	    	   min:0,
	    	   display: false
		     },
	      title: {
	        display: true,
	        text: '전체 평가 심사'
	        
	      },
	      scale: {
	          ticks: {
	            beginAtZero: true
	          }
	      },
	      tooltips:{
    	  	callbacks:{
    	        label: function(tooltipItem, data){
    	          var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
    	          //This will be the tooltip.body
    	          return datasetLabel + ': ' + tooltipItem.yLabel +'->'+ data.datasets[tooltipItem.datasetIndex].notes[tooltipItem.index];
    	        }
    	     },
	      }
	    }
	});
 }
 
  
  </script>
    </body>
</html>
