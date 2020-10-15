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
<!-- 스크립 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log("ready"); //디버깅 코드
		$("#btn").click(function(){
			if($("#noticeTitle").val().length<1){
				alert("제목을 입력해 주세요.");
				return;
			}else if($("#noticeContent").val().length<1){
				alert("내용을 입력해 주세요.");
				return;
				}
			$("#addForm").submit();
		});
	});
</script>
</head>
<body>
<div class = "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>공지사항 추가</h1>
	<form method="post" action ="/mall-admin/notice/addNoticeAction.jsp" id="addForm">
	<table class="table table-dark table-striped">
		<tr>
			<td>제목:</td>
			<td><input type="text" class="form-control" name="noticeTitle" id="noticeTitle"></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><textarea rows="10" cols="110" name="noticeContent" id="noticeContent"></textarea></td>
		</tr>
	</table>
	<div style="text-align:right;">
		<button type="button" id="btn" class="btn btn-primary btm-lg ">입력</button>
		<a href="/mall-admin/notice/noticeList.jsp" class="btn btn-secondary btm-lg">취소</a>
	</div>
</form>
</div>
</body>
</html>