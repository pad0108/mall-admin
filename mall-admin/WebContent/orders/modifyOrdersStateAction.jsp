<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	int ordersId = Integer.parseInt(request.getParameter("no"));
	int productId = Integer.parseInt(request.getParameter("productNo"));
	String ordersState = request.getParameter("ordersState");
	
	Orders orders = new Orders();
		
	//번호 불러오기
	orders.setOrdersId(ordersId);
	orders.setProductId(productId);
	//변경된 내역
	orders.setOrdersState(ordersState);
	OrdersDao ordersDao = new OrdersDao();
	//변경된 내역 업데이트
	ordersDao.updateOrdersState(orders);
	//리스트로 이동
	response.sendRedirect("/mall-admin/orders/ordersList.jsp");
%>
