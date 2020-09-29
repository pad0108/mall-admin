<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	//글자 인코딩
	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("no"));
	String noticeTitle = request.getParameter("nt");
	String noticeDate = request.getParameter("nd");
	String noticeContent = request.getParameter("noticeContent");
	
	Notice notice = new Notice();
	//id 받아오기
	notice.setNoticeId(noticeId);
	//title 받아오기
	notice.setNoticeTitle(noticeTitle);
	//date 받아오기
	notice.setNoticeDate(noticeDate);
	//content 받아오기
	notice.setNoticeContent(noticeContent);
	
	System.out.println(noticeId+"<---------");
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(notice);
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");

%>