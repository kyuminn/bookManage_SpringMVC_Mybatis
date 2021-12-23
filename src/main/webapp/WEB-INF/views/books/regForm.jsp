<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script> function setThumbnail(event) {
		 var reader = new FileReader();
		 reader.onload = function(event) { 
			var img = document.createElement("img");
			 img.setAttribute("src", event.target.result);
			 document.querySelector("div#image_container").appendChild(img); };
			 reader.readAsDataURL(event.target.files[0]); }
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
					<div id="image_container"></div>
				</td>
				<th>ISBN</th>
				<td><form:input path="isbn"/></td>
			</tr>
			<tr>
				<th>도서명</th>
				<td><form:input path="bookName"/></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><form:input path="writer"/></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><form:input path="publisher"/></td>
			</tr>
			<tr>
				<th>도서가격</th>
				<td><form:input path="price"/></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="uploadFile" id="uploadFile" onchange="setThumbnail(event);" ></td>
			</tr>
			<tr>
				<th width="200">책 소개</th>
				<td colspan="2"><textarea rows="14" cols="50" name="content">
				</textarea></td>
			</tr>
		</table>
		<input type="submit" value="도서정보 추가">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 목록">
	</form:form>
</body>
</html>