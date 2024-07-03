<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		
		<c:if test="${userobj.role eq 'admin' }">
		<li class="nav-item active"><a class="nav-link" href="admin.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
		</c:if>
			<c:if test="${ userobj.role eq 'User'}">
		<li class="nav-item active"><a class="nav-link" href="user_home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
		</c:if>
			
			<c:if test="${empty userobj }">
		<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
		</c:if>
			
			<c:if test="${userobj.role eq 'admin' }">
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fa-solid fa-eye"></i>View job</a></li>
				<li class="nav-item"><a class="nav-link" href="add_jobs.jsp"><i
						class="fa-solid fa-plus"></i>Post job</a></li>
			</c:if>


		</ul>
		<form class="form-inline my-2 my-lg-0">
			<c:if test="${userobj.role eq 'admin' }">
				<a href="#" class="btn btn-light mr-1"><i
					class="fa-solid fa-user-plus"></i>Admin</a>
				<a href="LogoutServlet" class=" btn btn-light"><i
					class="fa-solid fa-arrow-right-long"></i>Logout</a>
			</c:if>

			<c:if test="${userobj.role eq 'User' }">
				<a href="#" class="btn btn-light mr-1" data-toggle="modal" data-target="#exampleModal"><i class="fa-solid fa-user-plus"></i>${userobj.name}</a>
				<a href="LogoutServlet" class=" btn btn-light"><i
					class="fa-solid fa-arrow-right-long"></i>Logout</a>
			</c:if>

			<c:if test="${empty userobj}">
				<a href="login.jsp" class="btn btn-dark mr-1"><i
					class="fa-solid fa-arrow-right-long"></i>Login</a>
				<a href="signup.jsp" class=" btn btn-dark"><i
					class="fa-solid fa-user-plus"></i>Signup</a>
			</c:if>

		</form>
	</div>
</nav>

<div class="modal fade" id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div  class="modal-content">
			<div  class="modal-header">
				<h5  class="modal-title" id="exampleModalLabel" >Profile</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa fa-user-circle fa-3x"></i>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${userobj.name}</th>
								</tr>
								<tr>
									<th scope="row">Qualification</th>
									<th>${userobj.qualification}</th>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<th>${userobj.email}</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="modal-footer">
			
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="edit_user.jsp?id=${userobj.id }&??" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>

