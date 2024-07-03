<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="all_component/all_css.jsp"%>



</head>
<body style="background-color: azure;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h5>Login Page</h5>
						</div>
						<c:if test="${not empty loginMSG }">
							<h4 class="text-center text-success">
								<c:out value=" ${loginMSG }"></c:out>

							</h4>
							<c:remove var="loginMSG" />
						</c:if>
						
						<c:if test="${not empty logoutMSG }">
							<h4 class="text-center text-success">
								<c:out value=" ${logoutMSG }"></c:out>

							</h4>
							<c:remove var="logoutMSG" />
						</c:if>
						<form action="Login" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="em">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									required="required" class="form-control"
									id="exampleInputPassword" aria-describedby="emailHelp"
									name="ps">
							</div>
							<button type="submit " class="btn btn-primary btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	

	<%@ include file="all_component/footer.jsp" %>
	
	 
	<!-- 	<div style="margin-top: 70px;"> -->
	<%-- 	<%@ include file="all_component/footer.jsp" %> --%>
	<!-- 	</div> -->
</body>
</html>