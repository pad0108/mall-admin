<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	//출력 확인
	System.out.println(productId + " < ------");
	Product p = new ProductDao().selectProductOne(productId);
	
%>
	<h1>상품 상세보기</h1>
	<table class="table table-dark table-striped ">
		<tr>
			<td width="20%">제품 사진</td>
			<td width="80%"><img src="/mall-admin/img/<%=p.getProductPic()%>"><br>
			<a href= "/mall-admin/product/modifyProductPic.jsp?productId=<%=p.getProductId()%>" class="btn btn-primary">이미지 수정</a></td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=p.getProductId() %></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=p.getCategoryId() %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=p.getProductName() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=p.getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=p.getProductContent() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td class="btn btn-outline-light text-dark">
				 <%
            if(p.getProductSoldout().equals("Y")) {
         %>
            <a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=p.getProductId()%>&productContent=<%=p.getProductContent()%>&productSoldout=<%=p.getProductSoldout()%>">[품절]</a>
         <%
            } else {
         %>
            <a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=p.getProductId()%>&productSoldout=<%=p.getProductSoldout()%>">[판매중]</a>
         <%
            }
         %>
				
			</td>
		</tr>
		<tr>
			<td class="btn btn-outline-light text-dark"><a href="updateProductForm.jsp?no=<%=p.getCategoryId()%>&productNo=<%=p.getProductId()%>&productContent=<%=p.getProductContent()%>&productSoldout=<%=p.getProductSoldout()%>">[수정]</a></td>
			<td class="btn btn-outline-light text-dark"><a href="deleteProductAction.jsp?no=<%=p.getProductId()%>">[삭제]</a></td>
		</tr>
	</table>
	<!-- 전체 목록으로 돌아가기 -->
		<div class="btn btn-outline-dark text-light">
		<a href="/mall-admin/product/productList.jsp">전체목록 보기</a>
</div>
</div>
</body>
</html>