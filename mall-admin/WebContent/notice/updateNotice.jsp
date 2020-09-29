<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	int noticeId = Integer.parseInt(request.getParameter("no"));
	String noticeTitle = request.getParameter("nt");
	String noticeDate = request.getParameter("nd");
	String noticeContent = "";
	
%>
<form method="post" action="updateNoticeAction.jsp">
	<table class="table table-bordered table-success table-striped ">
		<tr>
			<td style="width:20%;">번호:</td><!-- 읽기전용 -->
			<td style="width:80%;"><input  class="form-control-plaintext" type="text" name="no" value="<%=noticeId%>" readonly="readonly"></td>			
		</tr>
		<tr>
			<td>제목:</td>
			<td><input class="form-control"type="text" name="nt" value="<%=noticeTitle%>"></td>
		</tr>
		<tr>	
			<td>작성 시간:</td><!-- 읽기 전용 -->
			<td><input class="form-control-plaintext"type="text" name="nd" value="<%=noticeDate%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td style="padding-top:100px; padding-bottom:100px;">내용</td>
			<td ><textarea class="form-control" rows="10" cols="110" name="noticeContent"></textarea></td>
		</tr>
	</table>
	<div style="text-align:right;">
		<button type="submit" class="btn btn-primary">수정</button>
		<a href="/mall-admin/product/productList.jsp" class="btn btn-secondary">취소</a>
	</div>
</form>
</div>
</body>
</html>