<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
	int ordersId = Integer.parseInt(request.getParameter("no"));
	int productId = Integer.parseInt(request.getParameter("productNo"));
	String ordersState = request.getParameter("ordersState");
	
	OrdersDao ordersDao = new OrdersDao();
	//리스트 출력
	ArrayList<OrdersAndProduct> olist = ordersDao.selectOrdersStateList(); 
	
%>
<div class="container">
<div>
	<!-- 상단바  -->
	<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
<h1>수정하기</h1>
<form method="post" action="/mall-admin/orders/modifyOrdersStateAction.jsp">
<table class="table table-Primary table-striped table-hover">
	<tr>
		<td>주문 번호 :</td><!--읽기 전용 -->
		<td><input type="text" name="no" value="<%=ordersId%>" readonly="readonly" class="form-control-plaintext"></td>
	</tr>
	<tr>
		<td>제품 번호 :</td><!--읽기 전용 -->
		<td><input type="text" name="productNo" value="<%=productId%>" readonly="readonly" class="form-control-plaintext"></td>
	</tr>
	<tr>
		<td>주문 현황 :</td>
		<td>
			<select class="form-control" name="ordersState">
				<%
					if (ordersState.equals("결재완료")) {
				%><option value="결재완료" selected="selected">결재완료</option><%
					} else {
				%><option value="결재완료">결재완료</option><%
					}
				%>
				<%
					if (ordersState.equals("배송준비중")) {
				%><option value="배송준비중" selected="selected">배송준비중</option><%
					} else {
									%><option value="배송준비중">배송준비중</option><%
					}
				%>
				<%
					if (ordersState.equals("배송완료")) {
				%><option value="배송완료" selected="selected">배송완료</option><%
					} else {
				%><option value="배송완료">배송완료</option><%
					}
				%>
				<%
				if (ordersState.equals("주문취소")) {
				%><option value="주문취소" selected="selected">주문취소</option><%
				} else {
				%><option value="주문취소">주문취소</option><%
				}
				%>
			</select>
		</td>
	</tr>
</table>
	<div style="text-align:right;">
		<button type="submit" class="btn btn-primary">수정</button>
		<a href="/mall-admin/orders/ordersList.jsp" class="btn btn-secondary">취소</a>
	</div>	
</form>
</div>
</body>
</html>