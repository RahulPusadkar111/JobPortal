<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: chocolate;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
				
						<div class="text-center">
							<i class="fa-solid fa-user-plus fa-2x"></i><h5>Registration</h5>
						</div>
							<c:if test="${not empty signupMSG }">
					<h4 class="text-center text-success" >
						<c:out value=" ${signupMSG }"></c:out>
						
					</h4>
					<c:remove var="signupMSG"/>
				</c:if>
						<form action="SignupServlet" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									 name="name">
							</div>
							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									 name="qua">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="email">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									required="required" class="form-control"
									id="exampleInputPassword" aria-describedby="emailHelp"
									name="ps">
							</div>
							<button type="submit " class="btn btn-primary btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>