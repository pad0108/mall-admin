<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8"); //글자 인코딩
int categoryId = Integer.parseInt(request.getParameter("no"));
int productId = Integer.parseInt(request.getParameter("productNo"));
String productName = request.getParameter("productName");
int productPrice = Integer.parseInt(request.getParameter("productPrice"));
String productSoldout = request.getParameter("productSoldout");
String productContent = request.getParameter("productContent");
Product product = new Product();
//id 받아오기
product.setProductId(productId);
product.setCategoryId(categoryId);
//name 변경
product.setProductName(productName);
//price 변경
product.setProductPrice(productPrice);
//soldout 변경
product.setProductSoldout(productSoldout);
//content 변경
product.setProductContent(productContent);
ProductDao productDao = new ProductDao();
productDao.updateProduct(product);
response.sendRedirect("/mall-admin/product/productList.jsp");

%>