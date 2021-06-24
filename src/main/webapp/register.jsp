<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/css/css.jsp"%>
</head>
<body style="background-color: #f7faf8">
	<%@include file="navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-2 mt-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Registration Page</h4>
						<%
						String successMsg = (String) session.getAttribute("successMsg");
						String errorMsg = (String) session.getAttribute("errorMsg");
						if (successMsg != null) {
						%>
						<p class="text-success text-center"><%=successMsg%></p>
						<%
						session.removeAttribute("successMsg");
						}
						if (errorMsg != null) {
						%><p class="text-danger text-center"><%=errorMsg%></p>
						<%
						session.removeAttribute("errorMsg");
						}
						%>



						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" name="name" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password"
									id="exampleInputPassword1" placeholder="Password">
								<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Register</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 280px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>