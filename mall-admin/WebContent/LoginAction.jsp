<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
   request.setCharacterEncoding("utf-8"); //글자 인코딩
   
   //아이디와 비밀번호 값을 받아옴
   String adminId = request.getParameter("adminId");
   String adminPw = request.getParameter("adminPw");
   Admin paramAdmin = new Admin();
   paramAdmin.setAdminId(adminId);
   paramAdmin.setAdminPw(adminPw);
   
   AdminDao adminDao = new AdminDao();
   Admin loginAdmin = adminDao.login(paramAdmin);
   if(loginAdmin == null){
%>

	<script>
		alert("아이디 또는 비밀번호가 틀렸습니다."); // 로그인 실패시 팝업창 출력
		history.go(-1); //이전 페이지로 이동
	</script>
<%
   } else {
	   System.out.println("로그인 성공");
	   // 로그인 정보를 세션에 저장(page < request < session < application)
	   
	   //세션 변수 생성
	   session.setAttribute("loginAdminId", loginAdmin.getAdminId());
	   response.sendRedirect("/mall-admin/index.jsp");
   }
 
%>
