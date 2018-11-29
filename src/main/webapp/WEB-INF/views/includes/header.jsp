<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>


<!-- Modal Area Start -->
<%@ include file="/WEB-INF/views/modal/login.jsp"%>
<%@ include file="/WEB-INF/views/modal/logout.jsp"%>
<%@ include file="/WEB-INF/views/modal/deposit.jsp"%>
<%@ include file="/WEB-INF/views/modal/deposit-menual.jsp"%>
<%@ include file="/WEB-INF/views/modal/nickname.jsp"%>
<!-- Modal Area End -->

<!-- Preloader -->
<div class="preloader d-flex align-items-center justify-content-center">
  <div class="preloader-circle"></div>
  <div class="preloader-img">
    <img src="/resources/img/core-img/leaf.png" alt="">
  </div>
</div>

<!-- ##### Header Area Start ##### -->
<header class="header-area">
  <!-- ***** Navbar Area ***** -->
  <div class="alazea-main-menu">
    <div class="classy-nav-container breakpoint-off">
      <div class="container">
        <!-- Menu -->
        <nav class="classy-navbar justify-content-between"
          id="alazeaNav">

          <!-- Nav Brand -->
          <a href="/" class="nav-brand"><img
            src="/resources/img/core-img/logo.png" alt=""></a>

          <!-- Navbar Toggler -->
          <div class="classy-navbar-toggler">
            <span class="navbarToggler"><span></span><span></span><span></span></span>
          </div>

          <!-- Menu -->
          <div class="classy-menu">

            <!-- Close Button -->
            <div class="classycloseIcon">
              <div class="cross-wrap">
                <span class="top"></span><span class="bottom"></span>
                
              </div>
            </div>

            <!-- Navbar Start -->
            <div class="classynav">
              <ul>
                <li><span id="countTime"></span></li>
                <li><a href="#">스타트업 지원 신청</a>
                <li><a href="#">펀딩</a>
                  <ul class="dropdown">
                    <li><a href="/shop">펀딩 홈</a></li>
                    <li><a href="/preshop">오픈예정 사업</a></li>
                  </ul>
                </li>
                <li><a href="#">이용 가이드</a></li>
                <c:choose>
                  <c:when test="${not empty loginId }">
                    <li><a id="my-page">마이 페이지</a></li>
                    <li><a id="logout">로그아웃</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a id="login">로그인</a></li>  
                  </c:otherwise>
                </c:choose>
              </ul>

              <!-- Search Icon -->
              <div id="searchIcon">
                <i class="fa fa-search" aria-hidden="true"></i>
              </div>

            </div>
            <!-- Navbar End -->
          </div>
        </nav>

        <!-- Search Form -->
        <div class="search-form">
          <form action="#" method="get">
            <input type="search" name="search" id="search"
              placeholder="상품을 검색해보세요!">
            <button type="submit" class="d-none"></button>
          </form>
          <!-- Close Icon -->
          <div class="closeIcon">
            <i class="fa fa-times" aria-hidden="true"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- ##### Header Area End ##### -->