<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
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
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<%
	//페이징
	int currentPage = 1; //현재 페이지
	int endPage = 0; // 마지막 페이지
	//페이지 값
	if(request.getParameter("currentPage") !=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>categoryList</h1>
	<div class=" btn btn-outline-dark text-light">
		<a href="/mall-admin/category/addCategory.jsp">상품카테고리 추가</a>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList(currentPage);
		
		//Dao클래스에서 최대 페이지 값 불러오기
		endPage = categoryDao.getCategoryEndPage();
	%>
	<table class="table table-dark table-striped table-hover ">
		<thead>
			<tr>
				<th>category_id</th>
				<th>category_name</th>
				<th>편집기능</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
			<tr>
				<td><%=c.getCategoryId() %></td>
				<td><%=c.getCategoryName() %></td>
				<td><a href="updateCategoryForm.jsp?no=<%=c.getCategoryId()%>">수정</a></td>
				<td><a href="deleteCategoryAction.jsp?no=<%=c.getCategoryId()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<!-- 페이징 -->
	<table  class="pagination justify-content-center" >
	<tr>
	<%
	//현재 페이지가 1보다 클 때
	if(currentPage>1){
	%>
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=1" class="btn btn-outline-primary btn-sm">처음</a></td>
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-primary btn-sm">이전</a></td>
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
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-primary btn-sm">다음</a></td>
		<td><a href="/mall-admin/category/categoryList.jsp?currentPage=<%=endPage %>" class="btn btn-outline-primary btn-sm">맨끝</a></td>
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