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
<title>View More</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: black;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobsDao jd = new JobsDao(DBconnect.getConnection());
				Jobs j = jd.getAllById(id);
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>


						<p><%=j.getDescription()%></p>
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

					</div>
				</div>







			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>