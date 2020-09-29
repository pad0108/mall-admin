<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8"); //글자 인코딩
int noticeId = Integer.parseInt(request.getParameter("no"));
Notice notice = new Notice();
notice.setNoticeId(noticeId);
NoticeDao noticeDao = new NoticeDao();
noticeDao.deleteNotice(notice);
response.sendRedirect("/mall-admin/notice/noticeList.jsp");

%>