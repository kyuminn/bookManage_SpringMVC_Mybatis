<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Main page</title>
<!-- jstl에서 null값 여부 확인은 empty로! -->
</head>
<body>
	<!--  
	<h2>도서 관리 메인 페이지</h2>
	<c:if test="${empty loginSession }">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/member/login'" value="로그인">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/member/regist'" value="회원가입">
	</c:if>
	
	<c:if test="${!empty loginSession }">
	${loginSession.name }님으로 로그인 됨
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 목록">
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/member/logout'" value="로그아웃">
	</c:if>
	-->
	
	<div class="px-4 py-5 my-5 text-center">
    <img class="d-block mx-auto mb-4" src="https://cdn-icons-png.flaticon.com/128/864/864685.png" alt="" width="100" height="80">
    <h1 class="display-6 fw-bold">도서 관리 메인 </h1>
    <br>
    <div class="col-lg-6 mx-auto">
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
      	<c:if test="${empty loginSession }">
        <button type="button" class="btn btn-primary btn-lg px-4 gap-3" onclick="window.location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
        <button type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="window.location.href='${pageContext.request.contextPath}/member/regist'">회원가입</button>
        </c:if>
         <c:if test="${!empty loginSession }">
        <button type="button" class="btn btn-primary btn-lg px-4 gap-3" onclick="window.location.href='${pageContext.request.contextPath}/books/list'">도서 목록</button>
        <button type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="window.location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
        </c:if>
      </div>
    </div>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>