<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@ include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/j3.jpg");
	width: 100%;
	height: 85vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${ userobj.role ne 'admin' }">
	     <c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid back-img">
		<div class="text-center ">
			<h1 class="text-white p-4">Welcome Admin</h1>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>