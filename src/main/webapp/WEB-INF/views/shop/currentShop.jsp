<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<link rel="icon" href="/resources/img/hanalogo.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="/resources/css/style.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/resources/css/common.css">
    <!-- shopCommon -->
    <link href="/resources/css/shopPage.css" rel="stylesheet">
    <!-- slick -->
    <link href="/resources/css/slick.css" rel="stylesheet">
    <link href="/resources/css/slick-theme.css" rel="stylesheet">    
</head>

<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    
    <!-- ##### slide Area Start ##### -->
    <section class="sector01" id="shop-sec">
      <nav id="investNav"style="height: 11% " >
        <ul>
          <li id="investMain"><a href="/shop/" class="navText">펀딩 홈</a></li>
          <li class="monthProject active"><a href="/shop/currentShop" class="navText active">진행중</a></li>
          <li class="monthProject"><a href="/shop/preShop" class="navText">오픈예정</a></li>
          <li class="monthProject"><a href="/shop/finishShop" class="navText">마감</a></li>
        </ul>
      </nav>
      <div class="col-md-12 shop-slide-row" style="height: 90%">
        <div>
          <div class="single-item">
            <a href="#"
            style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/shop-slide1.png'); background-size: 100% 100%">
            <p class="index-slider-text-title">
              A-TIC x 하나은행<br>
            </p>
            <p class="index-slider-text-content">
              기존과는 다른 새로운 개념의 적금 플랫폼!<br>
            </p>
          </a> <a href="#"
            style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/shop-slide2.png'); background-size: 100% 100%">
            <p class="index-slider-text-title">
              함께할수록 올라가는 이율
              <br>
            </p>
            <p class="index-slider-text-content">
              모금액 100% 달성 기업을 맞춰보세요!<br>
            </p>
          </a> <a href="#"
            style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/shop-slide3.png'); background-size: 100% 100%">
            <p class="index-slider-text-title">
              유망 스타트업 진흥 프로젝트
            </p>
            <p class="index-slider-text-content">
              스타트업들의 성장을 목표로합니다.
            </p>
          </a>
          </div>
        </div>
      </div>
    </section>
    <!-- ##### slide Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-20-100">
        <div class="col-md-10" style="margin: 0 auto;">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count" id="countBody">
                            <p>진행중인 펀딩이 <c:out value="${curList.size() }"/>건 있습니다</p>
                        </div>
                        <!-- Search by Terms -->
                        <c:if test="${fn:length(curList) != 0}">
                        <div class="search_by_terms">
                                <select id="search_by" class="custom-select widget-title">
                                  <option selected value="goal">정렬</option>
                                  <option value="goal">목표 금액 순</option>
                                  <option value="eval">예비 평점 순</option>
                                </select>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- All Products Area -->
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="shop-products-area">
                        <div class="row" id="templateBody">
                        <c:choose>
                <c:when test="${fn:length(curList) != 0}">
                          <c:forEach var="project" items="${curList }" varStatus="status">
                          <c:choose>
                          <c:when test="${fn:contains(project.finish,'end')}">
                          <div class="col-12 col-sm-6 col-lg-4">
                            <div class="single-product-area mb-50">
                                <!-- Product Image -->
                                <div class="product-img" style="background-image: url(/resources/img/project-image/<c:out value='${project.fileName }'/>);  background-repeat: no-repeat; width: 100%; height: 300px; background-size: cover;">
                                  <p style="background-color: rgba(17, 17, 17, 0.5);height: 100%;margin: 0;">
                                  </p>
                                  <h2 class="closeProject" >마감</h2>
                                </div>
                                <!-- Product Info -->
                                <div class="product-info mt-15 text-center finish-product">
                                    <h6> ${project.name } </h6>
                                    <h6>업종 : ${project.category } / 목표금액 : <fmt:formatNumber value="${project.goal }" pattern="#,###"/></h6>
                                </div>
                              </div>
                            </div>
                          </c:when>
                          <c:otherwise>
                          <div class="col-12 col-sm-6 col-lg-4">
                            <div class="single-product-area mb-50">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <a href="/shop/detail/${project.id }">
                                    <img src="/resources/img/project-image/${project.fileName }" alt=""></a>
                                    <!-- Product Tag -->
                                    <c:choose>
                                      <c:when test="${project.progress >= 70 }">
                                      <div class="product-tag">
                                        <a href="#">Hot</a>
                                    </div>
                                      </c:when>
                                    </c:choose>
                                </div>
                                
                                
                                <!-- Product Info -->
                       <div class="product-info mt-15 text-center" style="border:2px solid #e4e4e4; height: 250px; padding:25px">
                        <div class="thisMonth-tag">
                          <a style="border: 2px solid white; width:100px; margin-bottom: 10%; background-color: #00bf99;" class="nowName">진행중</a>
                         </div>
                          <span class="category">업종</span><span> ${project.category }</span>
                          <span class="targetAmount" > 목표금액 </span><span><fmt:formatNumber value="${project.goal }" pattern="#,###"/>원</span>
                          <div>
                          <div ><a href="/shop/detail/${project.id }"><p style="font-weight:1000; font-size: 20px; color:black;">${project.name}</p></a></div>
                          <p>${project.title}</p>
                        </div>
                      </div>
                                
                              </div>
                            </div>
                          </c:otherwise>
                          </c:choose>
                          </c:forEach>
                          </c:when>
                          <c:otherwise>
                            <div class="col-12 col-md-12 col-lg-12 text-center" style="margin-bottom: 20px">
                    <div style="width: 100%">
                      <h1>진행중인 프로젝트가 존재하지 않습니다.</h1>
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
    <!-- projectCard 템플릿 -->
    <script id="templateList" type="text/template">
  	<div class="col-12 col-sm-6 col-lg-4">
    <div class="single-product-area mb-50">
      <!-- Product Image -->  
      <div class="product-img">
          <a href="/shop/detail/{id}">
          <img src="/resources/img/project-image/{fileName}" alt=""></a>
         <!-- Product Tag -->
			{tag}
     </div>
     <!-- Product Info -->
