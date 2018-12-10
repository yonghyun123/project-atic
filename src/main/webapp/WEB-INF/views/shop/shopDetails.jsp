<%@page import="com.keb.atic.user.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
pageContext.setAttribute("LF", "\n");
%> 
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
<link rel="stylesheet"
  href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<style type="text/css">
.card {
  flex-direction: row;
}

</style>
</head>

<body>
  <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

  <!-- ##### Breadcrumb Area Start ##### -->
  <div style="height: 90px; border-bottom: 1px solid #ebebe0"></div>

  <div class="breadcrumb-area">
    <nav id="investNav" style="height: 6%">
      <ul>
        <li id="investMain"><a href="/shop/" class="navText">펀딩
            홈</a></li>
        <li class="monthProject"><a href="/shop/currentShop"
          class="navText active">진행중</a></li>
        <li class="monthProject"><a href="/shop/preShop"
          class="navText">오픈예정</a></li>
          <li class="monthProject"><a href="/shop/finishShop" class="navText">마감</a></li>
      </ul>
    </nav>
    <!-- Top Breadcrumb Area -->
    <div
      class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
      style="background-image: url(/resources/img/project-image/<c:out value='${project.fileName }'/>);">
      <h2>PROJECT DETAILS</h2>
    </div>
    
 
    <div class="col-md-10" style="margin: 0 auto;">
      <div class="col-md-10">
        <div>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/"><i
                  class="fa fa-home"></i> Home</a></li>
              <li class="breadcrumb-item"><a href="/shop/currentShop">Project</a></li>
              <li class="breadcrumb-item active" aria-current="page">Project
                Details</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <!-- ##### Breadcrumb Area End ##### -->

  <div class="col-md-10" style="margin: 0 auto;">
  <!-- ##### Single Product Details Area Start ##### -->
  <section class="single_product_details_area mb-50">
    <div class="produts-details--content">
      <div class="container">
        <div class="row justify-content-between">

          <div class="col-12 col-md-6 col-lg-5">
            <div class="single_product_thumb">

              <!-- 썸네일 이미지 -->
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <a class="product-img"
                    href="/resources/img/project-image/<c:out value='${project.fileName }'/>"
                    title="Product Image"> <img
                    class="d-block w-100"
                    src="/resources/img/project-image/<c:out value='${project.fileName }'/>"
                    alt="1" style="height: 305px;">
                  </a>
                </div>
              </div>

            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="single_product_desc">
              <h4 class="title">
                <c:out value='${project.name }' />
              </h4>
              목표 금액
              <fmt:formatNumber value="${project.goal }" pattern="#,###"/>
              <input type="hidden"
                value="<c:out value="${project.id }"/>" id="projectId">
              <input type="hidden" value="${loginId }" id="loginId">
              <h4 class="price">
                <span id="curprice2">
                달성 금액은 적금을 납입하신 후에 볼 수 있습니다.
