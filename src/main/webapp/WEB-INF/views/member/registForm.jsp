<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<form:form commandName="formData">
	<div class="container">
	<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal" method="post" action="#">

                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">이메일</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="email" id="email" placeholder="user@example.com" />
                                                <form:errors path="email"></form:errors>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="name" class="cols-sm-2 control-label">이름</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요" />
                                                <form:errors path="name"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" />
                                                <form:errors path="password"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword" class="cols-sm-2 control-label">비밀번호 확인</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인" />
                                            	<form:errors path="confirmPassword"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="회원가입">
                                    </div>
                                    <div class="login-register">
                                        <a href="${pageContext.request.contextPath}/">메인으로</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>
</form:form>


	<!--  
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
	-->
	
</body>
</html>