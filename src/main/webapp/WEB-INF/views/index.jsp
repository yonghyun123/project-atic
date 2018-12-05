<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/slick.css" rel="stylesheet">
<link href="/resources/css/slick-theme.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


<style type="text/css">
.slide-fade li {
	transition: all 0.4s ease-out;
	opacity: 0;
}

.slide-fade li.show {
	opacity: 1;
}


</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Hero Area Start ##### -->
  <div style="height: 90px; border-bottom: 1px solid #ebebe0" ></div>
  <section class="sector01">
    <div class="container">
      <div id="mainVisual">
        <div class="single-item">
          <a href="/shop/detail/pre/12"
            style="background-image: url('/resources/img/slider-img/index-slide1.png')">
            <p class="index-slider-text-title">
              서울 카페쇼에서 혁신상 수상!<br>
            </p>
            <p class="index-slider-text-content">
              음악과 함께하는 콜드브루 커피머신<br>
            </p>
          </a> <a href="/shop/detail/pre/4"
            style="background-image: url('/resources/img/slider-img/index-slide2.png')">
            <p class="index-slider-text-title">
              수요미식회 인정 한우<br>삼정하누<br>
            </p>
            <p class="index-slider-text-content">
              <br>
              <br> 한우의 프리미엄화를 선도하고 있습니다!<br>
            </p>
          </a> <a href="#"
            style="background-image: url('/resources/img/slider-img/index-slide3.png')">
            <p class="index-slider-text-title">
             펀딩형 자유적금 'ATIC'<br>
            </p>
            <p class="index-slider-text-content">
              우수 스타트업에 펀딩하면 늘어나는 적금 이율!<br>
            </p>
          </a>
        </div>
      </div>
      <div id="rankingSection">
        <div class="hotClipWrapper">
          <div id="clipHeader">
            <h5>금일 투자 급등 종목</h5>
          </div>
          <div id="clipBody">
            <div id="rankingList">
              <ol style="margin-left: 0" class="slide-fade">
                <c:choose>
                  <c:when test="${not empty riseProject }">
                    <c:forEach items="${riseProject}" var="project"
                      varStatus="status" end="5">
                      <li id="li${status.index+1 }"><em>${status.index+1 }</em><a
                        href="/shop/detail/${project.projectId }">${project.projectName }</a></li>
                    </c:forEach>
                  </c:when>
                </c:choose>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Hero Area End ##### -->
  <!-- ##### Product Area Start ##### -->
  <section class="new-arrivals-products-area bg-gray section-padding-50">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2 class="mt-50">마감 임박!!</h2>
            <p>인기 사업에 투자하시고 금리해택 받아가세요.</p>
          </div>
        </div>
      </div>

      <div class="row">
       <c:choose>
        <c:when test="${fn:length(hotList) != 0}">
        <c:forEach items="${hotList}" var="project">
          <!-- Single Product Area -->
          <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-product-area mb-50 wow fadeInUp"
              data-wow-delay="100ms">
              <!-- Product Image -->
              <div class="product-img">
                <a href="/shop/detail/${project.id }"><img
                  src="/resources/img/project-image/${project.fileName}"
                  alt=""></a>
                <!-- Product Tag -->
                <div class="product-tag">
                  <a href="/shop/detail/${project.id }">HOT</a>
                </div>
              </div>
              <!-- Product Info -->
              <div class="product-info mt-15 text-center">
                <a href="/shop/detail/${project.id }">
                  <p>
                  <h5>${project.name }</h5>
                  </p>
                </a>
                <h6>${project.description }</h6>
              </div>
            </div>
          </div>
        </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="col-12 col-md-12 col-lg-12 text-center"  style="margin-bottom:20px">
              <div style="width:100%"><h1 >진행중인 프로젝트가 존재하지 않습니다.</h1></div>
            </div>
        </c:otherwise>
        </c:choose>
        <div class="col-12 text-center">
          <a href="/shop/currentShop" class="btn alazea-btn">View All</a>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Product Area End ##### -->

  <!-- ##### Blog Area Start ##### -->
  <section class="alazea-blog-area section-padding-100-0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>등록 예정 사업</h2>
            <p>다음 달 시작할 모금 사업을 미리 확인 &amp; 예비평가 해주세요</p>
          </div>
        </div>
      </div>

      <div class="row justify-content-center">
        <c:choose>
          <c:when test="${fn:length(nextList) != 0}">
          <c:forEach items="${nextList}" var="preProject">
            <!-- Single Blog Post Area -->
            <div class="col-12 col-md-6 col-lg-4 text-center">
              <div class="single-blog-post mb-100">
                <div class="product-img mb-30">
                  <a href="/shop/detail/pre/${preProject.id }"><img
                    src="/resources/img/project-image/${preProject.fileName}"
                    alt=""></a>
                </div>
                <div class="post-content">
                  <a href="/shop/detail/pre/${preProject.id }"
                    class="post-title">
                    <h5>${preProject.name }</h5>
                  </a>
                  <p class="post-excerpt">${preProject.description }</p>
                </div>
              </div>
            </div>
          </c:forEach>
          </c:when>
          <c:otherwise>
            <div class="col-12 col-md-12 col-lg-12 text-center"  style="margin-bottom:20px">
              <div style="width:100%"><h1 >진행 예정 프로젝트가 존재하지 않습니다.</h1></div>
            </div>
          </c:otherwise>
        </c:choose>
         <div class="col-12 text-center" style="margin-bottom:20px">
          <a href="/shop/preShop" class="btn alazea-btn">View All</a>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Blog Area End ##### -->

  <!-- ##### All Javascript Files ##### -->
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

  <script type="text/javascript">
			$(document).ready(function() {

				$('.single-item').slick({
					autoplay : true,
					autoplaySpeed : 3000,
					pauseOnHover : true
				});

			});

			$(window).load(function() {
				function addShow(i) {
					$("#li" + i).addClass('show');
				}
				test = function() {
					for (i = 1; i < 6; i++) {
						(function(x) {
							setTimeout(function() {
								addShow(x);
								
							}, 700 * x);
						})(i);
					}
				}();

				//if(i-1 != 0){
				// preList.removeClass("show");
				//}
				//}
			});
			//while(true){

			//}
		</script>
  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>

</html>