<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>login Page</title>
</head>
<body>
	<!--  
	<form:form commandName="loginFormData">
		<table border="1">
			<tr>
				<th>이메일</th>
				<td><form:input path="email"/>
					<form:checkbox path="rememberEmail"/>이메일 기억하기
				</td>
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
		<form:errors/> 글로벌 에러 코드 표시되는 부분 
	</form:form>
	-->
  <div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5">
      <div class="col-md-10 mx-auto col-lg-5">
        <form:form class="p-4 p-md-5 border rounded-3 bg-light" commandName="loginFormData">
          <div class="form-floating mb-3">
             <form:input path="email" class="form-control" id="floatingInput"/>
             <label for="floatingInput">user@example.com</label>
             <form:errors path="email"/>
          </div>
          <div class="form-floating mb-3">
             <form:password path="password" class="form-control" id="floatingPassword"/>
             <label for="floatingPassword">password</label>
             <form:errors path="password"/>
          </div>
          <div class="checkbox mb-3">
            <label>
              <form:checkbox path="rememberEmail"/> 이메일 기억하기
            </label>
          </div>
          <button class="w-100 btn btn btn-primary" type="submit">로그인</button><br>
            <div id="google_id_login" style="text-align: center">
    		<a href="${google_url}">
     			 구글 로그인
    		</a>
  </div>
          <input class="w-100 btn btn btn-secondary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/'" value="메인으로"/>
          <br>
          <form:errors/>
        </form:form>
      </div>
    </div>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>