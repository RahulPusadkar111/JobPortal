<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Jobs</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: indigo;">
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
						<c:if test="${not empty successMsg }">
						<div class="alert alert-success" role="alert">
						 <c:out value=" ${successMsg }"></c:out>
						</div>
						<c:remove var="successMsg"/>
						</c:if>
						<h5>Add Jobs</h5>
						
					</div>
					<form action="PostJobsServlet" method="post">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" required="required"
								class="form-control" name="title">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelected">
									<option selected>Choose...</option>
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
									<option selected>Choose...</option>
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

									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea rows="6" cols="" name="desc" class="form-control"></textarea>
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>