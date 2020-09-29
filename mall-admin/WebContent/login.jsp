<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	if(session.getAttribute("loginAdminId") != null){
		System.out.println("이미 로그인 되어 있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<h1>관리자 로그인</h1>
	<form method="post" action="/mall-admin/LoginAction.jsp">
		<div class="form-group">
			<label for="id">ID:</label>
			<input type="text" class="form-control" name="adminId">
		</div>
		<div class="form-group">
			<label for="pw">Password:</label>
			<input type="password" class="form-control" name="adminPw">
		</div>
	<button type="submit" class="btn btn-outline-primary">로그인</button>
	
	</form>
	</div>
</body>
</html>