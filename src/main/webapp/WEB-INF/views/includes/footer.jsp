<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/countTime.js"></script>    
<script>
  $(document).ready(function(){
	// 로그인 이베트
    $("#login").on("click", function(e) {
      $("#login-modal").modal('show');
    });
    
    // 로그아웃 이벤트
    $("#logout").on("click", function(e) {
  	  $("#logout-modal").modal('show');
    });
    
    // Nav바 타이머 출력을 위한 스크립트
    $(function(){
      $('#countTime').countTime({
      	time: year.toString() + '-' + month.toString()+'-01 00:00:00'//기준시간
  	  });
    });
    
    // 토스트 출력을 위한 스크립트 
    if(sessionStorage.getItem('flag') != null) {
      popup(sessionStorage.getItem('flag'));
      sessionStorage.clear();
    } 
  });	
</script>
    
<!-- ##### Footer Area Start ##### -->
<footer class="footer-area bg-img" style="background-image: url(/resources/img/bg-img/3.jpg);">
    <div id="popup-message-login-success">로그인 성공!</div>
    <div id="popup-message-logout-success">로그아웃 성공!</div>
    <div id="popup-message-create-deposit-success">계좌생성 성공!</div>
    <!-- Main Footer Area -->
    <div class="main-footer-area">
        <div class="container">
            <div class="row">
                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget">
                        <div class="footer-logo mb-30">
                            <a href="#"><img src="/resources/img/core-img/logo.png" alt=""></a>
                        </div>
                        <p>A-Tic는 스타트업 투자 활성화를 위한 <br/>적금 플랫폼입니다.</p>
                    </div>
                </div>

                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget">
                        <div class="widget-title">
                            <h5>QUICK LINK</h5>
                        </div>
                        <nav class="widget-nav">
                            <ul>
                                <li><a href="/about">A-Tic?</a></li>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="/shop">투자 홈</a></li>
                                <li><a href="#">이용 가이드</a></li>
                                <li><a href="#">오픈 예정</a></li>
                                <li><a href="#"> </a></li>
                                <li><a href="#">오픈한 상품</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget">
                        <div class="widget-title">
                            <h5>BEST SELLER</h5>
                        </div>

                        <!-- Single Best Seller Products -->
                        <div class="single-best-seller-product d-flex align-items-center">
                            <div class="product-thumbnail">
                                <a href="/shop-details"><img src="/resources/img/bg-img/4.jpg" alt=""></a>
                            </div>
                            <div class="product-info">
                                <a href="/shop-details">Cactus Flower</a>
                                <p>$10.99</p>
                            </div>
                        </div>

                        <!-- Single Best Seller Products -->
                        <div class="single-best-seller-product d-flex align-items-center">
                            <div class="product-thumbnail">
                                <a href="/shop-details"><img src="/resources/img/bg-img/5.jpg" alt=""></a>
                            </div>
                            <div class="product-info">
                                <a href="/shop-details">Tulip Flower</a>
                                <p>$11.99</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget">
                        <div class="widget-title">
                            <h5>CONTACT</h5>
                        </div>

                        <div class="contact-information">
                            <p><span>Address:</span> 성남시 분당구 정자동 80-17</p>
                            <p><span>Phone:</span> 02-123-1234</p>
                            <p><span>Email:</span> lcw9206@gmail.com</p>
                            <p><span>Open hours:</span> Mon - Sun: 8 AM to 9 PM</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Bottom Area -->
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="border-line"></div>
                </div>
                <!-- Copywrite Text -->
                <div class="col-12 col-md-6">
                    <div class="copywrite-text">
                        <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <nav>
                            <ul>
                                <li><a href="/">Home</a></li>
                                <li><a href="/about">A-Tic?</a></li>
                                <li><a href="#">이용 가이드</a></li>
                                <li><a href="/shop">투자 홈</a></li>
                                <li><a href="#">공지사항</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ##### Footer Area End ##### -->