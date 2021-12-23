<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
</head>
<body>
	<h2>도서 관리 메인 페이지</h2>
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 목록">
</body>
</html>