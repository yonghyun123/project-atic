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
                                </div><!-- /.panel-body -->
                            </div><!-- /.panel -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </section><!-- /.content -->
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
  <tr>
	<th></th>
    <th colspan="2" style="width: 25%;">기업명</th>
    <td colspan="2" style="width: 25%;">{name}</td>
    <th colspan="2" style="width: 25%;">이메일</th>
    <td colspan="2" style="width: 25%;">{email}</td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="2" style="width: 25%;">설립일</th>
    <td colspan="2" style="width: 25%;">{createDate}</td>
    <th colspan="2" style="width: 25%;">특허 보유</th>
    <td colspan="2" style="width: 25%;">{hasPatent}</td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="2" style="width: 25%;">1차 투자일</th>
    <td colspan="2" style="width: 25%;">{firstDate}</td>
    <th colspan="2" style="width: 25%;">1차 투자액</th>
    <td colspan="2" style="width: 25%;">{firstFund}</td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="2" style="width: 25%;">2차 투자일</th>
    <td colspan="2" style="width: 25%;">{secondDate}</td>
    <th colspan="2" style="width: 25%;">2차 투자액</th>
    <td colspan="2" style="width: 25%;">{secondFund}</td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="4" style="width: 25%;">사업자 등록증</th>
    <td colspan="4" style="width: 25%;"><a href="/user/download/{fileBusiRegistration}?suffix={suffix1}"&dir=사업자등록증>{fileBusiRegistration}</a></td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="4" style="width: 25%;">기업 인증서</th>
    <td colspan="4" style="width: 25%;"><a href="/user/download/{fileCompCertification}?suffix={suffix2}"&dir=기업인증서>{fileCompCertification}</a></td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="4" style="width: 25%;">특허 인증서</th>
    <td colspan="4" style="width: 25%;"><span class="selectFile"><a href="/user/download/{filePatentCertification}?suffix={suffix3}"&dir=특허인증서>{filePatentCertification}</a></td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="4" style="width: 25%;">투자유치 인증서</th>
    <td colspan="4" style="width: 25%;"><a href="/user/download/{fileInvestCertification}?suffix={suffix4}"&dir=투자유치인증>{fileInvestCertification}</a></td>
	<th></th>
  </tr>
  <tr>
	<th></th>
    <th colspan="4" style="width: 25%;">총 평가 점수</th>
    <td colspan="4" style="width: 25%;"><strong style="color: #70c745;">{totalResult}</strong></td>
	<th></th>
  </tr>
  </script>
  
  <script type="my-template" id="detail-eval">
	<h4 style="color: #70c745; border-top: 1px solid #dee2e6; padding-top: 10px;">총 평가 점수 : {totalResult}</h4>
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
  	var id = $(value).closest("tr").find(".comp-id").text();
  	alert("메일수신을 완료하였습니다.");
  	$.ajax({
  		url:"/email/filelist",
  		type: "post",
  		data:{
  			email:email,
  			id:id
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
		  } else if(v.flag == '1'){
			  newhtml += originHtml.replace("{id}", v.id)
				.replace("{name}", v.name)
				.replace("{email}", v.email)
				.replace('{comType}',v.comType)
				.replace('{flag}','메일발신완료')
		  } else if(v.flag == '2'){
			  newhtml += originHtml.replace("{id}", v.id)
				.replace("{name}", v.name)
				.replace("{email}", v.email)
				.replace('{comType}',v.comType)
				.replace('{flag}','기업정보완료')
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
	  var deHtml =  document.querySelector('#detail-eval').innerHTML;
	  var newhtml = '';
	  var detailHtml = '';
	  if(data.firstDate == null || data.firstFund == 0){
		  newhtml = originHtml.replace("{id}", data.id)
		   .replace("{name}", data.name)
	       .replace("{email}", data.email)
		   .replace('{createDate}',data.createDate)
		   .replace('{firstDate}', 0)
		   .replace('{firstFund}', 0)
		   .replace('{hasPatent}', data.hasPatent)
		   .replace('{totalResult}', Number(data.totalResult).toFixed(3))
		   .replace(/{fileBusiRegistration}/gi, data.fileBusiRegistration)
		   .replace('{suffix1}', data.fileBusiRegistration.split('.')[1])
		   .replace(/{fileCompCertification}/gi, data.fileCompCertification)
		   .replace('{suffix2}', data.fileCompCertification.split('.')[1])
		   .replace(/{filePatentCertification}/gi, data.filePatentCertification)
		   .replace('{suffix3}', data.filePatentCertification.split('.')[1])
		   .replace(/{fileInvestCertification}/gi, data.fileInvestCertification)
		   .replace('{suffix4}', data.fileInvestCertification.split('.')[1])
	  } else if(data.secondDate == null || data.secondFund == 0){
		  newhtml = originHtml.replace("{id}", data.id)
		   .replace("{name}", data.name)
	       .replace("{email}", data.email)
		   .replace('{createDate}',data.createDate)
		   .replace('{firstDate}', data.firstDate)
		   .replace('{firstFund}', data.firstFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
		   .replace('{secondDate}', 0)
		   .replace('{secondFund}', 0)
		   .replace('{hasPatent}', data.hasPatent)
		   .replace('{totalResult}', Number(data.totalResult).toFixed(3))
		   .replace(/{fileBusiRegistration}/gi, data.fileBusiRegistration)
		   .replace('{suffix1}', data.fileBusiRegistration.split('.')[1])
		   .replace(/{fileCompCertification}/gi, data.fileCompCertification)
		   .replace('{suffix2}', data.fileCompCertification.split('.')[1])
		   .replace(/{filePatentCertification}/gi, data.filePatentCertification)
		   .replace('{suffix3}', data.filePatentCertification.split('.')[1])
		   .replace(/{fileInvestCertification}/gi, data.fileInvestCertification)
		   .replace('{suffix4}', data.fileInvestCertification.split('.')[1])
	  } else if(data.filePatentCertification == null){
		  newhtml = originHtml.replace("{id}", data.id)
		   .replace("{name}", data.name)
	       .replace("{email}", data.email)
		   .replace('{createDate}',data.createDate)
		   .replace('{firstDate}', data.firstDate)
		   .replace('{firstFund}', data.firstFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
		   .replace('{secondDate}', 0)
		   .replace('{secondFund}', 0)
		   .replace('{hasPatent}', data.hasPatent)
		   .replace('{totalResult}', Number(data.totalResult).toFixed(3))
		   .replace(/{fileBusiRegistration}/gi, data.fileBusiRegistration)
		   .replace('{suffix1}', data.fileBusiRegistration.split('.')[1])
		   .replace(/{fileCompCertification}/gi, data.fileCompCertification)
		   .replace('{suffix2}', data.fileCompCertification.split('.')[1])
		   .replace(/{fileInvestCertification}/gi, data.fileInvestCertification)
		   .replace('{suffix4}', data.fileInvestCertification.split('.')[1])
	  }
	  else {
		  newhtml = originHtml.replace("{id}", data.id)
		   .replace("{name}", data.name)
	       .replace("{email}", data.email)
		   .replace('{createDate}',data.createDate)
		   .replace('{firstDate}', data.firstDate)
		   .replace('{firstFund}', data.firstFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
		   .replace('{hasPatent}', data.hasPatent)
		   .replace('{secondDate}', data.secondDate)
		   .replace('{secondFund}', data.secondFund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
		   .replace('{totalResult}', Number(data.totalResult).toFixed(3))
		   .replace(/{fileBusiRegistration}/gi, data.fileBusiRegistration)
		   .replace('{suffix1}', data.fileBusiRegistration.split('.')[1])
		   .replace(/{fileCompCertification}/gi, data.fileCompCertification)
		   .replace('{suffix2}', data.fileCompCertification.split('.')[1])
		   .replace(/{filePatentCertification}/gi, data.filePatentCertification)
		   .replace('{suffix3}', data.filePatentCertification.split('.')[1])
		   .replace(/{fileInvestCertification}/gi, data.fileInvestCertification)
		   .replace('{suffix4}', data.fileInvestCertification.split('.')[1])
	  }

	  document.querySelector('#company').innerHTML = newhtml;
	  
	  detailHtml = deHtml.replace('{totalResult}',Number(data.totalResult).toFixed(2));
	  document.querySelector('#total-eval').innerHTML = detailHtml;
	  
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
	  			dataset.push(data.evalCompany.firstEval);
	  			dataset.push(data.evalCompany.secondEval);
	  			dataset.push(data.evalCompany.thirdEval);
	  			dataset.push(data.evalCompany.fourthEval);
	  			dataset.push(data.evalCompany.fifthEval);
	  			dataset.push(data.evalCompany.sixthEval);
	  			dataset.push(data.evalCompany.seventhEval);
	  			dataset.push(data.evalCompany.eighthEval);
	  			dataset.push(data.evalCompany.ninethEval);
	  			
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
	      labels: ['투자시기', '평균 임직원 수', '설립일 일치빈도', '업종별 가중치', '업종별 투자액', '투자액 상승폭', '1차 투자 가중치', '업력별 가중치', '홍보활동 상승률'],
	      datasets: [
	        {
	          label: "심사결과",
	          backgroundColor: color(window.chartColors.green).alpha(0.2).rgbString(),
	          data: evalDataset,
	          notes:['1.투자 시기 데이터 평균: 19.572개월, 2.평균점수: 8점',
	        	  '1.임직원 데이터 평균: 0.944명, 2.평균점수: 8점',
	        	  '2008: 1.74%, 2009: 0.75%, 2010: 4.48%, 2011: 7.22%, 2012: 9.2%, 2013: 8.2%, 2014: 10%',
	        	  '비IT: 1점, Game: 9.2점, IT dev: 8.2점, Platform: 2.7점, Security: 9.95점',
	        	  'Game: 53.818억원, IT dev: 8.152억원, Security: 15억원, Platform: 20.63억원',
	        	  '1.초기->1차투자: 0.874억원, 2.1차투자->2차투자: 1.061억원',
	        	  '6개월이하: 10점, 12개월이하: 8점, 18개월이하: 6점, 그 이후:4점'
	        	  ,'6개월이하: 10점, 12개월이하: 9점, 18개월이하: 8점',
	        	  '상승시: 10점, 하락시: 6점, 기본: 4점, 미홍보: 0점']
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      scales: {
	    	   
	    	   display: false
		     },
	      title: {
	        display: true,
	        text: '전체 평가 심사'
	        
	      },
	      scale: {
	          ticks: {
	        	min:0,
	        	max:10,
	            beginAtZero: true
	          }
	      },
	      tooltips:{
    	  	callbacks:{
    	        label: function(tooltipItem, data){
    	        	var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
    	        	var result = datasetLabel + ': ' + tooltipItem.yLabel + '점' 
    	        	var temp = [];
    	        	temp.push(result);
    	        	temp.push('------심사기준--------');
    	        	var str = data.datasets[tooltipItem.datasetIndex].notes[tooltipItem.index].split(', ');
    	        	for(key in str){
    	        		temp.push(str[key]);
    	        	}
    	            return temp;
    	        },

    	     },
	      }
	    }
	});
 }
 
  
  </script>
    </body>
</html>
