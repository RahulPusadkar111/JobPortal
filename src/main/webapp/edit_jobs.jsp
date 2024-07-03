<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.JobsDao"%>
<%@page import="com.entity.Jobs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Jobs</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color:gray;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${userobj.role ne 'admin'}">
	     <c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<%
						  
						  JobsDao jd=new JobsDao(DBconnect.getConnection());
						  int id=Integer.parseInt(request.getParameter("id")) ;
						
						  Jobs jb= jd.getAllById(id);
						%>
						
						<h5>Edit Jobs</h5>
						
					</div>
					<form action="EditJobsServlet" method="post">
						<div class="form-group">
							 <input type="hidden" required="required"
								class="form-control" name="id" value="<%=jb.getId()%>">
						</div>
						<div class="form-group">
							<label>Enter Title</label> <input type="text" required="required"
								class="form-control" name="title" value="<%=jb.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelected">
									<option value="<%=jb.getLocation() %>"><%=jb.getLocation() %></option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Bhubneshwar">Bhubneshwar</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Catagory</label> <select name="catagory"
									class="custom-select" id="inlineFormCustomSelected">
									<option value="<%=jb.getCatagory() %>"><%=jb.getCatagory() %></option>
									<option value="It">It</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select name="status" class="form-control"
									id="inlineFormCustomSelected">
                                        <option class="Active" value="<%=jb.getStatus() %>"><%=jb.getStatus() %></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea rows="6" cols="" name="desc" value="<%=jb.getDescription() %>" class="form-control"><%=jb.getDescription() %></textarea>
						</div>
						<button class="btn btn-success">Edit Job</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>