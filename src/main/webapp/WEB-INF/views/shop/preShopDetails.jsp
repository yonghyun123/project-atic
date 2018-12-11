<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
pageContext.setAttribute("LF", "\n");
%> 

<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>A-TiC</title>



 <!-- Favicon -->
<link rel="icon" href="/resources/img/hanalogo.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="/resources/css/style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/common.css">

<!-- table CSS -->
<link rel="stylesheet" href="/resources/css/shop_detail.css">
<link rel="stylesheet"
  href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<!-- slick CSS -->
<link href="/resources/css/slick.css" rel="stylesheet">
<link href="/resources/css/slick-theme.css" rel="stylesheet">

<style type="text/css">
.card {
	flex-direction: row;
}

.navText:hover {
	color: black;
	text-decoration: none;
}
</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Breadcrumb Area Start ##### -->
  <div class="breadcrumb-area">
    <!-- Top Breadcrumb Area -->
    <nav id="investNav" style="height: 6%">
      <ul>
        <li id="investMain"><a class="navText" href="/shop/">펀딩
            홈</a></li>
        <li class="monthProject"><a class="navText"
          href="/shop/currentShop">진행중</a></li>
        <li class="monthProject"><a class="navText active"
          href="/shop/preShop">오픈예정</a></li>
        <li class="monthProject"><a href="/shop/finishShop" class="navText">마감</a></li>
      </ul>
    </nav>
    <div
      class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
      style="background-image: url(/resources/img/project-image/<c:out value='${project.fileName }'/>);">
      <h2>오픈 예정사업</h2>
    </div>

    <div class="col-md-10" style="margin: 0 auto;">
      <div class="col-md-10">
        <div>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/"><i
                  class="fa fa-home"></i> Home</a></li>
              <li class="breadcrumb-item"><a href="/shop/preShop">Project</a></li>
              <li class="breadcrumb-item active" aria-current="page">Project
                Details</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <!-- ##### Breadcrumb Area End ##### -->
 
  <div class="col-md-10" style="margin: 0 auto;">
  <!-- ##### Single Product Details Area Start ##### -->
  <section class="single_product_details_area mb-50">
    <div class="produts-details--content">
      <div class="container">
        <div class="row justify-content-between">

          <div class="col-12 col-md-6 col-lg-5">
            <div class="single_product_thumb">

              <!-- 썸네일 이미지 -->
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <a class="product-img"
                    href="/resources/img/project-image/<c:out value='${project.fileName }'/>"
                    title="Product Image"> <img
                    class="d-block w-100"
                    src="/resources/img/project-image/<c:out value='${project.fileName }'/>"
                    alt="1" style="height: 305px;">
                  </a>
                </div>
              </div>

            </div>
          </div>

          <div class="col-12 col-md-6">
            <div class="single_product_desc">
              <h4 class="title">
                <c:out value='${project.name }' />
              </h4>
              목표 금액
             <fmt:formatNumber value="${project.goal }" pattern="#,###"/>
              <input type="hidden"
                value="<c:out value="${project.id }"/>" id="projectId">
              <h4 class="price">

                <c:out value="${project.createDate }" />
                오픈예정
              </h4>
              <div class="short_overview">
                <p>
                  <c:out value="${project.title }" />
                </p>
                <p>
                  이 프로젝트가 목표자금을 달성할 시
                  <c:out value="${project.interest }" />
                  %의 금리혜택을 받으실 수 있습니다.
                </p>
              </div>

              <div class="cart--area d-flex flex-wrap align-items-center">
                <!-- Add to Cart Form -->
                <c:choose>
                <c:when test="${empty loginId }">
                  <input type="button" id="shop-login" value="오픈 알람받기" class="btn alazea-btn" style="width: 20%;">
                </c:when>
                <c:otherwise>
                  <form class="cart clearfix d-flex align-items-center"
                  method="post">
                    <input type="button" id="pushAlert" value="오픈 알람받기" class="btn alazea-btn">
                  </form>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row shop-detail-inform-area">
        <div id="graph" class="tab-pane">
          <div class="container ml-15">
            <div class="row">
              <div class="col-md-12">
                <div class="card" style="">
                  <div class="card-body"
                    style="width: 40%; display: inline;">
                    <div id="average"
                      style="margin-top: 5%; margin-left: 20%;">
                      <p style="margin-left: 15">평균 평점</p>

                      <div style="margin-left: 10%" id="averPoint">
                        <h1>4.5</h1>
                      </div>
                    </div>
                  </div>
                  <div class="card-body"
                    style="width: 55%; display: inline;">
                    <canvas id="bar-chart-paral" width="100"
                      height="50"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="products--meta">
            <h4 style="color: #707070;">회사 정보</h4>
            <div style="margin: 15px 0;">
              <h5 style="display: inline; color: #707070;">회사 명 : </h5>${project.company }
            </div>
            <div style="margin: 15px 0;">
              <h5 style="display: inline; color: #707070;">전화번호 : </h5>${project.tel }
            </div>
            <div>
              <h5 style="display: inline; color: #707070;">업종 : </h5>${project.category }
            </div>
        </div>
      </div>
    </div>
    
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="product_details_tab clearfix">
            <!-- Tabs -->
            <ul class="nav nav-tabs" role="tablist"
              id="product-details-tab">
              <li class="nav-item"><a href="#description"
                class="nav-link active" data-toggle="tab" role="tab">상세
                  설명</a></li>
              <li class="nav-item"><a href="#reviews"
                class="nav-link" data-toggle="tab" role="tab">예비 평가</a></li>
            </ul>
            <!-- Tab Content -->
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane fade show active"
                id="description">
                <div class="description_area">
                  <p>
                    <c:out value="${fn:replace(project.description,LF,'<br>')}" escapeXml="false" />
                  </p>
                  <p class="text-center">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_1.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_2.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_3.png">
                  </p>

                </div>
              </div>

              <div role="tabpanel" class="tab-pane fade" id="investor">
                <div class="investor_area">
                  <table id="customers">
                    <tr>
                      <th>No</th>
                      <th>투자자</th>
                      <th>투자액</th>
                      <th>투자 날짜</th>
                    </tr>
                    <c:choose>
                      <c:when test="${not empty userProject }">
                        <c:forEach var="project" items="${userProject}"
                          varStatus="status">
                          <tr>
                            <td>${status.index+1 }</td>
                            <td>${project.userId }</td>
                            <td>${project.deposit }</td>
                            <td>${project.createDate }</td>
                          </tr>
                        </c:forEach>
                      </c:when>
                    </c:choose>
                  </table>

                </div>
              </div>

              <div role="tabpanel" class="tab-pane fade" id="reviews">
                <div class="reviews_area">
                  <div id="calCount">
                    <div id="count"></div>
                  </div>
                  <ul id="userEvalList" style="font-size: 16px;">

                  </ul>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Single Product Details Area End ##### -->

  <!-- ##### Related Product Area Start ##### -->
  <div class="related-products-area" id="project-area">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h3>다른 프로젝트 보기</h3>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="responsive" style="width: 100%">
          <!-- Single Product Area -->
          <!-- Product Image -->
          <c:choose>
            <c:when test="${not empty preList }">
              <c:forEach var="project" items="${preList}"
                varStatus="status">
                <div class="product-img" style="padding: 0 10px 0 10px;">
                  <a href="/shop/detail/pre/${project.id }"> <img
                    src="/resources/img/project-image/${project.fileName }"
                    alt=""></a>
                </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="col-12 col-md-12 col-lg-12 text-center"
                style="margin-bottom: 20px">
                <div style="width: 100%">
                  <h1>프로젝트가 존재하지 않습니다.</h1>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- ##### All Javascript Files ##### -->
  <!-- jQuery-2.2.4 js -->
  <script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>
  <!-- Popper js -->
  <script src="/resources/js/bootstrap/popper.min.js"></script>
  <!-- Bootstrap js -->
  <script src="/resources/js/bootstrap/bootstrap.min.js"></script>
  <!-- All Plugins js -->
  <script src="/resources/js/plugins/plugins.js"></script>
  <!-- Active js -->
  <script src="/resources/js/active.js"></script>
  <!-- Common js -->
  <script src="/resources/js/common.js"></script>
  <!-- slick js -->
  <script type="text/javascript" src="/resources/js/slick.min.js"></script>
  <!-- char.js -->
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  <!-- ##### Related Product Area End ##### -->

  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>

  <script type="my-template" id="userEval-list">
   <li>
     <div class="single_user_review mb-15">
      <div class="review-rating">
        <i class="fa fa-star" aria-hidden="true"></i>
         <span style="font-size: 20px;">{totalAvg}</span>
		  <span style="font-size: 16px;">
              by <strong style="font-size: 20px;">{userId}</strong>
          </span>
          </div>
            <div id="userId">
              <div id="showAll"><p style="margin-bottom: 0">상세점수 보기 <i class="fa fa-sort-desc"></i></p></div>
               <div id="totalEval{userID}" style="display:none">
          <div> 
          	<span><strong>호감도</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Favor} 
     	    <span><strong>성장성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Growth} 
          	<span><strong>수익성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Market}
          	<span><strong>안정성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Stable}
          </div>
        </div>
        </div>
        </div>
   </li>
  </script>
  <script type="text/javascript">
  $("#funding").addClass("active");
  $("#guide").removeClass("active");
  $("#my-page").removeClass("active");
			var projectId = "${project.id}";
			var loginId = "${loginId}";
			//
			$("#pushAlert").click(function() {
				$("#user-Eval").modal('show');
				 var authNum = 0;
		            $("#authPre").on("click", function(){
		               var email = $("#EmailAddress").val();
		               alert("인증번호가 발송되었습니다.");
		               $.ajax({
		                  url : "/email/preauth",
		                  type : "post",
		                  async : false,
		                  data : {
		                     email : email
		                  },
		                  dataType : "text",
		                  success : function(data){
		                     var jsonData = JSON.parse(data);
		                     authNum = jsonData.authNum;
		                  }
		               })
		            })
		            
		            $("#authPreB").on("click",function(){
		               if($("#authPreNum").val() == authNum){
		                 document.getElementById("nextBtnPre").disabled = false;
		                $("#nextBtnPre").on("click", function() {
		                  //invest();
		                  nextPrev(0);
		               })
		               alert("인증번호가 일치합니다.");
		               }else{
		                  alert("인증번호가 일치하지 않습니다.");
		               }
		            })
		            

		         });


			/*
			javascript AJAX Service(read, put, post...)
			created by yonghyun
			 */
			var evalPageService = (function() {
				function get(projectId, callback, error) {
					$.get("/shop/preEval/graph/" + projectId, function(result) {
						if (callback) {
							callback(result);
						}

					}).fail(function(xhr, status, err) {
						if (error) {
							error();
						}
					});
				}
				;

				function getUserEvalList(projectId, callback, error) {
					$.get("/shop/preEval/eval/" + projectId, function(result) {
						if (callback) {
							callback(result);
						}

					}).fail(function(xhr, status, err) {
						if (error) {
							error();
						}
					});
				}
				;

				return {
					get : get,
					getUserEvalList : getUserEvalList
				};
			})();

			//페이지 오픈시 graph 데이터를 받기위해 ajax 전송    
			evalPageService
					.get(
							projectId,
							function(Object) {
								var test = (Object != null);
								var userEvalByProject = [];
								if(Object != null){
								userEvalByProject.push(Math
										.round(Object.Market * 100) / 100.0);
								userEvalByProject.push(Math
										.round(Object.Stable * 100) / 100.0);
								userEvalByProject.push(Math
										.round(Object.Growth * 100) / 100.0);
								userEvalByProject.push(Math
										.round(Object.Favor * 100) / 100.0);
								}else{
									userEvalByProject = [0,0,0,0];
								}
								$('#averPoint')
										.html(
												'<div style="display:inline-block; margin-bottom: 5px"><i class="fa fa-star fa-2x" style="color: #ff9800"></i></div><div style="display:inline-block; margin-left: 10px;"><h3>'
														+ Math
																.round(Object.Total * 100)
														/ 100.0 + '</h3></div>');
								profitGraph(userEvalByProject);

							});

			//페이지 오픈시 사용자평점리스트를 받아기위한 ajax 전송
			evalPageService.getUserEvalList(projectId, function(list) {
				$('#count').html(
						'<span>총 <h5 style="display:inline-block;">' + list.userEvalList.length
								+ '개</h5>의 평가가 있습니다.</span>');

				userEvalListTemplate(list.userEvalList);

				list.userEvalList.forEach(function(v) {
					if (v.user_id == loginId) {
						$('#pushAlert').val("알람 신청이 완료되었습니다.");
						$('#pushAlert').attr('disabled', true)
						$('#pushAlert').attr('class', 'alazea-btn-disable')

					}
				})
			});

			//페이지 오픈시 사용자 평가 리스트 반영
			function userEvalListTemplate(userEvalList) {
				var originHtml = document.querySelector('#userEval-list').innerHTML;
				var newHtml = '';
				userEvalList.forEach(function(v) {
					newHtml += originHtml.replace('{userId}', v.user_id)
							.replace('{userID}', v.user_id).replace(
									'{totalAvg}',
									Math.round(v.total_avg * 100) / 100.0)
							.replace('{Favor}',
									Math.round(v.favor_grade * 100) / 100.0)
							.replace('{Growth}',
									Math.round(v.growth_grade * 100) / 100.0)
							.replace('{Market}',
									Math.round(v.market_grade * 100) / 100.0)
							.replace('{Stable}',
									Math.round(v.stable_grade * 100) / 100.0)
				});
				document.querySelector('#userEvalList').innerHTML = newHtml;
			}

			$('.starRev span').click(function() {
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				$(this).parent().children('.scoreTable').html($(this).text());
				$(this).parent().children('.scoreTable').val($(this).text());
				return false;
			});

			var currentTab = 0; // Current tab is set to be the first tab (0)
			showTab(currentTab); // Display the current tab

			function showTab(n) {
				// This function will display the specified tab of the form ...
				var x = document.getElementsByClassName("preTab");
				x[n].style.display = "block";
				// ... and fix the Previous/Next buttons:
				if (n == 0) {
		            document.getElementById("nextBtnPre").disabled = true;
				} else {
					$("#nextBtnpre").html('submit');
				}
				if (n == (x.length - 1)) {
					document.getElementById("nextBtnPre").innerHTML = "Submit";
				} else {
					document.getElementById("nextBtnPre").innerHTML = "Next";
				}
				// ... and run a function that displays the correct step indicator:
				fixStepIndicator(n)
			}

			function nextPrev(n) {
				// This function will figure out which tab to display
				var x = document.getElementsByClassName("preTab");
				// Exit the function if any field in the current tab is invalid:
				if (n == 1 && !validateForm())
					return false;
				// Hide the current tab:
				x[currentTab].style.display = "none";
				// Increase or decrease the current tab by 1:
				currentTab = currentTab + n;
				// if you have reached the end of the form... :
				if (currentTab >= x.length) {
					$("#user-Eval").modal("hide");
					$("#regPreForm").submit();
					return ;
				}
				// Otherwise, display the correct tab:
				showTab(currentTab);
			}

			function validateForm() {
				// This function deals with validation of the form fields
				var x, y, i, valid = true;
				x = document.getElementsByClassName("preTab");
				y = x[currentTab].getElementsByTagName("input");
				// A loop that checks every input field in the current tab:
				for (i = 0; i < y.length; i++) {
					// If a field is empty...
					if (y[i].value == "") {
						// add an "invalid" class to the field:
						y[i].className += " invalid";
						// and set the current valid status to false:
						valid = false;
					}
				}
				// If the valid status is true, mark the step as finished and valid:
				if (valid) {
					document.getElementsByClassName("step")[currentTab].className += " finish";
				}
				return valid; // return the valid status
			}

			function fixStepIndicator(n) {
				// This function removes the "active" class of all steps...
				var i, x = document.getElementsByClassName("step");
				for (i = 0; i < x.length; i++) {
					x[i].className = x[i].className.replace(" active", "");
				}
				//... and adds the "active" class to the current step:
				x[n].className += " active";
			}

			function profitGraph(userEvalByProject) {
				/* 수평 바 chart 이윤 증가율 */
				new Chart(document.getElementById("bar-chart-paral"), {
					type : 'bar',
					data : {
						labels : [ "수익성", "안정성", "성장성", "호감도" ],
						datasets : [ {
							label : "점",
							backgroundColor : [ "#3e95cd", "#8e5ea2",
									"#3cba9f", "#e8c3b9", "#c45850" ],
							data : userEvalByProject
						} ]
					},
					options : {
						legend : {
							display : false
						},
						scales : {
							yAxes : [ {
								ticks : {
									min : 0
								}
							} ]
						},
						title : {
							display : true,
							text : '[매력도 평가(점)]'

						}
					}
				});
			}
		</script>
  <!-- slick -->
  <script type="text/javascript">
			$(document).ready(function() {
				$(document).on("click", "#showAll", function() {
					if ($(this).next().css("display") == "none") {
						$(this).next().show();
					} else {
						$(this).next().hide();
					}
				});

				$('.responsive').slick({
					dots : true,
					infinite : false,
					arrows: false,
					speed : 300,
					slidesToShow : 4,
					slidesToScroll : 4,
					responsive : [ {
						breakpoint : 1024,
						settings : {
							slidesToShow : 3,
							slidesToScroll : 3,
							infinite : true,
							dots : true
						}
					}, {
						breakpoint : 600,
						settings : {
							slidesToShow : 2,
							slidesToScroll : 2
						}
					}, {
						breakpoint : 480,
						settings : {
							slidesToShow : 1,
							slidesToScroll : 1
						}
					}
					// You can unslick at a given breakpoint now by adding:
					// settings: "unslick"
					// instead of a settings object
					]
				});

			});
		</script>

</body>

</html>