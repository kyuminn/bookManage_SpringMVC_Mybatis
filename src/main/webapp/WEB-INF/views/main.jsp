<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
<!-- jstl에서 null값 여부 확인은 empty로! -->
</head>
<body>
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
</body>
</html>