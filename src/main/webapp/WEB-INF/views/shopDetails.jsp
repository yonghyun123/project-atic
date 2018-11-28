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
<link rel="stylesheet" href="/resources/css/style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/common.css">

<!-- table CSS -->
<link rel="stylesheet" href="/resources/css/shop_detail.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(/resources/img/bg-img/24.jpg);">
			<h2>SHOP DETAILS</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">Project</a></li>
							<li class="breadcrumb-item active" aria-current="page">Project
								Details</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Single Product Details Area Start ##### -->
	<section class="single_product_details_area mb-50">
		<div class="produts-details--content mb-50">
			<div class="container">
				<div class="row justify-content-between">

					<div class="col-12 col-md-6 col-lg-5">
						<div class="single_product_thumb">

							<!-- 썸네일 이미지 -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<a class="product-img"
										href="/resources/img/project-image/<c:out value='${project.fileName }'/>"
										title="Product Image"> <img class="d-block w-100"
										src="/resources/img/project-image/<c:out value='${project.fileName }'/>"
										alt="1">
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
							목표 자금
							<c:out value="${project.goal }" />
							<input type="hidden" value="<c:out value="${project.id }"/>"
								id="projectId">
							<h4 class="price">
								<c:out value="${project.curPrice }" />
								원 달성
							</h4>
							<div class="short_overview">
								<p>
									<c:out value="${project.title }" />
								</p>
								<p>
									이 프로젝트가 목표자금을 달성할 시
									<c:out value="${project.interest }" />
									%의 금리혜택을 받으실 수 있습니다.
								</p>
							</div>

							<div class="cart--area d-flex flex-wrap align-items-center">
								<!-- Add to Cart Form -->
								<form class="cart clearfix d-flex align-items-center"
									method="post">
									<input type="button" id="deposit" value="지금 투자하기"
										class="btn alazea-btn ml-15">
								</form>

							</div>

							<div class="products--meta">
								<img src="/resources/img/heart.gif"><span>이 페이지를 보고
									있는 사람들</span> <span id="currentCount"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#description"
								class="nav-link active" data-toggle="tab" role="tab">상세 설명</a></li>
							<li class="nav-item"><a href="#addi-info" class="nav-link"
								data-toggle="tab" role="tab">회사 정보</a></li>
							<li class="nav-item"><a href="#investor" class="nav-link"
								data-toggle="tab" role="tab">투자자 현황<span class="text-muted">
										(<c:out value="${countOfInvestor }" />)
								</span></a></li>
							<li class="nav-item"><a href="#reviews" class="nav-link"
								data-toggle="tab" role="tab">예비 평가</a></li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<p>
										<c:out value="${project.description }" />
									</p>
									<p>
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
										회사 전화번호 <br> <span> <c:out value="${project.tel }" />
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
											<th>투자자</th>
											<th>투자액</th>
											<th>투자 날짜</th>
										</tr>
										<c:choose>
											<c:when test="${not empty userProject }">
												<c:forEach var="project" items="${userProject}"
													varStatus="status">
													<tr>
														<td>${status.index+1 }</td>
														<td>${project.userId }</td>
														<td>${project.deposit }</td>
														<td>${project.createDate }</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</table>

								</div>
							</div>

							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<div class="reviews_area">
									<ul>
										<li>
											<div class="single_user_review mb-15">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Quality</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
											<div class="single_user_review mb-15">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Design</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
											<div class="single_user_review">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Value</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
										</li>
									</ul>
								</div>

								<div class="submit_a_review_area mt-50">
									<h4>Submit A Review</h4>
									<form action="#" method="post">
										<div class="row">
											<div class="col-12">
												<div class="form-group d-flex align-items-center">
													<span class="mr-15">Your Ratings:</span>
													<div class="stars">
														<input type="radio" name="star" class="star-1" id="star-1">
														<label class="star-1" for="star-1">1</label> <input
															type="radio" name="star" class="star-2" id="star-2">
														<label class="star-2" for="star-2">2</label> <input
															type="radio" name="star" class="star-3" id="star-3">
														<label class="star-3" for="star-3">3</label> <input
															type="radio" name="star" class="star-4" id="star-4">
														<label class="star-4" for="star-4">4</label> <input
															type="radio" name="star" class="star-5" id="star-5">
														<label class="star-5" for="star-5">5</label> <span></span>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="name">Nickname</label> <input type="email"
														class="form-control" id="name" placeholder="Nazrul">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="options">Reason for your rating</label> <select
														class="form-control" id="options">
														<option>Quality</option>
														<option>Value</option>
														<option>Design</option>
														<option>Price</option>
														<option>Others</option>
													</select>
												</div>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label for="comments">Comments</label>
													<textarea class="form-control" id="comments" rows="5"
														data-max-length="150"></textarea>
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn alazea-btn">Submit
													Your Review</button>
											</div>
										</div>
									</form>
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
						<h2>Related Products</h2>
					</div>
				</div>
			</div>

			<div class="row">

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img
								src="/resources/img/bg-img/40.png" alt=""></a>
							<!-- Product Tag -->
							<div class="product-tag">
								<a href="#">Hot</a>
							</div>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
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

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img
								src="/resources/img/bg-img/41.png" alt=""></a>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
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

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img
								src="/resources/img/bg-img/42.png" alt=""></a>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
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

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img
								src="/resources/img/bg-img/43.png" alt=""></a>
							<!-- Product Tag -->
							<div class="product-tag sale-tag">
								<a href="#">Hot</a>
							</div>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
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
	<!-- ##### Related Product Area End ##### -->

	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>


	<script type="text/javascript">
		let wsocket;
		$(window).on("beforeunload", function() {
			sayBye();
			setInterval(function() {
				wsocket.close();
			}, 500);
		});

		function sayBye() {
			var messageObject = {
				type : 2000
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
			var projectId = $("#projectId").val();
			var messageObject = {
				type : 1000,
				projectId : projectId
			}
			send(messageObject);
		}

		function onClose(event) {
			sayBye();
		}

		function onMessage(event) {
			var serverMessage = event.data;
			var mObject = JSON.parse(serverMessage);
			switch (mObject.type) {
			case 1000:
				var count = mObject.count;
				$("#currentCount").text(count + "명");
				break;
			case 2000:
				var count = mObject.count;
				$("#currentCount").text(count + "명");
				break;
			}

		}

		$("#deposit").click(function() {
			$("#deposit-modal").modal('show');

			var authNum = 0;
			$("#auth").on("click", function() {
				alert("눌럿졍");
				var email = $("#email").val();
				alert(email);
				$.ajax({
					url : "/email/auth",
					type : "post",
					async : false,
					data : {
						email : email
					},
					dataType : "text",
					success : function(data) {
						console.log(data);
						var jsonData = JSON.parse(data);

						authNum = jsonData.authNum;
					}
				})
			})

			$("#authB").on("click", function() {
				if ($("#authNum").val() == authNum) {
					alert("일치");
				} else {
					alert("불일치");
				}
			})
		});

		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the current tab

		function showTab(n) {
			// This function will display the specified tab of the form ...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			// ... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
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
				document.getElementById("regForm").submit();
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

		connect();
		onOpen();
	</script>
</body>

</html>