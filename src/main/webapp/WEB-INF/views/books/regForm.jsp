<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<c:url value='/resources/script/fileUploadScript.js'/>">
	</script>
<meta charset="UTF-8">
<title>도서 관리</title>
</head>
<body>
	<h2>도서 추가</h2>
	<form:form enctype="multipart/form-data" commandName="vo">
		<table border="1">
			<tr>
				<td rowspan="6">
					<div id='View_area' style='position:relative; width: 100%; height:100%; color: black; border: 0px solid black; dispaly: inline; '>
					</div>
				</td>
				<th>ISBN</th>
				<td><form:input path="isbn"/>
					<form:errors path="isbn"/>
				</td>
			</tr>
			<tr>
				<th>도서명</th>
				<td><form:input path="bookName"/>
					<form:errors path="bookName"/>
				</td>
			</tr>
			<tr>
				<th>저자</th>
				<td><form:input path="writer"/>
					<form:errors path="writer"/>
				</td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><form:input path="publisher"/>
					<form:errors path="publisher"/>
				</td>
			</tr>
			<tr>
				<th>도서가격</th>
				<td><form:input path="price"/>
					<form:errors path="price"/>
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="uploadFile" id="uploadFile" onchange="previewImage(this,'View_area')">
					<form:errors path="bookImageName"/>
				</td>
			</tr>
			<tr>
				<th width="200">책 소개</th>
				<td colspan="2"><textarea rows="14" cols="50" name="content"></textarea>
				<form:errors path="content"/>
				</td>
			</tr>
		</table>
		<input type="submit" value="도서정보 추가">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 목록">
	</form:form>
</body>
</html>