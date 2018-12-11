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
	margin-top: 10;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	font-weight: 1000;
	font-size: 20;
	font: black;
}

#product-img{
  height:600px;
}
#comRegist, #regDir {
	margin-bottom: 50;
}

#com-dir-Reg .dirRegist {
	max-width: 1000px !important;
	max-height: 100%;
	margin-top: 1% !important;
}

#com-Reg .Regist {
	max-width: 1000px !important;
	margin-top: 1% !important;
}

.regText, .regForm, .regDirForm {
	width: 60% !important;
}

.regTextInline, .regDateInline {
	width: 80% !important;
}

.regTab, .regDirTab {
	margin-left: 20%;
}

.slick-slide {
	height: auto;
}

.btn {
	margin-left: 10;
}

.firstClass, .secondClass, .thirdClass {
	padding: 10px;
	width: 23%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
	display: inline-block;
}

.investHistory, .hasPatent, .comSelect {
	padding: 10px;
	width: 23%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
	display: inline-block;
}

.Invest {
	margin-bottom: 10px;
}

.authList {
	margin-bottom: 10px;
}
</style>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
  <%@ include file="/WEB-INF/views/modal/companyRegist.jsp"%>
  <%@ include file="/WEB-INF/views/modal/companyDirRegist.jsp"%>

  <!-- ##### Breadcrumb Area Start ##### -->
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
            <h2>하나금융의 스타트업 지원 사례</h2>
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
            <h2>하나금융 스타트업 금융지원 절차</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="responsive" style="width: 100%">
          <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-product-area mb-100">
              <!-- Product Image -->
              <div class="product-img" id="product-img">
                <div class="introHeader">
                  <p>지원 절차</p>
                  <p>1. "기업정보 등록" 을 통해 사전 심사 서류를 제출합니다.</p>
                  <p>2. 등록 후, 인터뷰를 통해 본 심사 절차와 제출 서류를 안내받습니다.</p>
                  <p>3. 안내 후, "바로 신청하기"를 통해 필요 서류를 제출합니다.</p>
                  <p>4. 제출 후,  1차 심사를 진행합니다.
                  <p>5. 1차 심사 선발 기업은 플랫폼을 통해 고객 사전평가와 적금펀딩을 시작합니다.</p>
                  <p>6. 펀딩 후, 본심사 결과와 평가/펀딩 결과를 종합하여 금융 지원 스타트업을 최종선발 합니다.</p>
                  
                  
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-product-area mb-100">
              <!-- Product Image -->
              <div class="product-img" id="product-img">
                <div class="introHeader">
                  <p>고객 사전평가/펀딩 절차</p>
                  <p>1. 1차심사를 통해 선발된 기업은 1차 심사 점수를 바탕으로 목표 모금액을 산정합니다.</p>
                  <p>2. 플랫폼을 통해 펀딩 전 고객 사전평가를 진행합니다.</p>
                  <p>3. 사전평가 종료 후 , 약 20일간 펀딩을 진행합니다.</p>
                  <p>4. 펀딩 종료 후, 목표 모금액을 달성한 기업을 대상으로 최종심사를 진행합니다.</p>
                  <p>5. 선발된 기업은 향후 1년간 하나금융의 스타트업 금융지원을 받게됩니다.</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-product-area mb-100">
              <!-- Product Image -->
              <div class="product-img" id="product-img">
                <div class="introHeader">
                  <p>평가 절차</p>
                  <p>Atic 스타트업 지원은 총 3번의 심사를 거치게 됩니다.</p>
                  <p>1. 필요서류제출 후, 1차 심사를 통해 신청기업의 모금 참가여부를 결정합니다.</p>
                  <p>2. 고객 사전 평가와 펀딩 목표 달성여부를 통해 최종 심사여부를 결정합니다.</p>
                  <p>3. 펀딩 후, 최종 심사를 통해 최종 선발 여부를 결정합니다.
                </div>
              </div>
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
  <!-- slick js -->
  <script type="text/javascript" src="/resources/js/slick.min.js"></script>
  <!-- 등록 모달 -->
  <script type="text/javascript" src="/resources/js/companyDirRegist.js"></script>
  <script type="text/javascript" src="/resources/js/companyRegist.js"></script>

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