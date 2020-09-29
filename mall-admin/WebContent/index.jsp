<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<meta charset="utf-8">
<title>Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
   <div>
      <jsp:include page="/inc/menu.jsp"></jsp:include>
   </div>
     <h1>관리자 메인 페이지</h1>
     <p><%=session.getAttribute("loginAdminId") %>님 반갑습니다.</p>
   <img src="/mall-admin/img/juicekim.jpg" width="500" height="600">
   <br>
   <span style="color:blue">자랑스런 내 친구 주성이</span>
</div>
</body>
</html>