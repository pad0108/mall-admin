<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8"); //글자 인코딩
int categoryId = Integer.parseInt(request.getParameter("no"));
String categoryName = request.getParameter("categoryName");
Category category = new Category();
//id 받아오기
category.setCategoryId(categoryId);
//name 변경
category.setCategoryName(categoryName);
CategoryDao categoryDao = new CategoryDao();
categoryDao.updateCategory(category);
response.sendRedirect("/mall-admin/category/categoryList.jsp");

%>