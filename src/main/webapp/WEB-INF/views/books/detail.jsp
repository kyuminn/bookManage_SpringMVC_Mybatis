<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리</title>
</head>
<body>
	<h2>도서 정보</h2>
	<table border="1">
		<tr>
			<td rowspan="5">
				<img src="/img/${vo.bookImageName }" width="220" height="300">
			</td>
			<th>BOOK ISBN</th>
			<td>${vo.isbn }</td>
		</tr>
		<tr>
			<th>도서명</th>
			<td>${vo.bookName }</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<th>출판사</th>
			<td>${vo.publisher }</td>
		</tr>
		<tr>
			<th>도서 가격</th>
			<td>${vo.price }</td>
		</tr>
		<tr>
			<th>책 소개</th>
			<td colspan="2">${vo.content }</td>
		</tr>
	</table>
	<br>
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="도서 정보 목록">
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/delete/${vo.id}'" value="도서 삭제하기">
</body>
</html>