<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/css/css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("LoginMsg", "Login Please...");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Page</h4>
						
						<%
						String successMsg = (String) session.getAttribute("sMsg");
						String errorMsg = (String) session.getAttribute("eMsg");
						if (successMsg != null) {
						%>
						<p class="text-success text-center"><%=successMsg%></p>
						<%
						session.removeAttribute("sMsg");
						}
						if (errorMsg != null) {
						%><p class="text-danger text-center"><%=errorMsg%></p>
						<%
						session.removeAttribute("eMsg");
						}
						%>
						
						<form action="AddContact" method="post">
						<%
							if(user!=null)
							{ %>
								<input type="hidden" value=<%= user.getId() %> name="userid" >
						<%
							}
						%>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" name="name" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone No</label> <input
									type="text" name="phone" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter phone number">
							</div>
							<div class="form-group">
								<textarea class="form-control" name="about"
									id="exampleFormControlTextarea1" rows="3"
									placeholder="Enter about"></textarea>
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Save
									Contact</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 195px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>