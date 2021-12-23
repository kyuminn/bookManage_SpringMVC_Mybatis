<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리</title>
</head>
<body>
	<h2>도서관리 리스트</h2>
	<form action="<c:url value='/books/search'/>">
		<label for="search">검색 키워드 입력:</label>
		<input type="text" id="search" name="keyword" placeholder="도서제목 또는 저자 입력">
		<input type="submit" value="찾기">
	</form>
	<br>
	<table border="1">
		<tr>
			<th>등록 번호</th>
			<th>도서 표지</th>
			<th>도서 ISBN</th>
			<th>도서 제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>가격</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.id }</td>
				<!-- Servers>servers.xml에 외부 경로와 마운트 설정하는 부분 추가하기 -->
				<td><img src="/img/${vo.bookImageName }" width="100" height="130">
				</td>
				<td>${vo.isbn }</td>
				<td><a href='<c:url value="/books/detail/${vo.id }"/>'>${vo.bookName }</a></td>
				<td>${vo.writer }</td>
				<td>${vo.publisher }</td>
				<td>${vo.price }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/add'" value="도서 정보 추가">
</body>
</html>