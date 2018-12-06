<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
                                        <tr>
                                            <td>1</td>
                                            <td class="company" onclick="showModal(this)">희진이네</td>
                                            <td>사회적기업</td>
                                            <td class="email">gmlwls0204@naver.com</td>
											<td>기업정보 등록 완료</td>
											<td><input type="button" value="메일 발송"></td>
                                        </tr>
                                        <!-- 
                                        <tr>
                                            <td>2.</td>
                                            <td>Clean database</td>
                                            <td>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                                                </div>
                                            </td>
                                            <td><span class="badge bg-yellow">70%</span></td>
                                        </tr>
                                        <tr>
                                            <td>3.</td>
                                            <td>Cron job running</td>
                                            <td>
                                                <div class="progress xs progress-striped active">
                                                    <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                                                </div>
                                            </td>
                                            <td><span class="badge bg-light-blue">30%</span></td>
                                        </tr>
                                        <tr>
                                            <td>4.</td>
                                            <td>Fix and squish bugs</td>
                                            <td>
                                                <div class="progress xs progress-striped active">
                                                    <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                                                </div>
                                            </td>
                                            <td><span class="badge bg-green">90%</span></td>
                                        </tr>
                                         -->
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
        
        
     <!-- Modal -->   
    <div id="id01" class="w3-modal">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <span id="companyId"></span>
      </div>
    </div>
  </div>
  
  
        <!-- jQuery-2.2.4 js -->
  <script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>
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
        
        function showModal(value){
        	var email = $(value).closest("tr").find(".email").text();
        	document.getElementById('id01').style.display='block';
        	$("#companyId").text(email);
        }
        
        
        </script>
    </body>
</html>
