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
	System.out.println(categoryId+"<-----------");
	int productId = Integer.parseInt(request.getParameter("productNo"));
	System.out.println(productId+"<-----------");
	String productName = "";
	int productPrice = 0;
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	
%>
<div class="container">
<h1>수정하기</h1>
<form method="post" action="/mall-admin/product/updateProductAction.jsp">
<table class="table table-dark table-striped table-hover">
	<tr>
		<td>제품 번호:</td><!--읽기전용 -->
		<td><input type="text" name="productNo" value="<%=productId%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>카테고리 번호:</td><!--읽기전용 -->
		<td><input type="text" name="no" value="<%=categoryId%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td>제품 이름:</td>
		<td><input type="text" name="productName" value="<%=productName%>"></td>
	</tr>
	<tr>
		<td>제품 가격:</td>
		<td><input type="text" name="productPrice" value="<%=productPrice%>"></td>
	</tr>
	<tr>
		<td>판매 여부:</td>
		<td>
			<select class="form-control" name="productSoldout">
				<%
					if (productSoldout.equals("N")) {
				%><option value="N" selected="selected">판매중</option><%
					} else {
									%><option value="N">판매중</option><%
					}
				%>
				<%
					if (productSoldout.equals("Y")) {
				%><option value="Y" selected="selected">품절</option><%
					} else {
				%><option value="Y">품절</option><%
					}
				%>
				</select>
		</td>
	</tr>
	<tr>
		<td>제품 설명:</td>
		<td><textarea class="form-control" rows="5"  name="productContent">
			<%=productContent%>
			</textarea>
		</td>
	</tr>
</table>
	<button type="submit" class="btn btn-outline-dark">수정</button>
	<div class="btn btn-outline-dark">
	<a href="/mall-admin/product/productList.jsp">돌아가기</a>
	</div>
</form>
</div>
</body>
</html>