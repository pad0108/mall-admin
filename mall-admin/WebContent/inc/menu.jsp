<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">	
	<ul class="navbar-nav navbar-expand-xl bg-dark navbar-light">
		<li class="nav-item active">
			<a class="nav-link" href="/mall-admin/index.jsp">[홈으로]</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/mall-admin/category/categoryList.jsp">[상품 카테고리 관리]</a>
		</li>
		<li class="nav-item active">	
			<a class="nav-link" href="/mall-admin/product/productList.jsp">[상품관리]</a>
		</li>
		<li class="nav-item active">	
			<a class="nav-link" href="/mall-admin/orders/ordersList.jsp">[주문 내역 조회]</a>
		</li>
		<li class="nav-item active">	
			<a class="nav-link" href="/mall-admin/notice/noticeList.jsp">[공지 관리]</a>
		</li>
		<li class="nav-item active">	
			<a class="nav-link" href="/mall-admin/member/memberList.jsp">[회원 관리]</a>
		</li>
	</ul>
	<ul class="navbar-nav navbar-expand-xl bg-dark navbar-light mr-auto"></ul>
	<ul class="navbar-nav navbar-expand-xl bg-dark navbar-dark mr-right">
		<li class="nav-item active">
			<p class="nav-link"><%=session.getAttribute("loginAdminId")%>님 반갑습니다.</p>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/mall-admin/logoutAction.jsp">[로그아웃]</a>
		</li>
	</ul>
</nav>