<!--                   <fmt:formatNumber value="${project.curPrice }" pattern="#,###"/> -->
                </span>
                <input type="hidden" id="curPrice" value="${project.curPrice }">
              </h4>
              <div class="short_overview">
                <p>
                  <c:out value="${project.title }" />
                </p>
                
                <p>
                  이 프로젝트가 목표자금을 달성할 시
                  <c:out value="${project.interest*100 }" />
                  %의 금리혜택을 받으실 수 있습니다.
                </p>
              </div>

              <div class="cart--area d-flex flex-wrap align-items-center">
                <c:choose>
                  <c:when test="${empty loginId }">
                    <input type="button" id="shop-login" value="지금 적금하기" class="btn alazea-btn" style="width: 20%;">
                  </c:when>
                  <c:otherwise>
                    <form class="cart clearfix d-flex align-items-center"
                    method="post">
                      <button type="button" id="deposit" class="btn alazea-btn">지금 적금하기</button>
                    </form>
                  </c:otherwise>
                </c:choose>
               	<c:set var="rate" value="${ succRate}"></c:set>
                <c:choose>
                	<c:when test="${rate eq '-1'}">
                	 <span></span>
                	</c:when>
               	   <c:otherwise>
               	   
               	   <span id="succ-rate" class="btn"> 업종별 폐업률: <fmt:formatNumber value="${succRate}" pattern=".0000"/></span>
               	   </c:otherwise>
                </c:choose>
               
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row shop-detail-inform-area">
        <div id="graph" class="tab-pane">
          <div class="container ml-15">
            <div class="row">
              <div class="col-md-12">
                <div class="card" style="">
                  <div class="card-body"
                    style="width: 40%; display: inline;">
                    <div id="average"
                      style="margin-top: 5%; margin-left: 20%;">
                      <p style="margin-left: 15">평균 평점</p>

                      <div style="margin-left: 10%" id="averPoint">
                        <h1>4.5</h1>
                      </div>
                    </div>
                  </div>
                  <div class="card-body"
                    style="width: 55%; display: inline;">
                    <canvas id="bar-chart-paral" width="100"
                      height="50"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="shop-products--meta">
          <p class="mt-50">
            <img src="/resources/img/heart.gif"><span>이
              페이지를 보고 있는 사람들</span> <span id="currentCount"></span>
          </p>
        </div>
  
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="product_details_tab clearfix">
            <!-- Tabs -->
            <ul class="nav nav-tabs" role="tablist"
              id="product-details-tab">
              <li class="nav-item"><a href="#description"
                class="nav-link active" data-toggle="tab" role="tab">상세
                  설명</a></li>
              <li class="nav-item"><a href="#addi-info"
                class="nav-link" data-toggle="tab" role="tab">회사 정보</a></li>
              <li class="nav-item" style="display: none;" id="investorList"><a href="#investor"
                class="nav-link" data-toggle="tab" role="tab">적금고객 현황<span
                  class="text-muted"> (<c:out
                      value="${countOfInvestor }" />)
                </span></a></li>
              <li class="nav-item"><a href="#evaluation"
                class="nav-link" data-toggle="tab" role="tab">예비 평가</a></li>
              <li class="nav-item"><a href="#reviews"
                class="nav-link" data-toggle="tab" role="tab">문의</a></li>
            </ul>
            <!-- Tab Content -->
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane fade show active"
                id="description">
                <div class="description_area">
                  <p id="description">
                    <c:out value="${fn:replace(project.description,LF,'<br>')}" escapeXml="false" />
                  </p>
                  <p class="text-center">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_1.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_2.png">
                    <img
                      src="/resources/img/project-image/<c:out value="${project.id }"/>_et_3.png">

                  </p>

                </div>
              </div>
              <div role="tabpanel" class="tab-pane fade" id="addi-info">
                <div class="additional_info_area">
                  <p>
                    회사 이름<br> <span> <c:out
                        value="${project.company }" />
                    </span>
                  </p>
                  <p>
                    회사 전화번호 <br> <span> <c:out
                        value="${project.tel }" />
                    </span>
                  </p>
                  <p>
                    회사 업종 <br> <span> <c:out
                        value="${project.category }" />
                    </span>
                  </p>

                </div>
              </div>

              <div role="tabpanel" class="tab-pane fade" id="investor">
                <div class="investor_area">
                  <table id="customers">
                    <tr>
                      <th>No</th>
                      <th>적금고객</th>
                      <th>적금액</th>
                      <th>적금 날짜</th>
                    </tr>
                    <c:choose>
                      <c:when test="${not empty userProject }">
                        <c:forEach var="project" items="${userProject}"
                          varStatus="status">
                          <tr>
                            <td>${status.index+1 }</td>
                            <td>****</td>
                            <td>${project.deposit }</td>
                            <td>${project.createDate }</td>
                          </tr>
                        </c:forEach>
                      </c:when>
                    </c:choose>
                  </table>

                </div>
              </div>

              <div role="tabpanel" class="tab-pane fade" id="evaluation">
                <div class="reviews_area">
                  <div id="calCount">
                    <div id="count"></div>
                  </div>
                  <ul id="userEvalList">

                  </ul>
                </div>
              </div>
              <div role="tabpanel" class="tab-pane fade" id="reviews">
                <div class="submit_a_review_area mt-50">
                  <div class="row">
                    <div class="col-12 col-md-6">
                      <div class="form-group">
                        <label for="options">카테고리</label> <select
                          class="form-control" id="options">
                          <option>상품성</option>
                          <option>가치</option>
                          <option>기타 문의</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="comments">Comments</label>
                        <textarea class="form-control" id="comments"
                          rows="5" data-max-length="150"></textarea>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn alazea-btn"
                        style="margin-bottom: 50px;"
                        id="review-send-btn">문의 작성</button>
                    </div>
                  </div>

                </div>

                <!-- table이 들어가야해 -->
                <div class="list-group" id="reply-body">
                  <a class="list-group-item">
                    <h6 class="list-group-item-heading"
                      style="float: left; margin-right: 50px;">
                      <img alt="profile" src="">
                    </h6>
                    <p style="float: left; margin-right: 50px;">{userId}</p>
                    <p>{createDate}</p>
                    <h4>{content}</h4>
                  </a>
                </div>

              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ##### Single Product Details Area End ##### -->

  <!-- ##### Related Product Area Start ##### -->
  <div class="related-products-area">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <h2>이 프로젝트에 적금을 납입하신 분들은 이런 프로젝트에도 참여하셨어요!</h2>
          </div>
        </div>
      </div>

      <div class="row">

        <!-- Single Product Area -->

        <c:choose>
          <c:when test="${not empty recommend }">
            <c:forEach var="projects" items="${recommend}"
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
        </c:choose>
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
  <!-- char.js -->
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>

  <script type="my-template" id="review-list">
	<a class="list-group-item">
		<h6 class="list-group-item-heading" style="float: left; margin-right: 50px; "> <img class="card-img-top profile-img" style="width:50px; height:50px" src="/user/profile/{userId}" alt="Card image cap"></h6>
		<p  style="float: left; margin-right: 50px;">아이디:{userId}</p>
		<p>{createDate}</p>
		<h4>{content}</h4>
	</a>
	</script>

  <script type="my-template" id="userEval-list">
   <li>
     <div class="single_user_review mb-15">
      <div class="review-rating">
        <i class="fa fa-star" aria-hidden="true"></i>
         <span style="font-size: 20px;">{totalAvg}</span>
		  <span style="font-size: 16px;">
              by <strong style="font-size: 20px;">{userId}</strong>
          </span>
          </div>
            <div id="userId">
              <div id="showAll"><p style="margin-bottom: 0">상세점수 보기 <i class="fa fa-sort-desc"></i></p></div>
               <div id="totalEval{userID}" style="display:none">
          <div> 
          	<span><strong>호감도</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Favor} 
     	    <span><strong>성장성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Growth} 
          	<span><strong>수익성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Market}
          	<span><strong>안정성</strong></span>
			<i class="fa fa-star" aria-hidden="true" style="color: #ff9800;"></i>
            {Stable}
          </div>
        </div>
        </div>
        </div>
   </li>
  </script>


  <script type="text/javascript">
  $("#funding").addClass("active");
  
  
			let wsocket;
			var projectId = $("#projectId").val();
			var loginId = $("#loginId").val();
			$(window).on("beforeunload", function() {
				sayBye();
				setInterval(function() {
					wsocket.close();
				}, 500);
			});

			function sayBye() {
				var messageObject = {
					type : 2000,
					projectId : projectId
				}
				send(messageObject);

			}

			function send(object) {
				if (object) {
					wsocket.send(JSON.stringify(object));
				}
			}

			function connect() {
				wsocket = new WebSocket("ws://localhost/hanaSocket");
				wsocket.onopen = onOpen;
				wsocket.onmessage = onMessage;
				wsocket.onclose = onClose;
			}

			function onOpen(event) {
				var price = $("#curPrice").val();

				var messageObject = {
					type : 1000,
					projectId : projectId,
					loginId : loginId,
					curPrice : price
					

				}
				send(messageObject);
			}

			function onClose(event) {
				sayBye();
			}
			
			/* 기업 분류별 성공률 clickEvent */
			function succRateEvent(){
				$('#succ-rate').click(function(){
				   	$("#desc-succ-rate").modal('show');
				})
			};
			
			succRateEvent();

			/* 댓글 ajax */
			/*
			 javascript AJAX Service(read, put, post...)
			 created by yonghyun
			 */
			var userReplyService = (function() {
				function get(projectId, callback, error) {
					$.get("/shop/reply/" + projectId, function(result) {
						if (callback) {
							callback(result);
						}

					}).fail(function(xhr, status, err) {
						if (error) {
							error();
						}
					});
				}
				;

				function checkAccPasswd(userId, data, callback, error) {
					$.ajax({
						type : 'post',
						url : "/shop/check/" + userId,
						data : JSON.stringify(data),
						contentType : "application/json; charset=utf-8",
						success : function(result, status, xhr) {
							if (callback) {
								callback(result);
							}
						},
						error : function(xhr, status, er) {
							if (error) {
								error(er);
							}
						}
					})
				}

				function postSearchList(projectId, data, callback, error) {
					$.ajax({
						type : 'post',
						url : "/shop/reply/" + projectId,
						data : JSON.stringify(data),
						contentType : "application/json; charset=utf-8",
						success : function(result, status, xhr) {
							if (callback) {
								callback(result);
							}
						},
						error : function(xhr, status, er) {
							if (error) {
								error(er);
							}
						}
					})
				}
				;

				return {
					postSearchList : postSearchList,
					get : get,
					checkAccPasswd : checkAccPasswd
				};
			})();

			// 리뷰 등록 버튼 이벤트
			function sendReviewDdta() {
				if (loginId == null || loginId.length == 0) {
					$('#review-send-btn').css('display', 'none');
				} else {
					$('#review-send-btn').css('display', 'block');
				}

				$('#review-send-btn').click(
						function() {

							var comment = $('#comments').val()
							var replyData = {
								userId : loginId,
								projectId : projectId,
								content : comment
							};

							console.log(replyData);
							userReplyService.postSearchList(projectId,
									replyData, function(list) {
										makeReplyTemplate(list.replyList);
									})
						})
			}

			/*페이지 로딩시 ajax로 데이터 가져오기 */
			function getReplyData() {
				userReplyService.get(projectId, function(list) {
					makeReplyTemplate(list.replyList);
				})

			}

			/*댓글 리스트 템플릿 */
			function makeReplyTemplate(list) {
				var originHtml = document.querySelector('#review-list').innerHTML;
				var newHtml = '';

				list.forEach(function(v) {
					newHtml += originHtml.replace('{userId}', v.userId)
										 .replace('{userId}', v.userId)
										 .replace('{createDate}', v.regDate)
										 .replace('{content}', v.content)
				})
				document.querySelector('#reply-body').innerHTML = newHtml;

			}

			function onMessage(event) {
				var serverMessage = event.data;
				var mObject = JSON.parse(serverMessage);
				switch (mObject.type) {
				case 1000:
					var count = mObject.count;
					$("#currentCount").text(count + "명");
					var flag = mObject.message;
					if (flag == "false") {
						$("#curprice2").text(mObject.curPrice+'원 달성');
						$("#deposit").text("이미 참여하신 프로젝트입니다");
						document.getElementById("deposit").disabled = true;
						$("#investorList").css("display", "block");
					}
					break;
				case 2000:
					var count = mObject.count;
					$("#currentCount").text(count + "명");
					break;
				case 3000:
					var price = mObject.message;
					$("#curprice").val(price);
					$("#curprice2").text(mObject.curPrice+"원 달성");
					$("#deposit").text("이미 참여하신 프로젝트입니다");
					document.getElementById("deposit").disabled = true;
					$("#investorList").css("display", "block");
					break;
				 case 4000:
	                    alert('이달의 적금액이 100만원을 초과하였습니다.');
	                    location.reload();
	                    break;
				}
			}

			$('#nextBtn').click(
					function() {
						var passwd = $("#depositPasswd").val();
						var accObj = {
							passwd : passwd
						};
						console.log(loginId);
						console.log(passwd);
						/*계좌 비밀번호 확인 로직 */
						userReplyService.checkAccPasswd(loginId, accObj,
								function(list) {
									if (list.result === 'false') {
										alert('비밀번호가 일치하지 않습니다');
									} else {
										nextPrev(1);
									}

									console.log(list.result);

								})
					});

			$('#prevBtn').click(function() {
				nextPrev(-1);
			})

			$("#deposit").click(function() {
				$.ajax({
    				type: 'get',
    				url: '/users/' + '${loginId}',
    				success: function(result, status, xhr) {
    					if(result.vt_acc_num) {
    						$("#depositMoney").val('');
    						$("#depositPasswd").val('');
    						document.getElementsByClassName("tab")[1].style.display = '';
    						currentTab = 0;
    						nextPrev(0);
    						$('#deposit-modal').modal('show');
    					} else {
    						$('#deposit-menual-modal').modal('show');
    					}
    				}
    			})
				var authNum = 0;
				$("#auth").on("click", function() {
					var email = $("#email").val();
					alert("인증번호가 발송되었습니다.");
					$.ajax({
						url : "/email/auth",
						type : "post",
						async : false,
						data : {
							email : email
						},
						dataType : "text",
						success : function(data) {
							//console.log(data);
							var jsonData = JSON.parse(data);
							authNum = jsonData.authNum;
						}
					})
				})

				$("#authB").on("click", function() {
					if ($("#authNum").val() == authNum) {
						document.getElementById("nextBtn").disabled = false;
						$("#nextBtn").on("click", function() {
							invest();
							nextPrev(1);
						})
						alert("인증번호가 일치합니다.");
					} else {
						alert("인증번호가 일치하지 않습니다.");
					}
				})

			});

			function invest() {
				var depositM = $("#depositMoney").val();
				var curPrice = $("#curPrice").val();
				var messageObject = {
					type : 3000,
					projectId : projectId,
					deposit : depositM,
					loginId : loginId,
					curPrice : parseInt(curPrice)
				}
				sessionStorage.flag = "popup-message-deposit-success";
				popup(sessionStorage.getItem('flag'));
			    sessionStorage.clear();
				send(messageObject);
			}

			var currentTab = 0; // Current tab is set to be the first tab (0)
			showTab(currentTab); // Display the current tab

			function showTab(n) {
				// This function will display the specified tab of the form ...
				var x = document.getElementsByClassName("tab");
				x[n].style.display = "block";
				// ... and fix the Previous/Next buttons:
				if (n == 0) {
					document.getElementById("nextBtn").disabled = false;
				} 
				if (n == (x.length - 1)) {
					document.getElementById("nextBtn").innerHTML = "Submit";
					document.getElementById("nextBtn").disabled = true;

				} else {
					document.getElementById("nextBtn").innerHTML = "Next";
				}
				// ... and run a function that displays the correct step indicator:
				fixStepIndicator(n)
			}

			function nextPrev(n) {
				// This function will figure out which tab to display
				var x = document.getElementsByClassName("tab");
				// Exit the function if any field in the current tab is invalid:
				if (n == 1 && !validateForm())
					return false;
				// Hide the current tab:
				x[currentTab].style.display = "none";
				// Increase or decrease the current tab by 1:
				currentTab = currentTab + n;
				// if you have reached the end of the form... :
				if (currentTab >= x.length) {
					//...the form gets submitted:
					$("#deposit-modal").modal('hide');
					return false;
				}
				// Otherwise, display the correct tab:
				showTab(currentTab);
			}

			function validateForm() {
				// This function deals with validation of the form fields
				var x, y, i, valid = true;
				x = document.getElementsByClassName("tab");
				y = x[currentTab].getElementsByTagName("input");
				// A loop that checks every input field in the current tab:
				for (i = 0; i < y.length; i++) {
					// If a field is empty...
					if (y[i].value == "") {
						// add an "invalid" class to the field:
						y[i].className += " invalid";
						// and set the current valid status to false:
						valid = false;
					}
				}
				if($("#depositMoney").val() < 10000){
                    $("#depositMoney").val('');
                    $("#depositMoney").focus();
                    $("#depositMoney").attr("placeholder","10,000원 이상의 금액을 입력해 주세요.");
                    valid = false;
                }
				// If the valid status is true, mark the step as finished and valid:
				if (valid) {
					document.getElementsByClassName("step")[currentTab].className += " finish";
				}
				return valid; // return the valid status
			}

			function fixStepIndicator(n) {
				// This function removes the "active" class of all steps...
				var i, x = document.getElementsByClassName("step");
				for (i = 0; i < x.length; i++) {
					x[i].className = x[i].className.replace(" active", "");
				}
				//... and adds the "active" class to the current step:
				x[n].className += " active";
			}

			getReplyData();
			sendReviewDdta();
			connect();
			onOpen();
		</script>

        <script type="text/javascript">
			var evalPageService = (function() {
				function get(projectId, callback, error) {
					$.get("/shop/preEval/graph/" + projectId, function(result) {
						if (callback) {
							callback(result);
						}

					}).fail(function(xhr, status, err) {
						if (error) {
							error();
						}
					});
				}
				;

				function getUserEvalList(projectId, callback, error) {
					$.get("/shop/preEval/eval/" + projectId, function(result) {
						if (callback) {
							callback(result);
						}

					}).fail(function(xhr, status, err) {
						if (error) {
							error();
						}
					});
				}
				;

				return {
					get : get,
					getUserEvalList : getUserEvalList
				};
			})();

			//페이지 오픈시 graph 데이터를 받기위해 ajax 전송    
			evalPageService
					.get(
							projectId,
							function(Object) {
								var test = (Object != null);
								var userEvalByProject = [];
								console.log("Object = " + test);
								if (Object != null) {
									userEvalByProject
											.push(Math
													.round(Object.Market * 100) / 100.0);
									userEvalByProject
											.push(Math
													.round(Object.Stable * 100) / 100.0);
									userEvalByProject
											.push(Math
													.round(Object.Growth * 100) / 100.0);
									userEvalByProject.push(Math
											.round(Object.Favor * 100) / 100.0);
								} else {
									userEvalByProject = [ 0, 0, 0, 0 ];
								}
								$('#averPoint')
										.html(
												'<div style="display:inline-block; margin-bottom: 5px"><i class="fa fa-star fa-2x" style="color: #ff9800"></i></div><div style="display:inline-block; margin-left: 10px;"><h3>'
														+ Math
																.round(Object.Total * 100)
														/ 100.0 + '</h3></div>');
								profitGraph(userEvalByProject);

							});

			//페이지 오픈시 사용자평점리스트를 받아기위한 ajax 전송
			evalPageService.getUserEvalList(projectId, function(list) {
				$('#count').html(
						'<span>총 <h5 style="display: inline;">' + list.userEvalList.length
								+ '개</h5>의 매력도 평가가 있습니다.</span>');

				userEvalListTemplate(list.userEvalList);

				list.userEvalList.forEach(function(v) {
					if (v.user_id == loginId) {
						$('#pushAlert').val("신청하신 프로젝트입니다.");
						$('#pushAlert').attr('disabled', true)
						$('#pushAlert').attr('class', 'alazea-btn-disable')

					}
				})
			});

			//페이지 오픈시 사용자 평가 리스트 반영
			function userEvalListTemplate(userEvalList) {
				var originHtml = document.querySelector('#userEval-list').innerHTML;
				var newHtml = '';
				userEvalList.forEach(function(v) {
					newHtml += originHtml.replace('{userId}', v.user_id)
							.replace('{userID}', v.user_id).replace(
									'{totalAvg}',
									Math.round(v.total_avg * 100) / 100.0)
							.replace('{Favor}',
									Math.round(v.favor_grade * 100) / 100.0)
							.replace('{Growth}',
									Math.round(v.growth_grade * 100) / 100.0)
							.replace('{Market}',
									Math.round(v.market_grade * 100) / 100.0)
							.replace('{Stable}',
									Math.round(v.stable_grade * 100) / 100.0)
				});
				document.querySelector('#userEvalList').innerHTML = newHtml;
			}

			function profitGraph(userEvalByProject) {
				/* 수평 바 chart 이윤 증가율 */
				new Chart(document.getElementById("bar-chart-paral"), {
					type : 'bar',
					data : {
						labels : [ "수익성", "안정성", "성장성", "호감도" ],
						datasets : [ {
							label : "점",
							backgroundColor : [ "#3e95cd", "#8e5ea2",
									"#3cba9f", "#e8c3b9", "#c45850" ],
							data : userEvalByProject
						} ]
					},
					options : {
						legend : {
							display : false
						},
						scales : {
							yAxes : [ {
								ticks : {
									min : 0
								}
							} ]
						},
						title : {
							display : true,
							text : '[매력도 평가(점)]'

						}
					}
				});
			}
		</script>
        <script type="text/javascript">
        $(document).ready(function() {
    		$(document).on("click", "#showAll", function() {
    			if ($(this).next().css("display") == "none") {
    				$(this).next().show();
    			} else {
    				$(this).next().hide();
    			}
    		});
    	});
        </script>
    </body>
</html>