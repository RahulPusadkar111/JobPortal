<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.JobsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User HomePage</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: yellow; ">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${  empty userobj }">
	     <c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<div class="card">
				<c:if test="${not empty edituserMSG }">
							<h4 class="text-center text-success">
								<c:out value=" ${edituserMSG }"></c:out>

							</h4>
							<c:remove var="edituserMSG" />
						</c:if>
						
					<div class="card-body">
						<form class="form-inline" action="loc_cat_jobs.jsp">
							<div class="form-group col-md-4 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Catagory</h5>
							</div>
							<div class="form-group col-md-5">
								<select name="location" class="custom-select"
									id="inlineFormCustomSelected">
									<option value="lo" selected>Choose...</option>
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
							<div class="form-group col-md-5">
								<select name="catagory" class="custom-select"
									id="inlineFormCustomSelected">
									<option value="ca" selected>Choose...</option>
									<option value="It">It</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<button type="submit" class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
				<%
				JobsDao jd = new JobsDao(DBconnect.getConnection());
				List<Jobs> list = jd.view_JobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 140) {
						%>
						<p><%=j.getDescription()%></p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>


						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="<%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="<%=j.getCatagory()%>" readonly>
							</div>
						</div>
						<h6>
							Published date:<%=j.getPdate()%></h6>
						<div class="text-center">
							<a href="one_view_job.jsp?id=<%=j.getId()%>&??"
								class="btn btn-sm bg-success text-white">View more</a>
						</div>
					</div>
				</div>
				<%
				}
				%>






			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>

