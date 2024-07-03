<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color:darkgoldenrod; ">
<%@ include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
				
						<div class="text-center">
							<i class="fa-solid fa-user-plus fa-2x"></i><h5>Edit Profile</h5>
						</div>
							<%
							
							UserDao ud=new UserDao(DBconnect.getConnection());
							int id=Integer.parseInt(request.getParameter("id"));
							User u=ud.getUserById(id);
							%>
						<form action="EditUserServlet" method="post">
						<input type="hidden" name="id" value="<%=u.getId()%>">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									 name="name" value="<%=u.getName() %>">
							</div>
							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									 name="qua" value="<%=u.getQualification() %>">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="email" value="<%=u.getEmail() %>">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									required="required" class="form-control"
									id="exampleInputPassword" aria-describedby="emailHelp"
									name="ps" value="<%=u.getPassword() %>">
							</div>
							<button type="submit " class="btn btn-primary btn-block">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>