<div class="product-info mt-15 text-center" style="border:2px solid #e4e4e4; height: 250px; padding:25px">
                        <div class="thisMonth-tag">
                          <a style="border: 2px solid white; width:100px; margin-bottom: 10%; background-color: #00bf99;" class="nowName">진행중</a>
                         </div>
                          <span class="category">업종</span><span> {category}</span>
                          <span class="targetAmount" > 목표금액 </span><span>{goal}원</span>
                          <div>
                          <div ><a href="/shop/detail/{id}"><p style="font-weight:1000; font-size: 20px; color:black;">{name}</p></a></div>
                          <p>{title}</p>
                        </div>
                      </div>
      </div>
   </div>
   </script>
   <script id="endTemplateList" type="text/template">
    <div class="col-12 col-sm-6 col-lg-4">
    	<div class="single-product-area mb-50">
        	<!-- Product Image -->
            	<div class="product-img" style="background-image: url(/resources/img/project-image/{fileName});  background-repeat: no-repeat; width: 100%; height: 300px; background-size: cover;">
                	<p style="background-color: rgba(17, 17, 17, 0.5);height: 100%;margin: 0;"></p>
                   	<h2 class="closeProject" >마감</h2>
                </div>
            <!-- Product Info -->
<div class="product-info mt-15 text-center" style="border:2px solid #e4e4e4; height: 250px; padding:25px">
                          <span class="category">업종</span><span> {category}</span>
                          <span class="targetAmount" > 목표금액 </span><span>{goal}원</span>
                          <div>
                          <div ><a href="/shop/detail/{id}"><p style="font-weight:1000; font-size: 20px; color:black;">{name}</p></a></div>
                          <p>{title}</p>
                        </div>
                      </div>
        </div>
   </div>
   </script>
   <script type="text/javascript">
      $(document).ready(function() {
    	  $('.closeProject').css("font-size","65px").css("color","#ffffff").css("margin-top","-195px").css("text-align","center");
    	  $("#funding").addClass("active");
		  //$("#guide").removeClass("active");
		  //$("#my-page").removeClass("active");
        $('.single-item').slick({
          autoplay:true,
          autoplaySpeed:3000,
          dots: false,
          arrows: false,
          pauseOnHover:true
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
			'whichProject' : 'curProject'
		},
		success : function(data){
			var jsonModifyData = JSON.parse(data);
          	searchTemplate(jsonModifyData);
		}
	}); 
});
function searchTemplate(jsonModifyData) {
	//템플릿 내용
    var templateHtml = document.querySelector('#templateList').innerHTML;
    var endTemplateHtml = document.querySelector('#endTemplateList').innerHTML;
    //
	var originHtml = document.querySelector('#templateBody');
    var newHtml = '';
    var projectCount = 0;
    jsonModifyData.forEach(function(v, i) {
    	projectCount++;
    	if(v.finish=='end'){
    		 newHtml += endTemplateHtml.replace(/{id}/gi, v.id)
				  .replace('{fileName}', v.fileName)
				  .replace('{name}', v.name)
				  .replace('{category}', v.category)
				  .replace('{goal}', v.goal)
				  .replace(/{progress}/gi,v.progress)
				  .replace('{title}',v.title)
    	} else {
    		if(v.progress < 70){
      newHtml += templateHtml.replace(/{id}/gi, v.id)
          				  .replace('{fileName}', v.fileName)
          				  .replace('{name}', v.name)
          				  .replace('{category}', v.category)
          				  .replace('{goal}', v.goal)
          				  .replace(/{progress}/gi,v.progress)
          				  .replace('{tag}','')
  				  		  .replace('{title}',v.title)
    		} else {
      newHtml += templateHtml.replace(/{id}/gi, v.id)
          				  .replace('{fileName}', v.fileName)
          				  .replace('{name}', v.name)
          				  .replace('{category}', v.category)
          				  .replace('{goal}', v.goal)
          				  .replace(/{progress}/gi,v.progress)
          				  .replace('{tag}',' <div class="product-tag"> <a href="#">Hot</a> </div>')
          				  .replace('{title}',v.title)
    			
    		}
    	}
    });
    originHtml.innerHTML = newHtml;
    var counterHtml = document.querySelector("#countBody")
    counterHtml.innerHTML = "<p>진행중인 펀딩이 "+ projectCount + "건 있습니다.</p>" ;
    $('.closeProject').css("font-size","65px").css("color","#ffffff").css("margin-top","-195px").css("text-align","center");
  }
</script>


</html>