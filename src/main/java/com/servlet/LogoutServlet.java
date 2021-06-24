package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session1 = req.getSession();
		session1.removeAttribute("user");
		
		HttpSession session2 = req.getSession();
		session2.setAttribute("logMsg", "Logout Successfully...");
		resp.sendRedirect("login.jsp");
	}
	
}
