<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
    
    
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
      int productId = Integer.parseInt(request.getParameter("productId"));
   %>
   <h1>상품 이미지 수정</h1>
  <form action="/mall-admin/product/modifyProductPicAction.jsp" method="post" enctype="multipart/form-data">
      <input type = "hidden" name="productId" value="<%=productId%>">
      <div>
         이미지 선택:
         <input type="file" name="productPic">
      </div>
      <button type="submit">이미지 수정</button>
   </form>
   </div>
</body>
</html>