<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>도서 관리</title>
</head>
<body>
	<!--  
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
	-->
	

<div class="container">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">도서 정보</h3>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="/img/${vo.bookImageName }" width="320" height="450"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
					<table width="600" height="450" border="1">
						<tr>
							<th>BOOK ISBN</th>
							<td>${vo.isbn }</td>
							<th>도서명</th>
							<td>${vo.bookName }</td>
						</tr>
						<tr>
							<th>저자</th>
							<td>${vo.writer }</td>
							<th>출판사</th>
							<td>${vo.publisher }</td>
						</tr>
						<tr>
							<th>도서 가격</th>
							<td colspan="3">${vo.price }원</td>
						</tr>
						<tr>
							<th>책 소개</th>
							<td colspan="3">${vo.content }</td>
						</tr>
					</table>
					<br>
						<input type="button" class="btn btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/books/list'" value="목록으로">
						<input type="button" class="btn btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/books/delete/${vo.id}'" value="도서 삭제">
						<input type="button" class="btn btn btn-info" value="수정하기">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>