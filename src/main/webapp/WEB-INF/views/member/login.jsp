<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Page</title>
</head>
<body>
	<form:form commandName="loginFormData">
		<table border="1">
			<tr>
				<th>이메일</th>
				<td><form:input path="email"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><form:password path="password"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/'" value="메인으로">
				</td>
			</tr>
		</table>
		<form:errors/> <!-- 글로벌 에러 코드 표시되는 부분 -->
	</form:form>
</body>
</html>