<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<!-- 스타일태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>공지사항 추가</h1>
	<form method="post" action ="/mall-admin/notice/addNoticeAction.jsp">
	<table class="table table-dark table-striped">
		<tr>
			<td>제목:</td>
			<td><input type="text" class="form-control" name="noticeTitle"></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><textarea rows="10" cols="110" name="noticeContent"></textarea></td>
		</tr>
	</table>
	<div style="text-align:right;">
		<button type="submit" class="btn btn-primary btm-lg ">입력</button>
		<a href="/mall-admin/notice/noticeList.jsp" class="btn btn-secondary btm-lg">취소</a>
	</div>
</form>
</div>
</body>
</html>