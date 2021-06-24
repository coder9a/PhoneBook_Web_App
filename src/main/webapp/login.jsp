<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/css/css.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container-fluid">
		<div class="row mt-3 ml-5" >
			<div class="col-md-4 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-success">Login Page</h4>
					<%
							String LoginMsg = (String)session.getAttribute("LoginMsg");
							if(LoginMsg !=null)
							{%>
							<p class="text-danger text-center"> <%= LoginMsg %></p>
							<%
								session.removeAttribute("LoginMsg");
							}						
						%>
						<%
							String InvalidMsg = (String)session.getAttribute("InvalidMsg");
							if(InvalidMsg !=null)
							{%>
							<p class="text-danger text-center"> <%= InvalidMsg %></p>
							<%
								session.removeAttribute("InvalidMsg");
							}						
						%>
						
						<%
							String LogMsg = (String)session.getAttribute("logMsg");
							if(LogMsg !=null)
							{%>
							<p class="text-success text-center"> <%= LogMsg %></p>
							<%
								session.removeAttribute("logMsg");
							}						
						%>
						<form action="LoginServlet" method="post" >
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
									<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Login</button>
									</div>
							</div>
							
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top:365px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>