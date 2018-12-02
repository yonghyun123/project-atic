<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="icon" href="/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="/resources/css/style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/common.css">

<!-- slick -->
<link href="/resources/css/slick.css" rel="stylesheet">
<link href="/resources/css/slick-theme.css" rel="stylesheet">

<style type="text/css">
.titleRow {
	margin: 3% 3% 3% 0;
	line-height: 32px;
	letter-spacing: 0;
	color: rgba(0, 0, 0, .84);
	font-size: 24px;
	font-weight: 700;
}
</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
  <!-- ##### slide Area Start ##### -->
  <div style="height: 90px;  border-bottom: 1px solid #ebebe0"></div>
  <section class="sector01" id="shop-sec">
    <nav id="investNav"">
      <ul>
        <li id="investMain"><a href="/shop/" class="navText">펀딩
            홈</a></li>
        <li class="monthProject"><a href="/shop/currentShop"
          class="navText">진행중</a></li>
        <li class="monthProject"><a href="/shop/preShop"
          class="navText">오픈예정</a></li>
      </ul>
    </nav>
    <div class="shop-slide-row">
      <div>
        <div class="single-item">
          <a href="/shop/detail/pre/12"
            style="background-image: url('/resources/img/slider-img/shop-slide1.png')">
            <p class="index-slider-text-title">
              서울 카페쇼에서 혁신상 수상!<br>
            </p>
            <p class="index-slider-text-content">
              음악과 함께하는 콜드브루 커피머신<br>
            </p>
          </a> <a href="/shop/detail/pre/4"
            style="background-image: url('/resources/img/slider-img/shop-slide2.png')">
            <p class="index-slider-text-title">
              수요미식회 인정 한우<br>삼정하누<br>
            </p>
            <p class="index-slider-text-content">
              <br>
              <br> 한우의 프리미엄화를 선도하고 있습니다!<br>
            </p>
          </a> <a href="#"
            style="background-image: url('/resources/img/slider-img/shop-slide3.png')">
            <p class="index-slider-text-title">
              이율이 늘어나는 자유적금<br>
            </p>
            <p class="index-slider-text-content">
              100% 달성 기업을 맞추며 이율을 늘려보세요!<br>
            </p>
          </a>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### slide Area End ##### -->

  <!-- ##### Shop Area Start ##### -->
  <section class="shop-page section-padding-20-100">
    <div class="container">
      <div class="titleRow">현재 진행중인 프로젝트</div>
      <div class="row">
        <!-- All Products Area -->
        <div class="col-12 col-md-12 col-lg-12">
          <div class="shop-products-area">
            <div class="row" id="templateBody">
             <c:choose>
                <c:when test="${fn:length(curList) != 0}">  
                <c:forEach var="project" items="${curList }"
                  varStatus="status">
                  <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-product-area mb-50">
                      <!-- Product Image -->
                      <div class="product-img">
                        <form id="form${project.id}"
                          action="/shop/details" method="post">
                          <a href="/shop/detail/${project.id }"> <img
                            src="/resources/img/project-image/${project.fileName }"
                            alt=""></a> <input type="hidden"
                            value="${project.id }">
                          <!-- Product Tag -->
                          <div class="product-tag">
                            <a href="#">Hot</a>
                          </div>
                        </form>
                      </div>
                      <!-- Product Info -->
                      <div class="product-info mt-15 text-center">
                        <a href="/shop-details">
                          <h6>${project.name }</h6>
                        </a>
                        <h6>업종 : ${project.category } / 목표금액 :
                          ${project.goal }</h6>
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
            </div>
          </div>
        </div>
      </div>
      <div class="titleRow">다음달 등록예정 프로젝트</div>
      <div class="row">
        <!-- All Products Area -->
        <div class="col-12 col-md-12 col-lg-12">
          <div class="shop-products-area">
            <div class="row" id="templateBody">
              <c:choose>
                <c:when test="${fn:length(preList) != 0}">
                  <c:forEach var="project" items="${preList }"
                    varStatus="status">
                    <div class="col-12 col-sm-6 col-lg-4">
                      <div class="single-product-area mb-50">
                        <!-- Product Image -->
                        <div class="product-img">
                          <a href="/shop/detail/pre/${project.id }">
                            <img
                            src="/resources/img/project-image/${project.fileName }"
                            alt="">
                          </a>
                          <!-- Product Tag -->
                          <div class="product-tag">
                            <a href="#">Hot</a>
                          </div>
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                          <a href="/shop/detail/${project.id }">
                            <h6>${project.name }</h6>
                          </a>
                          <h6>업종 : ${project.category } / 목표금액 :
                            ${project.goal }</h6>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="col-12 col-md-12 col-lg-12 text-center"
                    style="margin-bottom: 20px">
                    <div style="width: 100%">
                      <h1>진행 예정 프로젝트가 존재하지 않습니다.</h1>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Shop Area End ##### -->

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
  <script type="text/javascript">
			$(document).ready(function() {
				$('.single-item').slick({
					autoplay : true,
					autoplaySpeed : 3000,
					dots : false,
					arrows : true,
					pauseOnHover : true
				});
			});
		</script>
  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	$(document).on("change", "#search_by", function(event) {
		var condition = $("#search_by option:selected").val();
		$.ajax({
			type : "post",
			url : "/shop/search",
			dataType : "text",
			data : {
				'condition' : condition,
				'whichProject' : whichProject
			},
			success : function(data) {
				var jsonModifyData = JSON.parse(data);
				searchTemplate(jsonModifyData);
			}
		});
	});
	function searchTemplate(jsonModifyData) {
		//템플릿 내용
		var templateHtml = document.querySelector('#templateList').innerHTML;
		//
		var originHtml = document.querySelector('#templateBody');
		var newHtml = '';
		var projectCount = 0;
		jsonModifyData.forEach(function(v, i) {
			projectCount++;
			newHtml += templateHtml.replace('{id}', v.id).replace('{fileName}',
					v.fileName).replace('{name}', v.name).replace('{category}',
					v.category).replace('{goal}', v.goal)
		});
		originHtml.innerHTML = newHtml;
		var counterHtml = document.querySelector("#countBody")
		counterHtml.innerHTML = "<p>진행중인 펀딩이 " + projectCount + "건 있습니다.</p>";
	}

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/spring/board/get");
				actionForm.submit();
			});
</script>
<!-- projectCard 템플릿 -->
<script id="templateList" type="text/template">
  <div class="col-12 col-sm-6 col-lg-4">
  <div class="single-product-area mb-50">
      <!-- Product Image -->  
      <div class="product-img">
      <form id="form{id}" action="/shop/details" method="post">
          <a href="/shop-details">
          <img src="/resources/img/project-image/{fileName}" alt=""></a>
         <input type="hidden" value="{id}">
         <!-- Product Tag -->
         <div class="product-tag">
             <a href="#">Hot</a>
         </div>
         </form>
     </div>
     <!-- Product Info -->
     <div class="product-info mt-15 text-center">
         <a href="/shop-details">
             <h6> {name} </h6>
         </a>
         <h6>업종 : {category} / 목표금액 : {goal}</h6>
     </div>
    </div>
  </div>
</script>

</html>