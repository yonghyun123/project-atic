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
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>

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
            <h2>로그인</h2>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Service Area Start ##### -->
    <section class="our-services-area bg-gray">
        <div class="container">
          <div class="col-md-6 security-login">
            <form role="form" class="text-left" method="post" action="/login">
              <div class="form-group">
                <label><span class="glyphicon glyphicon-user"></span> 공인인증서 ID</label>
                <input type="text" class="form-control" name="username" id="security-id" placeholder="Enter ID" required>
              </div>
              <div class="form-group">
                <label><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                <input type="password" class="form-control" name="password" id="security-password" placeholder="Enter Password" required>
              </div>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <input type="submit" class="btn btn-success btn-block" value="Login"><span class="glyphicon glyphicon-off"></span>
            </form>
            <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          </div>
        </div>
    </section>
    <!-- ##### Service Area End ##### -->
  
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

</html>