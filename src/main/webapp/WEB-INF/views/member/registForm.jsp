<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<form:form commandName="formData">
		<table border="1">
			<tr>
				<th>이메일</th>
				<td><form:input path="email"/>
					<form:errors path="email"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><form:input path="name"/>
					<form:errors path="name"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><form:password path="password"/>
					<form:errors path="password"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><form:password path="confirmPassword"/>
					<form:errors path="confirmPassword"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/'" value="메인으로">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>