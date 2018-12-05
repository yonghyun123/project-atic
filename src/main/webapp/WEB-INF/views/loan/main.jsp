<%@page import="com.keb.atic.user.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- slick CSS -->
<link href="/resources/css/slick.css" rel="stylesheet">
<link href="/resources/css/slick-theme.css" rel="stylesheet">

</head>
<style type="text/css">
p {
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	font-weight: 1000;
	font-size: 20;
	font: black;
}

#comRegist, #regDir {
	margin-bottom: 50;
}

.modal-dialog {
	max-width: 1000px;
}

.regText {
	width: 60%;
}

.regTab {
	margin-left: 20%;
}

.slick-slide{
  height: auto;
}
</style>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
  <%@ include file="/WEB-INF/views/modal/companyRegist.jsp"%>
  <!-- ##### Breadcrumb Area Start ##### -->
  <div style="height: 90px; border-bottom: 1px solid #ebebe0"></div>
  <div class="breadcrumb-area">
    <!-- Top Breadcrumb Area -->
    <div
      class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
      style="background-image: url(/resources/img/hanabank2.jpg);">
      <h2>기업 대출 신청</h2>
    </div>
  </div>
  <div class="row"
    style="margin-top: 3%; margin-left: 5%; background-color:">
    <div id="registBar" class="col-12">
      <div id=" registInfo" class="col-6" style="display: inline-block;">
        <div class="col-7"
          style="display: inline-block; margin-left: 5%">
          <p>
            간단한 기업정보 등록 후,<br> 대출&펀딩 상담을 받고 싶으시다면?
          </p>
        </div>
        <div class="col-2" style="display: inline-block;">
          <input type="button" id="comRegist" value="기업정보 등록"
            class="btn alazea-btn ml-15">
        </div>
      </div>
      <div id=" registDir" class="col-5" style="display: inline-block;">
        <div class="col-7"
          style="display: inline-block; margin-left: 5%">
          <p>
            서류 준비가 완료되어,<br> 바로 신청 가능 하다면?
          </p>
        </div>
        <div class="col-2" style="display: inline-block;">
          <input type="button" id="regDir" value="바로 신청하기"
            class="btn alazea-btn ml-15">
        </div>
      </div>
    </div>
  </div>
  <!-- ##### Related Product Area Start ##### -->
  <div class="related-products-area"
    style="border-bottom: 1px solid #ebebe0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>Atic 기업대출을 통해 성공한 사례</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="responsive" style="width: 100%">
          <c:choose>
            <c:when test="${not empty successProjectList }">
              <c:forEach var="projects" items="${successProjectList}"
                varStatus="status">
                <div class="col-12 col-sm-6 col-lg-3">
                  <div class="single-product-area mb-100">
                    <!-- Product Image -->
                    <div class="product-img">
                      <a href="/shop/detail/${projects.id }"> <img
                        src="/resources/img/project-image/${projects.id }_th.png"
                        alt=""></a>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="col-12 col-md-12 col-lg-12 text-center"
                style="margin-bottom: 20px">
                <div style="width: 100%">
                  <h1>훌륭한 성공 사례가 존재하지 않습니다.</h1>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>

  <div class="related-products-area"
    style="border-bottom: 1px solid #ebebe0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>하나 은행의 창업지원 대출 프로그램 Atic</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
    </div>
  </div>

  <div class="related-products-area"
    style="border-bottom: 1px solid #ebebe0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>Atic 창업지원대출 신청방법</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
    </div>
  </div>

  <div class="related-products-area"
    style="border-bottom: 1px solid #ebebe0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>모금펀딩 진행절차</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
        </div>
      </div>
      <div class="row">
        <div>
          <h1>header</h1>
        </div>
        <div>
          <h4>contents</h4>
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

  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>

  <script type="my-template" id="review-list">
	<a class="list-group-item">
		<h6 class="list-group-item-heading" style="float: left; margin-right: 50px; "> <img class="card-img-top profile-img" style="width:50px; height:50px" src="/user/profile/{profile}" alt="Card image cap"></h6>
		<p  style="float: left; margin-right: 50px; ">아이디:{userId}</p>
		<p>{createDate}</p>
		<h4>{content}</h4>
	</a>
	</script>

  <script type="text/javascript">

  $("#comRegist").click(function() {
      $("#com-Reg").modal('show');
   });
   
			var currentTab = 0; // Current tab is set to be the first tab (0)
			showTab(currentTab); // Display the current tab

			function showTab(n) {
				// This function will display the specified tab of the form ...
				console.log('n:' + n);
				var x = document.getElementsByClassName("regTab");
				console.log('x='+ x.length);
				x[n].style.display = "block";
				// ... and fix the Previous/Next buttons:
				if (n == 0) {
					document.getElementById("prevBtnReg").style.display = "none";
					document.getElementById("nextBtnReg").disabled = false;
				} else {
					document.getElementById("prevBtnReg").style.display = "inline";
				}
				if (n == (x.length - 1)) {
					document.getElementById("nextBtnReg").innerHTML = "Submit";
					document.getElementById("nextBtnReg").disabled = true;

				} else {
					document.getElementById("nextBtnReg").innerHTML = "Next";
				}
				// ... and run a function that displays the correct step indicator:
				fixStepIndicator(n)
			}

			function nextPrev(n) {
				// This function will figure out which tab to display
				var x = document.getElementsByClassName("regTab");
				
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
					$("#com-Reg").modal('hide');
					return false;
				}
				// Otherwise, display the correct tab:
				showTab(currentTab);
			}

			function validateForm() {
				// This function deals with validation of the form fields
				var x, y, i, valid = true;
				x = document.getElementsByClassName("regTab");
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

		</script>
  <script type="text/javascript">
     $(document).ready(function() {
			$('.responsive').slick({
				infinite : false,
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