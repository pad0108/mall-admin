<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#addForm").val == ""){
				$("#categoryNameHelper").text("카테고리 이름을 입력하세요.");
				return;
			}
				$("#addForm").submit();
		});
	});
</script>
</head>
<body class="container">
<div>
	<h1>관리자 메인 페이지</h1>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>카테고리 입력</h1>
	<form method="post" action ="/mall-admin/category/addCategoryAction.jsp" id="addForm">
		<div class="form-group">
			<label for="usr">Category_name:</label>
			<input type="text" class="form-control" name="categoryName" id="categoryName">
			<span id="categoryNameHelper"></span>
		</div>
		<div><button type="button" id="btn">카테고리 추가</button></div>
	</form>
</div>
</body>
</html>