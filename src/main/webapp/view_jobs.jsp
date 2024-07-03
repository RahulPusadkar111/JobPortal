<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.JobsDao"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: burlywood;">
	<%@ include file="all_component/navbar.jsp"%>
		<c:if test="${userobj.role ne 'admin'}">
	     <c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
		
			
				<c:if test="${not empty deleteMSG }">
					<div class="alert alert-success" role="alert">
						<c:out value=" ${deleteMSG }"></c:out>
						
					</div>
					<c:remove var="deleteMSG"/>
				</c:if>
				
				
				<c:if test="${not empty editMsg }">
						<div class="alert alert-success" role="alert">${ editMsg}</div>
						 
<%-- 		<c:out value=" ${editMsg }"></c:out>				 --%>
						
						<c:remove var="editMsg"/>
						</c:if>
				<h5>All Jobs</h5>
				<div class="card mt-2">

					<%
					JobsDao jd = new JobsDao(DBconnect.getConnection());
					List<Jobs> list = jd.view_Jobs();
					for (Jobs j : list) {
						int id = j.getId();
						String title = j.getTitle();
						String description = j.getDescription();
						String catagory = j.getCatagory();
						String status = j.getStatus();
						String loc = j.getLocation();
						String pdate = j.getPdate();
					%>
					<div class="card-body">
						<div class="text-center text-primary">

							<i class="fa fa-clipboard fa-2x"></i>
						</div>
						<h6><%=title%></h6>
						<p><%=description%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=loc%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Catagory:<%=catagory%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status:<%=status%>" readonly>
							</div>
						</div>
						<h6>
							Published Date:<%=pdate%></h6>
						<div class="text-center">
							<a href="edit_jobs.jsp?id=<%=j.getId() %>&??" class="btn btn-sm bg-success text-white">Edit</a>
							 <a	href="DeleteJobsServlet?id=<%=id%>&??" class="btn btn-sm bg-success text-white">Delete</a>
						</div>
					</div>
					<%
					}
					%>


				</div>
			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>