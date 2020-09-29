<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	//출력 확인
	System.out.println(noticeId + " < ------");
	Notice n = new Notice();
	NoticeDao noticeDao = new NoticeDao();
	n = noticeDao.selectNoticeOne(noticeId);
	
%>

	<h1>공지사항</h1>
	<!-- 수정 삭제 버튼 -->
	<div style="text-align:right;">
	<a href="/mall-admin/notice/updateNotice.jsp?no=<%=n.getNoticeId()%>&nt=<%=n.getNoticeTitle()%>&nd=<%=n.getNoticeDate()%>"><button class="btn btn-primary btm-lg ">수정</button></a>
	<a href="/mall-admin/notice/deleteNotice.jsp?no=<%=n.getNoticeId() %>"><button class="btn btn-secondary btm-lg ">삭제</button></a>
	</div>
	<table class="table table-bordered table-success table-striped ">
		<tr>
			<td style="width:20%;">번호:</td>
			<td style="width:80%;"><%=n.getNoticeId()%></td>			
		</tr>
		<tr>
			<td>제목:</td>
			<td><%=n.getNoticeTitle() %></td>
		</tr>
		<tr>	
			<td>작성 시간:</td>
			<td><%=n.getNoticeDate() %></td>
		</tr>
		<tr>
			<td style="padding-top:100px; padding-bottom:100px;">내용</td>
			<td ><%=n.getNoticeContent() %></td>
		</tr>
	</table>
	<!-- 전체 목록으로 돌아가기 -->
	<div class="btn btn-outline-dark text-light">
	<a href="/mall-admin/notice/noticeList.jsp">전체목록 보기</a>
	</div>
</div>
</body>
</html>