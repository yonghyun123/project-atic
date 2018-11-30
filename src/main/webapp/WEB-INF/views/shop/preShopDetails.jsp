<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="icon" href="/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="/resources/css/style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/common.css">

<!-- table CSS -->
<link rel="stylesheet" href="/resources/css/shop_detail.css">
<link rel="stylesheet"
  href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<style type="text/css">

.card{
flex-direction: row;
}
</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Breadcrumb Area Start ##### -->
  <div style="height: 90px"></div>
  <div class="breadcrumb-area">
    <!-- Top Breadcrumb Area -->
    <div
      class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
      style="background-image: url(/resources/img/bg-img/24.jpg);">
      <h2>오픈 예정사업</h2>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#"><i
                  class="fa fa-home"></i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Project</a></li>
              <li class="breadcrumb-item active" aria-current="page">Project
                Details</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <!-- ##### Breadcrumb Area End ##### -->

  <!-- ##### Single Product Details Area Start ##### -->
  <section class="single_product_details_area mb-50">
    <div class="produts-details--content mb-50">
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
                    alt="1">
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
              목표 자금
              <c:out value="${project.goal }" />
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

              <div
                class="cart--area d-flex flex-wrap align-items-center">
                <!-- Add to Cart Form -->
                <form class="cart clearfix d-flex align-items-center"
                  method="post">
                  <input type="button" id="pushAlert" value="알림 신청하기"
                    class="btn alazea-btn ml-15">
                </form>
              </div>
              <div id="graph" class="tab-pane">
                <div class="container">
                  <div class="row my-2">
                    <div class="col-md-12">
                      <div class="card" style="">
                      <div class="card-body" style="width: 40%; display: inline;">
                           <div id="average" style="margin-top: 15%; margin-left: 20%;">
                            <h2 style="margin-left:15">평균 평점</h2>
                            
                            <div style="margin-left:20%" id="averPoint"><h1>4.5</h1></div>
                            </div>
                       </div>
                        <div class="card-body" style="width: 55%; display: inline;">
                          <canvas id="bar-chart-paral" width="100" height="50"></canvas>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
              <li class="nav-item"><a href="#addi-info"
                class="nav-link" data-toggle="tab" role="tab">회사 정보</a></li>
              <li class="nav-item"><a href="#reviews"
                class="nav-link" data-toggle="tab" role="tab">예비 평가</a></li>
            </ul>
            <!-- Tab Content -->
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane fade show active"
                id="description">
                <div class="description_area">
                  <p>
                    <c:out value="${project.description }" />
                  </p>
                  <p>
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_1.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_2.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_3.png">

                  </p>

                </div>
              </div>
              <div role="tabpanel" class="tab-pane fade" id="addi-info">
                <div class="additional_info_area">
                  <p>
                    회사 이름<br> <span> <c:out
                        value="${project.company }" />
                    </span>
                  </p>
                  <p>
                    회사 전화번호 <br> <span> <c:out
                        value="${project.tel }" />
                    </span>
                  </p>
                  <p>
                    회사 업종 <br> <span> <c:out
                        value="${project.category }" />
                    </span>
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
                  <ul id="userEvalList">

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
  <div class="related-products-area">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>오픈 예정 프로젝트</h2>
          </div>
        </div>
      </div>

      <div class="row">

        <!-- Single Product Area -->
        <div class="col-12 col-sm-6 col-lg-3">
          <div class="single-product-area mb-100">
            <!-- Product Image -->
            <div class="product-img">
              <a href="shop-details.html"><img
                src="/resources/img/bg-img/40.png" alt=""></a>
              <!-- Product Tag -->
              <div class="product-tag">
                <a href="#">Hot</a>
              </div>
              <div class="product-meta d-flex">
                <a href="#" class="wishlist-btn"><i
                  class="icon_heart_alt"></i></a> <a href="cart.html"
                  class="add-to-cart-btn">Add to cart</a> <a href="#"
                  class="compare-btn"><i
                  class="arrow_left-right_alt"></i></a>
              </div>
            </div>
            <!-- Product Info -->
            <div class="product-info mt-15 text-center">
              <a href="shop-details.html">
                <p>Cactus Flower</p>
              </a>
              <h6>$10.99</h6>
            </div>
          </div>
        </div>

        <!-- Single Product Area -->
        <div class="col-12 col-sm-6 col-lg-3">
          <div class="single-product-area mb-100">
            <!-- Product Image -->
            <div class="product-img">
              <a href="shop-details.html"><img
                src="/resources/img/bg-img/41.png" alt=""></a>
              <div class="product-meta d-flex">
                <a href="#" class="wishlist-btn"><i
                  class="icon_heart_alt"></i></a> <a href="cart.html"
                  class="add-to-cart-btn">Add to cart</a> <a href="#"
                  class="compare-btn"><i
                  class="arrow_left-right_alt"></i></a>
              </div>
            </div>
            <!-- Product Info -->
            <div class="product-info mt-15 text-center">
              <a href="shop-details.html">
                <p>Cactus Flower</p>
              </a>
              <h6>$10.99</h6>
            </div>
          </div>
        </div>

        <!-- Single Product Area -->
        <div class="col-12 col-sm-6 col-lg-3">
          <div class="single-product-area mb-100">
            <!-- Product Image -->
            <div class="product-img">
              <a href="shop-details.html"><img
                src="/resources/img/bg-img/42.png" alt=""></a>
              <div class="product-meta d-flex">
                <a href="#" class="wishlist-btn"><i
                  class="icon_heart_alt"></i></a> <a href="cart.html"
                  class="add-to-cart-btn">Add to cart</a> <a href="#"
                  class="compare-btn"><i
                  class="arrow_left-right_alt"></i></a>
              </div>
            </div>
            <!-- Product Info -->
            <div class="product-info mt-15 text-center">
              <a href="shop-details.html">
                <p>Cactus Flower</p>
              </a>
              <h6>$10.99</h6>
            </div>
          </div>
        </div>

        <!-- Single Product Area -->
        <div class="col-12 col-sm-6 col-lg-3">
          <div class="single-product-area mb-100">
            <!-- Product Image -->
            <div class="product-img">
              <a href="shop-details.html"><img
                src="/resources/img/bg-img/43.png" alt=""></a>
              <!-- Product Tag -->
              <div class="product-tag sale-tag">
                <a href="#">Hot</a>
              </div>
              <div class="product-meta d-flex">
                <a href="#" class="wishlist-btn"><i
                  class="icon_heart_alt"></i></a> <a href="cart.html"
                  class="add-to-cart-btn">Add to cart</a> <a href="#"
                  class="compare-btn"><i
                  class="arrow_left-right_alt"></i></a>
              </div>
            </div>
            <!-- Product Info -->
            <div class="product-info mt-15 text-center">
              <a href="shop-details.html">
                <p>Cactus Flower</p>
              </a>
              <h6>$10.99</h6>
            </div>
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
         <span>{totalAvg}</span>
          </div>
            <div class="review-details">
              <p style="margin-bottom: 0">평가 평균</p>
               <p>
                by <a href="#" id="userId">{userId}</a>
                </p>
                </div>
                </div>
             </li>
  </script>
  <script type="text/javascript">
     var projectId = "${project.id}";
           //
         $("#pushAlert").click(function() {
            $("#user-Eval").modal('show');

         });
         
          /*
          javascript AJAX Service(read, put, post...)
          created by yonghyun
       */
       var evalPageService = (function() {
            function get(projectId, callback, error) {
               $.get("/shop/preEval/graph/"+projectId, function(result) {
                  if (callback) {
                     callback(result);
                  }

               }).fail(function(xhr, status, err) {
                  if (error) {   
                     error();
                  }
               });
            };
            
            function getUserEvalList(projectId, callback, error) {
               $.get("/shop/preEval/eval/"+projectId, function(result) {
                  if (callback) {
                     callback(result);
                  }

               }).fail(function(xhr, status, err) {
                  if (error) {   
                     error();
                  }
               });
            };
                        
            
            
            return {
               get : get,
               getUserEvalList: getUserEvalList
            };
         })();
          
          
       //페이지 오픈시 graph 데이터를 받기위해 ajax 전송    
       evalPageService.get(projectId, function(Object){
         var userEvalByProject = [];
          userEvalByProject.push(Math.round(Object.Market*100)/100.0);
          userEvalByProject.push(Math.round(Object.Stable*100)/100.0);
          userEvalByProject.push(Math.round(Object.Growth*100)/100.0);
          userEvalByProject.push(Math.round(Object.Favor*100)/100.0);
          $('#averPoint').html('<div style="display:inline-block; margin-bottom: 5px"><i class="fa fa-star fa-2x"></i></div><div style="display:inline-block; margin-left: 10px;"><h3>'+Math.round(Object.Total*100)/100.0+'</h3></div>');
          profitGraph(userEvalByProject);
          
       });
       
       //페이지 오픈시 사용자평점리스트를 받아기위한 ajax 전송
       evalPageService.getUserEvalList(projectId, function(list){
          $('#count').html('<span>총 <h5>'+list.userEvalList.length+'개</h5>의 매력도 평가가 있습니다.</span>');
          userEvalListTemplate(list.userEvalList);
       });
       
       //페이지 오픈시 사용자 평가 리스트 반영
       function userEvalListTemplate(userEvalList){
          var originHtml = document.querySelector('#userEval-list').innerHTML;
          var newHtml = '';
          userEvalList.forEach(function(v) {
             newHtml += originHtml.replace('{userId}', v.user_id)
                              .replace('{totalAvg}', Math.round(v.total_avg*100)/100.0)
          });
          document.querySelector('#userEvalList').innerHTML = newHtml;
       }
       

         $('.starRev span').click(function() {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            console.log($(this).parent().children('p'));
            $(this).parent().children('.scoreTable').html($(this).text());
            $(this).parent().children('.scoreTable').val($(this).text());
            return false;
         });

         var currentTab = 0; // Current tab is set to be the first tab (0)
         showTab(currentTab); // Display the current tab

         function showTab(n) {
            // This function will display the specified tab of the form ...
            console.log(n);
            var x = document.getElementsByClassName("preTab");
            x[n].style.display = "block";
            // ... and fix the Previous/Next buttons:
            if (n == 0) {
               document.getElementById("prevBtnPre").style.display = "none";
            } else {
               document.getElementById("prevBtnPre").style.display = "inline";
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
               //...the form gets submitted:
               document.getElementById("regPreForm").submit();
               return false;
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
            console.log(x[n]);
            x[n].className += " active";
         }

          function profitGraph(userEvalByProject){
             /* 수평 바 chart 이윤 증가율 */
             new Chart(document.getElementById("bar-chart-paral"), {
                type: 'bar',
                data: {
                  labels: ["수익성", "안정성", "성장성","호감도"],
                  datasets: [
                    {
                      label: "점",
                      backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                      data: userEvalByProject
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  scales: {
                      yAxes:[{
                       ticks:{
                          min:0
                       }   
                      }]
                    },
                  title: {
                    display: true,
                    text: '[매력도 평가(점)]'
                    
                  }
                }
            });
          }
          
      
      </script>
</body>

</html>