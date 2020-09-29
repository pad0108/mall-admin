<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	int categoryId = Integer.parseInt(request.getParameter("no"));
	String categoryName = "";
	
%>
<div class="container">
<h1>수정하기</h1>
<form method="post" action="/mall-admin/category/updateCategoryAction.jsp">
<table class="table table-dark table-striped table-hover">
	<tr>
		<td>category_id</td><!--읽기전용 -->
		<td><input type="text" name="no" value="<%=categoryId%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>category_name</td>
		<td><input type="text" name="categoryName" value="<%=categoryName%>"></td>
	</tr>
</table>
	<button type="submit" class="btn btn-outline-dark">수정</button>
<div class="btn btn-outline-dark">
	<a href="/mall-admin/category/categoryList.jsp">돌아가기</a>
</div>
</form>
</div>
</body>
</html>