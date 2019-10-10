<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Navigation/ 메뉴 헤더 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <h1 class="logo">
      <a class="navbar-brand" href="/">
        Minchul GroupWare
      </a>
     </h1>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/">메인화면
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/empList/1">사원관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/ediList/1">전자결재</a>
          </li>
          
          <!-- 로그인 하지 않은 사람이 보게될 메뉴 -->
          <c:if test="${empty emp}">
	          <li class="nav-item">
	          	<div class="dropdown">
	            	<a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown">With Us</a>
	            	<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item withUsLink" href="/login">Sign-In</a>
					    <a class="dropdown-item withUsLink" href="/empWrite">Sign-Up</a>
	  				</div>
	            </div>
	          </li>
          </c:if>
          
          <!-- 로그인 한 사람이 보게될 메뉴 -->
          <c:if test="${not empty emp}">
	          <li class="nav-item">
	          	<div class="dropdown">
	            	<a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown">${emp.empName}님이 로그인중</a>
	            	<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item withUsLink" href="/">Home</a>
					    <a class="dropdown-item withUsLink" href="/logout" onclick="return confirm('정말로 로그아웃하시겠습니까?')">Sign-Out</a>
	  				</div>
	            </div>
	          </li>
          </c:if>
          
        </ul>
      </div>
    </div>
  </nav>
  
  
  
  
  