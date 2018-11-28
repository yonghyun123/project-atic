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
    
</head>

<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    
    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/img/bg-img/24.jpg);">
            <h2>Shop</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Shop</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <p>진행중인 펀딩이 <c:out value="${count }"/>건의 있습니다</p>
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
                <c:forEach var="project" items="${list }" varStatus="status">
                        <div class="col-12 col-sm-6 col-lg-4">
                          <div class="single-product-area mb-50">
                              <!-- Product Image -->
                              <div class="product-img">
                                  <a href="/shop/detail/${project.id }">
                                  <img src="/resources/img/project-image/${project.file_name }" alt=""></a>
                                  <!-- Product Tag -->
                                  <div class="product-tag">
                                      <a href="#">Hot</a>
                                  </div>
                              </div>
                              <!-- Product Info -->
                              <div class="product-info mt-15 text-center">
                                  <a href="/shop/detail/${project.id }">
                                      <h6> ${project.name } </h6>
                                  </a>
                                  <h6>업종 : ${project.category } / 목표금액 : ${project.goal }</h6>
                              </div>
                          </div>
                          </div>
                    </c:forEach>
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

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>

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

<script type="text/javascript">
$(document).on("change", "#search_by", function(event) {
var condition = $("#search_by option:selected").val();
	 $.ajax({
		type : "post",
		url : "/shop/search",
		dataType : "text",
		data : {
			'condition' : condition
		},
		success : function(data){
			var jsonModifyData = JSON.parse(data);
          	searchTemplate(jsonModifyData);
		}
	}); 
});
function searchTemplate(jsonModifyData) {
    var templateHtml = document.querySelector('#templateList').innerHTML;
    var originHtml = document.querySelector('#templateBody');
    var newHtml = '';
    jsonModifyData.forEach(function(v, i) {
      newHtml += templateHtml.replace('{id}', v.id)
          				  .replace('{fileName}', v.fileName)
          				  .replace('{name}', v.name)
          				  .replace('{category}', v.category)
          				  .replace('{goal}', v.goal)
    });
    originHtml.innerHTML = newHtml;
  }
  
$(".move").on("click",function(e) {
	e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
			actionForm.attr("action","/spring/board/get");
			actionForm.submit();
		});
</script>
</html>