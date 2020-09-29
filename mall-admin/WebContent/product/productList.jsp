<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	//로그인이 안되어 있으면 로그인 페이지로 이동
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<%
		//인코딩
		request.setCharacterEncoding("utf-8");
		
		//페이징
		int currentPage = 1; //현재 페이지
		int endPage = 0; // 마지막 페이지
		//페이지 값
		if(request.getParameter("currentPage") !=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	
	
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1){	//전체 페이지 페이징 분기점
			productList = productDao.selectProductList(currentPage);
			endPage = productDao.getProductEndPage();
		}else{	//부분 페이지 페이징 분기점
			productList = productDao.selectProductListByCategoryId(categoryId,currentPage);
			endPage = productDao.getProductEndPage(categoryId);
		}
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
		
		//출력값 확인
		System.out.println(endPage + "<----------------------");
	%>
	<h1>상품 목록</h1>
	<!-- 전체 목록 다시 보기 -->
	<div class="btn btn-outline-dark text-light">
		<a href="/mall-admin/product/productList.jsp">전체목록 보기</a>
	</div>
	<!-- 상품 쿠가 -->
	<div class="btn btn-outline-dark text-light">
	<a href="/mall-admin/product/addProduct.jsp">상품추가</a>
	</div>
	<div>
	<nav class="navbar navbar-expand-xl bg-secondary navbar-light">
		<ul class="navbar-nav">
		<%
		for(Category c : categoryList) {

		%>
			<li class="nav-item">
				<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">
					<button type="button" class="btn btn-info btn-sm"><%=c.getCategoryName()%></button>&nbsp;&nbsp;&nbsp;
				</a>
			</li>	
		<%	
			}
		%>
		</ul>
		</nav>
	</div>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
				<th>편집기능</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList) {
					if(p.getProductSoldout().equals("Y")) {
			%>
						<tr>
							<td>
								<del>
									<a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>">
									<%=p.getProductId()%></a>
								</del>
							</td>
							<td><del><%=p.getCategoryId()%></del></td>
							<td><del><%=p.getProductName()%></del></td>
							<td><del><%=p.getProductPrice()%></del></td>
							<td>품절</td>
							<td><a href="updateProductForm.jsp?no=<%=p.getCategoryId()%>&productNo=<%=p.getProductId()%>&productSoldout=<%=p.getProductPrice()%>">수정</a></td>
							<td><a href="deleteProductAction.jsp?no=<%=p.getCategoryId()%>&productNo=<%=p.getProductId()%>&productSoldout=<%=p.getProductPrice()%>">삭제</a></td>
						</tr>	
			<%			
					} else {
						
			%>
						<tr>
							<td>
								<a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>">
									<%=p.getProductId()%></a>
							</td>
							<td><%=p.getCategoryId()%></td>
							<td><%=p.getProductName()%></td>
							<td><%=p.getProductPrice()%></td>
							<td>판매중</td>
							<td><a href="updateProductForm.jsp?no=<%=p.getCategoryId()%>&productNo=<%=p.getProductId()%>&productSoldout=<%=p.getProductPrice()%>">수정</a></td>
							<td><a href="deleteProductAction.jsp?no=<%=p.getCategoryId()%>&productNo=<%=p.getProductId()%>&productSoldout=<%=p.getProductPrice()%>">삭제</a></td>
						</tr>	
			<%
					}
				}
			%>
		</tbody>
	</table>
	<!-- 페이징 -->

				<table class="pagination justify-content-center">
				<tr>
				<%
				//현재 페이지가 1보다 클 때
				if(currentPage>1){
				%>
					<td><a href="/mall-admin/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=1"class="btn btn-outline-primary btn-sm">처음</a></td>
					<td><a href="/mall-admin/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=currentPage-1%>"class="btn btn-outline-primary btn-sm">이전</a></td>
				<%
					//현재 페이지가 1페이지일 때
					}else{
				%>  
					<!-- 테이블 크기 조정 -->
					<td style="width:30px"></td>
					<td style="width:30px"></td>
				<%
					} //현재 페이지
				%>
					<th style="width:30px"><%=currentPage %></th>
				<%
					//현재페이지가 마지막 페이지보다 작을 때
					if(currentPage < endPage){
						 
				%>
					<td><a href="/mall-admin/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=currentPage+1%>"class="btn btn-outline-primary btn-sm" >다음</a></td>
					<td><a href="/mall-admin/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=endPage %>"class="btn btn-outline-primary btn-sm">맨끝</a></td>
				<%
					//현재 페이지가 마지막일 때
					}else{
				%>
					<!-- 테이블 크기 조정 -->
					<td style="width:30px"></td>
					<td style="width:30px"></td>
				<%
					}
				%>
				</tr>
				</table>
		</div>
</body>
</html>