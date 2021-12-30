<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- bootstrap 적용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>도서관리</title>
 <style type="text/css">
	table {
	width:700px;
	}

</style> 
</head>
<body>
	<h2>도서관리 리스트</h2>
	<c:if test="${empty list }">
		<h3>등록된 도서가 없습니다.</h3>
		<table class="addBook">
		<tr>
			<td align="right">
				<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/add'" value="도서 정보 추가" class="btn btn-primary">
			</td>
		</tr>
	</table>
	</c:if>
	
	
	<c:if test="${!empty list }">
	<form action="<c:url value='/books/search'/>">
		<label for="search">검색 키워드 입력:</label>
		<input type="text" id="search" name="keyword" placeholder="도서제목 또는 저자 입력">
		<input type="submit" value="찾기" class="btn btn-primary">
	</form>
	<br>
	<table class="table table-striped w-auto" border="1">
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
		<tr>
			<td colspan="7" align="center">
				<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/'" value="메인으로" class="btn btn-primary">
				<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/books/add'" value="도서 정보 추가" class="btn btn-primary">
			</td>
		</tr>
	</table>
	<br>
	<!--  null 값 여부 체크는 empty로 , 문자열 비교는 eq 사용 -->
	<c:if test="${!empty pageNum }">
	<c:if test="${firstBlock == true}">
		<a href="${pageContext.request.contextPath}/books/list?pageNum=${page.backPage}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPageNum}" end="${page.lastPageNum}" >
		<c:if test="${i eq pageNum }"> <!--  현재 페이지 굵게 표시, 링크 비활성화 -->
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne pageNum }">
		<a href="${pageContext.request.contextPath}/books/list?pageNum=${i}">[${i}]</a>&nbsp;&nbsp;
		</c:if>
	</c:forEach>
	<c:if test="${lastBlock == true }">
		<a href="${pageContext.request.contextPath}/books/list?pageNum=${page.forwardPage}">[다음]</a>
	</c:if>
	</c:if>
	</c:if>
	
	<!-- 부트 스트랩 적용 -->
	
</body>
</html>