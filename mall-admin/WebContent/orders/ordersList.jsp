<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="vo.*" %>
<%@page import="java.util.*" %>
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
<title>ordersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<%
		request.setCharacterEncoding("utf-8");
		String ordersState="";
		if(request.getParameter("ordersState") !=null){
			ordersState = request.getParameter("ordersState");
		}
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		if(ordersState.equals("")){
			list = ordersDao.selectOrdersList();
		}else{
			list = ordersDao.selectOrdersListByState(ordersState);
		}
		//부분리스트
		ArrayList<OrdersAndProduct> olist = ordersDao.selectOrdersStateList();

	%>
	<h1>주문 목록</h1>
	<form method="post" action ="/mall-admin/orders/ordersList.jsp">
	<select name="ordersState">
		<option value="">전체</option>
	<%
				for(OrdersAndProduct oap : olist){				
	%>
		<option value="<%=oap.getOrders().getOrdersState()%>"
		<%
			if(oap.getOrders().getOrdersState().equals(ordersState)){
		%>
		selected="selected"
				<%
			}
		%>
		>
	<%=oap.getOrders().getOrdersState()%></option>
		<%
		}
		%>
	</select>
		<button type="submit" class="btn btn-outline-dark btn-sm">조회</button>
	 
	<table class = "table">
		<thead>
			<tr>
				<td>주문 번호</td>
				<td>제품 번호</td>
				<td>제품 이름</td>
				<td>주문 개수</td>
				<td>주문 금액</td>
				<td>회원 메일</td>
				<td>주문 주소</td>
				<td>주문 상태</td>
				<td>주문 날짜</td>
				<td>내역 수정</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list){
			%>
				<tr>
					<td><%=oap.getOrders().getOrdersId() %></td>
					<td><%=oap.getOrders().getProductId() %></td>
					<td><%=oap.getProduct().getProductName() %></td>
					<td><%=oap.getOrders().getOrdersAmount() %></td>
					<td><%=oap.getOrders().getOrdersPrice() %></td>
					<td><%=oap.getOrders().getMembersEmail() %></td>
					<td><%=oap.getOrders().getOrdersAddr() %></td>
					<td><%=oap.getOrders().getOrdersState() %></td>
					<td><%=oap.getOrders().getOrdersDate() %></td>
					<td><a href="/mall-admin/orders/modifyOrdersState.jsp?no=<%=oap.getOrders().getOrdersId()%>&productNo=<%=oap.getOrders().getProductId()%>&ordersState=<%=oap.getOrders().getOrdersState()%>">내역 수정</a></td>
					
				</tr>
			<%
				}
			%>
		</tbody>		
	</table>
	</form>
</div>
</body>
</html>