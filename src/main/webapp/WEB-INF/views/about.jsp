<%@ page language="java" contentType="text/html; charset=UTF-8"	
    pageEncoding="UTF-8"%>	
<html>	
<head>	
    <meta charset="UTF-8">	
    <meta name="description" content="">	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->	
     <!-- Title -->	
    <title>A-TIC</title>	
     <!-- Favicon -->	
    <link rel="icon" href="/resources/img/hanalogo.png">	
     <!-- Core Stylesheet -->	
    <link rel="stylesheet" href="/resources/css/style.css">	
    <!-- Custom CSS -->	
    <link rel="stylesheet" href="/resources/css/common.css">	
 </head>	
 <body>	
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>	
    
    <!-- ##### Breadcrumb Area Start ##### -->
    <div style="height: 90px; border-bottom: 1px solid #ebebe0"></div>
    <div style="background-color: #f2f4f5;">
      <div style="padding-top: 50px;">
        <h2 class="text-center">이용가이드</h2>
      </div>
      <!-- ##### Breadcrumb Area End ##### -->
      <!-- ##### Service Area Start ##### -->	
      
      <div class="col-md-10" style="margin: 40px auto 0 auto; padding: 0 20px 60px 20px;">  
        <section class="our-services-area bg-gray">	
            <div class="guide-category text-center">
              <div class="guide-detail" id="deposit-area" onclick="scrollMove('deposit-area')">
                적금 관련 질문
              </div>
              <div class="guide-detail" id="account-area" onclick="scrollMove('account-area')">
                계정 관련 질문
              </div>
            </div>
            <div class="col-md-10">
              <div class="container guide-box">
                <div class="guide-inform">
                  <p><strong style="margin-right: 5px;">적금</strong>관련 질문</p>
                </div>	
                <div class="qna-guide" id="1">
                  <p class="qna-num">01</p><p class="qna-dot" style="margin-right: 5px !important;">.</p>
                  <p id="question1">적금은 어떻게 하는건가요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer1">
                  아래와 같이 10초만에 적금하실 수 있습니다.<br><br>
                  로그인 -> 원하는 상품을 골라 '지금 투자하기' -> 투자진행<br>
                  적금 전 아래사항을 꼭 확인해주세요.<br><br>
                  
                  <strong>&#60;적금 전 준비사항&#62;</strong><br>
                  공인인증서 로그인<br>
                  닉네임 설정 및 가상계좌 발급<br>
                  본인 확인을 위한 이메일 인증<br>
                  금액 입력 후, 적금하기<br>
                </div>
                <div class="qna-guide" id="2">
                  <p class="qna-num">02</p><p class="qna-dot">.</p>
                  <p id="question2">적금 이율은 어떻게 되나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer2">
                  최초 적금 이율은 3%입니다.<br>
                  매달 모금액 100%를 달성하는 기업에 적금을 넣었을 경우, 최저 0.02% ~ 최대 0.04%의 이율을 추가적으로 얻으실 수<br> 있습니다.<br>
                </div>
                <div class="qna-guide" id="3">
                  <p class="qna-num">03</p><p class="qna-dot">.</p>
                  <p id="question3">적금 형태는 어떻게 되나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer3">
                  적금 형태는 자유 적금이며, 월 최대 100만원까지 적금이 가능합니다.<br>
                </div>
                <div class="qna-guide" id="4">
                  <p class="qna-num">04</p><p class="qna-dot">.</p>
                  <p id="question4">적금 중도 해지 시 어떻게 되나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer4">
                  적금 만기 전, 해지를 하게되면 최저이율 3%의 이율이 적용됩니다. <br>
                </div>
                <div class="qna-guide" id="5">
                  <p class="qna-num">05</p><p class="qna-dot">.</p>
                  <p id="question5">상품별 모금률은 어디서 확인할 수 있나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer5">
                  공정하고 신중한 적금을 위해 상품에 투자한 후, 마이페이지에서 확인하실 수 있습니다.<br>
                  또한 종료된 프로젝트는 마감 페이지에서 바로 확인하실 수 있습니다.
              </div>
            </div>
        </section>	
        <section class="our-services-area bg-gray account-section" style="margin-top: 30px;"> 
            <div class="col-md-10">
              <div class="container guide-box">
                <div class="guide-inform">
                  <p><strong style="margin-right: 5px;">계정</strong>관련 질문</p>
                </div>  
                <div class="qna-guide" id="8">
                  <p class="qna-num">01</p><p class="qna-dot" style="margin-right: 5px !important;">.</p>
                  <p id="question8">회원가입은 어떻게 하는건가요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer8">
                  <Strong>A-TIC</Strong>은 공인인증서로 로그인하기 때문에 회원가입이 따로 필요 없습니다.<br><br>
                  하지만 댓글 작성, 예비평가등의 기능을 이용하기 위해 닉네임을 설정합니다.<br>
                </div>
                <div class="qna-guide" id="9">
                  <p class="qna-num">02</p><p class="qna-dot">.</p>
                  <p id="question9">1인당 여러 계정을 사용할 수 있나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer9">
                  공인인증서를 이용해 로그인하기 때문에 1인 1계정만 사용 가능합니다.<br>
                </div>
                <div class="qna-guide" id="10">
                  <p class="qna-num">03</p><p class="qna-dot">.</p>
                  <p id="question10">프로필 사진은 변경할 수 있나요?</p>
                </div>
                <div class="dropdown-content dropdown-guide" id="answer10">
                  로그인 후, 마이페이지에서 변경 가능합니다.<br>
                </div>
              </div>
            </div>
        </section>  
      </div>	
    </div>
    <!-- ##### Team Area End ##### -->	
  	
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
    	
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
    <script>
		$("#guide").addClass("active");
    	var qnaList = document.querySelectorAll('.qna-guide');
    	
    	for (var i = 0; i < qnaList.length; i++) {
			qnaList[i].addEventListener('click', function(event){
				dropDown(this.id);
			})
		}
    	
    	function dropDown(id) {
    		document.getElementById("answer" + id).classList.toggle("show");
    		if(document.getElementById("answer" + id).classList.contains("show") == true) {
    			document.getElementById("question" + id).style.color = '#6300CC';
    			scrollMove(id);
    		} else {
    			document.getElementById("question" + id).style.color = '#707070';
    		}
        }
    	
    	
    	function scrollMove(id) {
    		if(id == 'deposit-area') {
    			var offset = $('#deposit-area').offset();
    			$("html, body").animate({scrollTop:offset.top},500);	
    		} else if(id == 'account-area'){
    			var offset = $('.account-section').offset();
    			$("html, body").animate({scrollTop:offset.top},500);
    		} else {
    			var offset = $('#' + id).offset();
    			$("html, body").animate({scrollTop:offset.top},500);
    		}
    	}
    </script>	
</body>	
</html> 