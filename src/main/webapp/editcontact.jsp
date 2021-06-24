<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.ContactDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Contact</title>
<%@include file="component/css/css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
		if(user==null)
		{
			session.setAttribute("InvalidMsg", "Login Please...");
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
						
						<form action="UpdateContact" method="post">
						<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao = new ContactDAO(DBConnect.getConnection());
							Contact c = dao.getContactByID(cid);
						
						%>
						<input type="hidden" value="<%=cid %>" name="cid">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input value="<%=c.getName() %>"
								 type="text" class="form-control" name="name" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									 value="<%=c.getEmail() %>" type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone No</label>
								 <input  value="<%=c.getPhno() %>"	type="text" name="phone" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter phone number">
							</div>
							<div class="form-group">
								<textarea class="form-control" name="about" rows="3"
									placeholder="Enter about"> <%=c.getAbout() %> </textarea>
							</div> 
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Update
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