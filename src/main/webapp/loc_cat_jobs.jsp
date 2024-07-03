<%@page import="java.util.ArrayList"%>
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
<title>View Jobs According to Location And Catagory</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: darkgreen;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
						
				<%
				 JobsDao jd= new JobsDao(DBconnect.getConnection());
				String catagory=request.getParameter("catagory");
				String location=request.getParameter("location");
				List<Jobs> list=null;
				String msg="";
				if("lo".equals(location) && "ca".equals(catagory))
				{
					list=new ArrayList<Jobs>();
					msg="Jobs not availabe";
				}
				else if("lo".equals(location) || "ca".equals(catagory))
				{
					list=jd.viewJobsAccording_CAT_OR_LOC(catagory, location);
				}
				else
				{
					list=jd.viewJobsAccording_CAT_AND_LOC(catagory, location);
				}
				
				if( list.isEmpty())
				{%>
					<h4 class="text-center text-danger"><%=msg %></h4>
				<% }
				
				if(list != null)
				{
				for(Jobs j:list)
				{%>
					<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle() %></h6>
						<%
						if(j.getDescription().length()>0 && j.getDescription().length()<140)
						{%>
							<p><%=j.getDescription() %></p>
							<%}
						else
						{%>
							<p><%=j.getDescription().substring(0, 120) %>...</p>
						<%}
						%>
						
						
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="<%=j.getLocation() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="<%=j.getCatagory() %>" readonly>
							</div>
						</div>
						<h6>Published date:<%=j.getPdate() %></h6>
						<div class="text-center">
							<a href="one_view_job.jsp?id=<%=j.getId()%>&??" class="btn btn-sm bg-success text-white">View more</a>
						</div>
					</div>
				</div>
				<%}
				
				}
				else
				{%>
				    
					<h4 class="text-center text-danger"><%=msg %></h4>
				<%}
				%>
				
				
				
						 
							
				
			</div>
		</div>
	</div>
	 <%@ include file="all_component/footer.jsp" %>
</body>
</html>