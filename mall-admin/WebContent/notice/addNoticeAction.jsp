<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<!DOCTYPE html>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	String noticeTitle =request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	//리스트로 이동
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
	
%>