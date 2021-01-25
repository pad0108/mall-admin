<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	//로그인이 안되어 있으면 로그인 페이지로 이동
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Index</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		<h1>관리자 메인 페이지</h1>
		<img src="<%=request.getContextPath()%>/img/center.png"> <br>
		<div>
			<table class="table striped">
				<thead>
					<tr>
						<th>프로젝트 소개</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<ul>
								<li>제작자: 최형철</li>
								
								<li>제작기간: 2020.09.16~2020.09.23</li>
								<li>목표: 쇼핑몰 페이지 및 쇼핑몰 관리 페이지 제작방법 습득</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<ul>
								<li>ServerInfo</li>
								<ul>
									<li>Operating System: Microsoft Windows 10 x64 Pro 1903 [18362.1016]</li>
									<li>WebServer: Apache Tomcat 8.5.57</li>
									<li>DataBase: MariaDB 10.5.5</li>
									<li>Java: 1.8.0_261</li>
								</ul>
							</ul>
							
							<ul>
								<li>DevelopedEnvironment</li>
								<ul>
									<li>IDE: Eclipse IDE for Enterprise Java Developers [2020-06 (4.16.0)]</li>
									<li>Language: English, Korean(UTF-8), HTML, JSP, Javascript</li>
								</ul>
							</ul>
						</td>
					</tr>
				</tbody>
		</div>
	</div>
</body>
</html>