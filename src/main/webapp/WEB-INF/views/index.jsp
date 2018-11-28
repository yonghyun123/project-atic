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
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/slick.css" rel="stylesheet">
<link href="/resources/css/slick-theme.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Hero Area Start ##### -->
  <div style="height: 90px"></div>
  <section class=sector01>
    <div style="height: 5%"></div>
    <div id="mainVisual">
      <div class="single-item">
        <img src="/resources/img/bg-img/1.jpg"><img
          src="/resources/img/bg-img/2.jpg"> <img
          src="/resources/img/bg-img/3.jpg">
      </div>
    </div>
    <div id="rankingSection">
      <div class="hotClipWrapper">
       <div id="clipHeader">
        <h5>투자액 급등 종목</h5>
       </div>
       <div id="clipBody">
          <img id = "hotImage" src="/resources/img/bg-img/13.jpg">
          <div id="rankingList">
            <ol>
              <li><em>1</em><a>짜장면가게</a></li>
              <li><em>2</em><a>유산슬가게</a></li>
              <li><em>3</em><a>팔보체가게</a></li>
            </ol>
          </div>
       </div>
      </div>
    </div>
  </section>
  <!-- ##### Hero Area End ##### -->
  <!-- ##### Product Area Start ##### -->
  <section
    class="new-arrivals-products-area bg-gray section-padding-100">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>마감 임박!!</h2>
            <p>인기 사업에 투자하시고 금리해택 받아가세요.</p>
          </div>
        </div>
      </div>

      <div class="row">
      
  <c:forEach items="${hotList}" var="project">
        <!-- Single Product Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-product-area mb-50 wow fadeInUp"
            data-wow-delay="100ms">
            <!-- Product Image -->
            <div class="product-img">
              <a href="shop-details.html"><img
                src="/resources/img/project-image/${project.fileName}" alt=""></a>
              <!-- Product Tag -->
              <div class="product-tag">
                <a href="#">HOT</a>
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
</c:forEach>


        <div class="col-12 text-center">
          <a href="#" class="btn alazea-btn">View All</a>
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
  <c:forEach items="${nextList}" var="preProject">
        <!-- Single Blog Post Area -->
        <div class="col-12 col-md-6 col-lg-4">
          <div class="single-blog-post mb-100">
            <div class="post-thumbnail mb-30">
              <a href="single-post.html"><img
                src="/resources/img/project-image/${preProject.fileName}" alt=""></a>
            </div>
            <div class="post-content">
              <a href="single-post.html" class="post-title">
                <h5>Garden designers across the country forecast
                  ideas shaping the gardening world in 2018</h5>
              </a>
              <div class="post-meta">
                <a href="#"><i class="fa fa-clock-o"
                  aria-hidden="true"></i> 20 Jun 2018</a> <a href="#"><i
                  class="fa fa-user" aria-hidden="true"></i> Alan
                  Jackson</a>
              </div>
              <p class="post-excerpt">Integer luctus diam ac
                scerisque consectetur. Vimus ottawas nec lacus sit amet.
                Aenean interdus mid vitae.</p>
            </div>
          </div>
        </div>
</c:forEach>
      </div>
    </div>
  </section>
  <!-- ##### Blog Area End ##### -->

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
  <!-- slick js -->
  <script type="text/javascript" src="/resources/js/slick.min.js"></script>
  <script type="text/javascript">
			$(document).ready(function() {
				$('.single-item').slick({
					
					autoplay:true,
					autoplaySpeed:3000,
					dots: true,
					arrows: true,
					pauseOnHover:true
				});
			});
</script>
  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>

</html>