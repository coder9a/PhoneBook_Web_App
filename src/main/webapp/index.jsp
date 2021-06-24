<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="component/css/css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/phone.png");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%-- <%
	Connection con = DBConnect.getConnection();
	%>
	<%=con%> --%>

	<%@include file="navbar.jsp"%>
	
<%-- 	<% User u = (User)session.getAttribute("user");
	out.println(u);%> --%>	
	
	<div class="container-fluid back-img text-center text-dark">
		<h1>Welcome to PhoneBook App</h1>
	</div>
	<div style="margin-top: -55px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>