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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
.slide-fade li {
  transition: all 0.4s ease-out;
  opacity: 0;
}

.slide-fade li.show {
  opacity: 1;
}

.section-heading{
  margin-bottom:20px;
}

#projecthead{
  background: url("/resources/img/bg-img/bg_line_title.png") repeat-x 0 center;
  text-align: center
}
#projecthead #projectContext{
    padding: 0 20px;
    display: inline-block;
    width: auto;
    height: 30px;
    line-height: 30px;
    font-size: 24px;
    font-weight: normal;
    background: #f8f8f8;
    color:#4a4a4a;
}

.nowName{
  color:white;
  font-weight: 1000;
}
.preName{
  color:white;
  font-weight: 1000;
}

  .thisMonth-tag{
  border-radius: 2px;
    display: inline-block;
    height: 20px;
    line-height: 20px;
    text-transform: uppercase;
    color: #ffffff;
    font-weight: 700;
    font-size: 12px;
    position: absolute;
    top: 20px;
    left: 10px;
    text-align:center;
    z-index: 10;
}

.nowNameSub{
  color:white;
  font-size:13;
}

a{
  color:#303030;
}

p:hover, a:hover, a:focus, p:focus{
text-decoration:none;
}

#mainVisual {
    display:inline-block;
    width: 63.5%;
    margin: 0 3.5% 0 0%;

}
#rankingSection {
  float:none;
    display:inline-block;
    width: 30%;
    height: 100%;
    margin-right: 1%:;
}
.new-arrivals-products-area {
    padding-bottom: 0px;
}
.containerOne{
  margin-left: 1.5%;
  width:100%;
}


</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Hero Area Start ##### -->
<div style="background:#f8f8f8;">
 <div style="margin: 0 15% 0 15%;" >
  <section class="sector01">
    <div class="containerOne">
      <div id="mainVisual">
        <div class="single-item">
          <div 
            style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/index-slide1.png'); background-size: 100% 100%">
            <p class="index-slider-text-title">
              A-TIC x 하나은행<br>
            </p>
            <p class="index-slider-text-content">
              기존과는 다른 새로운 개념의 적금 플랫폼!<br>
            </p>
          </div>
          <div
           style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/index-slide2.png'); background-size: 100% 100%">
            <p class="index-slider-text-title">
              함께할수록 올라가는 이율
              <br>
            </p>
            <p class="index-slider-text-content">
              모금액 100% 달성 기업을 맞춰보세요!<br>
            </p>
          </div>
           <div style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/resources/img/slider-img/index-slide3.png'); background-size: 100% 100%">
             <p style="background-size:676px 329px" class="index-slider-text-cover"></p>
            <p class="index-slider-text-title">
              유망 스타트업 진흥 프로젝트
            </p>
            <p class="index-slider-text-content"> 
              스타트업들의 성장을 목표로합니다.
            </p>
          </div>
        </div>
      </div>
      <div id="rankingSection">
        <div class="hotClipWrapper">
          <div id="clipHeader" style="background-color: #efefef">
            <p>실시간 Best 투자</p>
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
  <section class="new-arrivals-products-area bg-gray section-padding-50" style="margin-top:50px;">
    <div class="container">

      <div class="row">
       <c:choose>
        <c:when test="${fn:length(hotList) != 0}">
        <c:forEach items="${hotList}" var="project">
          <!-- Single Product Area -->
          <div class="col-12 col-sm-6 col-lg-4" >
            <div class="single-product-area mb-30  wow fadeInUp"
            
              data-wow-delay="100ms" style="border:1px solid #e4e4e4">
              <!-- Product Image -->
              <div class="product-img">
                <a href="/shop/detail/${project.id }"><img
                  src="/resources/img/project-image/${project.fileName}"
                  alt=""></a>
                <!-- Product Tag -->
                   <div class="thisMonth-tag">
                  <a style="border: 1.5px solid white; width:100px; margin-bottom: 10%; background-color: none;" class="nowName">진행중</a>
                </div>
              </div>
              <!-- Product Info -->
              <div class="product-info mt-0 text-center" style="background-color:rgb(255, 111, 97); height:250px;padding-top: 20px;">
                <div style="margin:0 15% 0 15%">
                <a style="margin-top:5%" href="/shop/detail/${project.id }">
                  
                  <p class="nowName">
                  ${project.name }
                  </p>
                  <p class="nowNameSub" style="margin-top:30px;">
                  ${project.title}
                  </p>
                  
                </a>
                </div>
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
        <div style="margin-bottom:5px">
        <a style="font-weight: 100;" href="/shop/currentShop">전체 보기 <i class="glyphicon glyphicon-menu-right"></i></a>
        </div>
    </div>
  </section>
  <!-- ##### Product Area End ##### -->

  <!-- ##### Blog Area Start ##### -->
  <section class="alazea-blog-area section-padding-50-0">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2 class="mt-50" id="projecthead">
            <p id="projectContext">다음 달 데뷔예정</p>
            </h2>
          </div>
        </div>
      </div>

      <div class="row justify-content-center">
        <c:choose>
          <c:when test="${fn:length(nextList) != 0}">
          <c:forEach items="${nextList}" var="preProject">
            <!-- Single Blog Post Area -->
            <div class="col-12 col-md-6 col-lg-4 text-center">
              <div class="single-blog-post mb-50">
                <div class="product-img mb-0">
                  <a href="/shop/detail/pre/${preProject.id }"><img
                    src="/resources/img/project-image/${preProject.fileName}"
                    alt=""></a>
                </div>
                
               <div class="product-info mt-0 text-center" style="background-color:#C4C4C4; height:100px;padding-top: 20px;">
                <div style="margin:0 15% 0 15%">
                <a style="margin-top:5%" href="/shop/detail/pre/${preProject.id }">
                  <p class="preName">
                    ${preProject.name}
                  </p>                  
                </a>
                </div>
              </div>
              </div>
            </div>
          </c:forEach>
         <div class="col-12 text-center" style="margin-bottom: 50px">
          <a href="/shop/preShop" class="btn alazea-btn">View All</a>
        </div>
          </c:when>
          <c:otherwise>
            <div class="col-12 col-md-12 col-lg-12 text-center"  style="margin-bottom:20px">
              <div style="width:100%"><h1 >진행 예정 프로젝트가 존재하지 않습니다.</h1></div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </section>
  </div>
 </div> 
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
          pauseOnHover : true,
          arrows:false
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
                
              }, 800 * x);
            })(i);
          }
        }();

      });
      
    </script>
  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>

</html>