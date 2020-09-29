<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8"); //글자 인코딩
int productId = Integer.parseInt(request.getParameter("no"));
Product product = new Product();
product.setProductId(productId);
ProductDao productDao = new ProductDao();
productDao.deleteProduct(product);
response.sendRedirect("/mall-admin/product/productList.jsp");

%>