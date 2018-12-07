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
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    <img alt="" src="/resources/img/logoss.png"><br>
                                    Bordered Table
                                </header>
                                <div class="panel-body">
                                    <table class="table table-bordered" style="width: 90%;">
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
<h2 class="ml-15">기업 정보</h2>
<p class="preExplain">기업이름: {name}</p>
<p class="preExplain">이메일: {email}</p>
<p class="preExplain">설립일: {createDate}</p>
<p class="preExplain">투자받은 날짜: {firstDate} <span style="color:green;">1차 투자액: {firstFund}원</span></p>
<p class="preExplain">투자받은 날짜: {secondDate} <span style="color:green;">2차 투자액: {secondFund}원</span></p>
<p class="preExplain">특허 보유: {hasPatent}</p> 			    
<p class="preExplain">사업자등록증: <span class="selectFile"><a href="/user/download/{fileBusiRegistration}?suffix={suffix1}"&dir=사업자등록증>{fileBusiRegistration}</a></span></p>
<p class="preExplain">기업 인증서: <span class="selectFile"><a href="/user/download/{fileCompCertification}?suffix={suffix2}"&dir=사업자인증서>{fileCompCertification}</a></span></p>
<p class="preExplain">특허 인증서: <span class="selectFile"><a href="/user/download/{filePatentCertification}?suffix={suffix3}"&dir=특허인증서>{filePatentCertification}</a></span></p>
<p class="preExplain">투자유치 인증서: <span class="selectFile"><a href="/user/download/{fileInvestCertification}?suffix={suffix4}"&dir=투자유치인증>{fileInvestCertification}</a></span></p>
 			    
<h1 style="color: green;">총 평가 점수 : {totalResult}</h1>
  </script>
  <script>
  eventRegist();
  
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
  	$.ajax({
  		url:"/email/filelist",
  		type: "post",
  		data:{
  			email:email
  		},
  		dataType: "text",
  		success: function(data){
  			alert("메일수신을 완료하였습니다.");
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

  }
  
  function getCompanyDetailAjax(id){
	  	$.ajax({
	  		url:"/judge/detail/"+id,
	  		type: "get",
	  		success: function(data){
	  			console.log(data.detailCompany);
	  			makeCompanyDetail(data.detailCompany);
	  		  	$("#id01").modal('show');
	  		  	
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
  
  function downLoad(){
	  
	  
  }
  
  function showModal(value){
  	var email = $(value).closest("tr").find(".email").text();
  	var id = $(value).closest("tr").find(".comp-id").text();
  	getCompanyDetailAjax(id);
  	
  }
  
  getCompanyListAjax();
  
  </script>
    </body>
</html>
