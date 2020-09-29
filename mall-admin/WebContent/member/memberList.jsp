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
<title>Insert title here</title>
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

		MemberDao memberDao = new MemberDao();
		ArrayList<Member> memberlist = memberDao.selectMemberList(currentPage);
		
		//Dao클래스에서 최대 페이지 값 불러오기
		endPage = memberDao.getMemberEndPage();
	%>
	<h1>회원 관리</h1>
	<table class="table">
		<thead>
			<tr>
				<th>이메일</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>가입날짜</th>
				<th>탈퇴 여부</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Member m : memberlist){
		%>
			<tr>
			<th><%=m.getMemberEmail() %></th>
			<th>****</th>
			<th><%=m.getMemberName() %></th>
			<th><%=m.getMemberDate() %></th>
			<%
				if(m.getMemberState().equals("Y")){
			%>
			<th><a href="/mall-admin/member/modifyMemberStateAction.jsp?memberEmail=<%=m.getMemberEmail()%>&memberState=<%=m.getMemberState()%>">활동중</a></th>
			<%
				}else{
			%>
			<th><a href="/mall-admin/member/modifyMemberStateAction.jsp?memberEmail=<%=m.getMemberEmail()%>&memberState=<%=m.getMemberState()%>">탈퇴</a></th>
			<%
				}
			%>
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
		<td><a href="/mall-admin/member/memberList.jsp?currentPage=1" class="btn btn-outline-primary btn-sm">처음</a></td>
		<td><a href="/mall-admin/member/memberList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-primary btn-sm">이전</a></td>
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
		<td><a href="/mall-admin/member/memberList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-primary btn-sm">다음</a></td>
		<td><a href="/mall-admin/member/memberList.jsp?currentPage=<%=endPage %>" class="btn btn-outline-primary btn-sm">맨끝</a></td>
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
<div>
</div>
</div>
</body>
</html>