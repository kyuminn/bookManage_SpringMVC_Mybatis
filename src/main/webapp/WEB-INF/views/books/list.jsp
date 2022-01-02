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
	
	.container{
		text-align:right;
	}
	
	.navbar-brand{
		font-size:30px;
		text-align:center;
	}

</style> 
</head>
<body>
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
	<nav class="navbar navbar-light bg-light">
  	<div class="container-fluid">
    <a class="navbar-brand">도서 리스트</a>
    <form class="d-flex" action="<c:url value='/books/search'/>">
      <input class="form-control me-2" type="text" name="keyword" placeholder="도서제목 또는 저자 입력" aria-label="Search">&nbsp;&nbsp;
      <button class="btn btn-outline-success" type="submit">검색하기</button>
    </form>
  </div>
</nav>
	<!--  
	<div class="container">
	<form action="<c:url value='/books/search'/>">
		<label for="search">키워드로 검색하기:</label>&nbsp;&nbsp;&nbsp;
		<input type="text" id="search" name="keyword" placeholder="도서제목 또는 저자 입력">&nbsp;&nbsp;&nbsp;
		<input type="submit" value="찾기" class="btn btn-primary">
	</form>
	</div>-->
	<br>
	<table class="table table-striped" border="1"> <!-- table table-striped w-auto -->
		<thead class="text-center">
		<tr>
			<th>등록 번호</th>
			<th>도서 표지</th>
			<th>도서 ISBN</th>
			<th>도서 제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>가격</th>
		</tr>
		</thead>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td align="center">${vo.id }</td>
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
	</c:if>
	<br>

	<!-- 부트 스트랩 적용 -->
	<c:if test="${!empty pageNum }">
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	<c:if test="${firstBlock==true }">
    <li class="page-item">
      <a class="page-link" href="${pageContext.request.contextPath}/books/list?pageNum=${page.backPage}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:forEach var="i" begin="${page.startPageNum}" end="${page.lastPageNum }">
    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/books/list?pageNum=${i}"><b>${i }</b></a></li>
    </c:forEach>
    
    <c:if test="${lastBlock==true }">
    <li class="page-item">
      <a class="page-link" href="${pageContext.request.contextPath}/books/list?pageNum=${page.forwardPage}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
</c:if>
</body>
</html>