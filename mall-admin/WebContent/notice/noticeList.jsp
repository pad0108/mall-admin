<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
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
<meta charset="UTF-8">
<title>noticeList.jsp</title>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
<%
	//페이징
	int currentPage = 1; //현재 페이지
	int endPage = 0; // 마지막 페이지
	//페이지 값
	if(request.getParameter("currentPage") !=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticelist = noticeDao.selectNoticeList(currentPage);
		
		//Dao클래스에서 최대 페이지 값 불러오기
		endPage = noticeDao.getNoticeEndPage();
	%>
<div>
	<h1>공지사항 관리</h1>
</div>
<!-- 공지사항 글 쓰기 -->
<a href="/mall-admin/notice/addNotice.jsp"><button type="submit" class="nav-link btn btn-primary btn-sm" style="float:right;"><font color="black">글쓰기</font></button></a>
<br>

<!-- 공지 게시판 -->
	<table class = "table table-bordered">
		<thead style="text-align:center;">
			<tr>
				<th style="width:10%;">번호</th>
				<th style="width:70%;">제목</th>
				<th style="width:30%;">날짜</th>
			</tr>
		</thead>
		<tbody style="text-align:center;">
		<%
			for(Notice n : noticelist){
		%>
			<tr>
				<td style="width:10%;"><a href ="/mall-admin/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId() %>"><%=n.getNoticeId() %></a></td>
				<td style="width:70%;"><a href ="/mall-admin/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId() %>"><%=n.getNoticeTitle()%></a></td>
				<td style="width:30%;"><%=n.getNoticeDate() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
	<!-- 페이징 -->
	<table  class="pagination justify-content-center" >
	<tr>
	<%
	//현재 페이지가 1보다 클 때
	if(currentPage>1){
	%>
		<td><a href="/mall-admin/notice/noticeList.jsp?currentPage=1" class="btn btn-outline-primary btn-sm">처음</a></td>
		<td><a href="/mall-admin/notice/noticeList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-primary btn-sm">이전</a></td>
	<%
		//현재 페이지가 1페이지일 때
		}else{
	%>
		<!-- 테이블 크기 조정 -->
		<td style="width:30px"></td>
		<td style="width:30px"></td>
	<%
		} //현재 페이지
	%>
		<th style="width:30px"><%=currentPage %></th>
	<%
		//현재페이지가 마지막 페이지보다 작을 때
		if(currentPage < endPage){
	%>
		<td><a href="/mall-admin/notice/noticeList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-primary btn-sm">다음</a></td>
		<td><a href="/mall-admin/notice/noticeList.jsp?currentPage=<%=endPage %>" class="btn btn-outline-primary btn-sm">맨끝</a></td>
	<%
		//현재 페이지가 마지막일 때
		}else{
	%>
		<!-- 테이블 크기 조정 -->
		<td style="width:30px"></td>
		<td style="width:30px"></td>
	<%
		}
	%>
	</tr>
	</table>
</div>
</body>
</html>