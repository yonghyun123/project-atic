<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
</head>

<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    
    <!-- ##### Breadcrumb Area Start ##### -->
      <div style="height: 90px"></div>
      
  <section class=PreProjctSector01>
    <nav id="investNav"style="height: 10%">
      <ul>
        <li>펀딩 홈</li>
        <li>진행중</li>
        <li>오픈예정</li>
        <li>스타트업</li>
        <li>HOT Company</li>
        
        
      </ul>
    </nav>
    <div id="mainView">
      <div class="single-item">
        <img src="/resources/img/bg-img/1.jpg"><img
          src="/resources/img/bg-img/2.jpg"> <img
          src="/resources/img/bg-img/3.jpg">
      </div>
    </div>
  </section>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-20-100">
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <p>진행중인 펀딩이 <c:out value="${count }"/>건 있습니다</p>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
                                <select id="search_by" class="custom-select widget-title">
                                  <option selected>정렬</option>
                                  <option value="1">목표 금액 순</option>
                                  <option value="2">달성률 순</option>
                                  <option value="3">예비 평점 순</option>
                                </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- All Products Area -->
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="shop-products-area">
                        <div class="row" id="templateBody">
                        
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
<script id="templateList" type="text/template">
<div class="col-12 col-sm-6 col-lg-4">
<div class="single-product-area mb-50">
    <!-- Product Image -->
    <div class="product-img">
    <form id="form{id}" action="/shop/details" method="post">
        <a href="/shop-details">
        <img src="/resources/img/project-image/{fileName }" alt=""></a>
        <input type="hidden" value="{id }">
        <!-- Product Tag -->
        <div class="product-tag">
            <a href="#">Hot</a>
        </div>
        </form>
    </div>
    <!-- Product Info -->
    <div class="product-info mt-15 text-center">
        <a href="/shop-details">
            <h6> {name } </h6>
        </a>
        <h6>업종 : {category } / 목표금액 : {goal }</h6>
    </div>
</div>
</div>
</script>

<script type="text/javascript">
$(document).on("change", "#search_by", function(event) {
var condition = $("#search_by option:selected").val();
 if(condition != '정렬'){
  alert(condition);
   $.ajax({
    type : "post",
    url : "/shop/search",
    dataType : "text",
    data : {
      'condition' : condition
    },
    success : function(data){
      alert(data);
    },
    error : function(data){
      alert('실패'+data.responseText);
    }
  }); 
}
});
</script>

</html>