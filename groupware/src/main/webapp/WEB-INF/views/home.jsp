<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="./include/static-head.jsp" />
</head>

<body>

  <jsp:include page="./include/header.jsp" />

  <!--background image-->
  <div class="container-fluid bg-main">
    <img src="http://img.chuing.net/i/QuyNVV/Preview.x.jpg" alt="">
  </div>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5">A Bootstrap 4 Starter Template</h1>
        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <ul class="list-unstyled">
          <li>Spring 5.1.5.RELEASE</li>
          <li>Oracle 11g</li>
          <li>Bootstrap 4.3.1</li>
          <li>jQuery 3.4.1</li>
        </ul>
      </div>
    </div>
  </div>

  <jsp:include page="./include/footer.jsp" />

  <jsp:include page="./include/plugin-js.jsp" />

</body>

</html>