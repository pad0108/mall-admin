<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberState = request.getParameter("memberState");
	
	MemberDao memberDao = new MemberDao();
	memberDao.updateMemberState(memberEmail, memberState);
	
	response.sendRedirect("/mall-admin/member/memberList.jsp");
%>
