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
				<td><form:input path="email"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><form:input path="name"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><form:input path="password"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><form:input path="confirmPassword"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입하기">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>