<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contact</title>
<%@include file="component/css/css.jsp"%>
<style>
.crd-ho {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("LoginMsg", "Login Please...");
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	String successMsg = (String) session.getAttribute("sMsg");
	String errorMsg = (String) session.getAttribute("eMsg");
	if (successMsg != null) {
	%>
	<div class="alert alert-success">
		<%=successMsg%>
	</div>
	<%
	}
	session.removeAttribute("sMsg");
	%>
	<%
	if (errorMsg != null) {
	%>
	<div class="alert alert-danger">
		<%=errorMsg%>
	</div>
	<%
	}
	session.removeAttribute("eMsg");
	%>
	
	
	
	<div class="container">
		<div class="row p-4">
			<%
			if (user != null) {
				ContactDAO dao = new ContactDAO(DBConnect.getConnection());
				List<Contact> contact = dao.getAllContact(user.getId());
				for (Contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							Name:
							<%=c.getName()%></h5>
						<p>
							Phone No.:
							<%=c.getPhno()%></p>
						<p>
							Email:
							<%=c.getEmail()%></p>
						<p>
							About:
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editcontact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> 
								<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>

</body>
</html>