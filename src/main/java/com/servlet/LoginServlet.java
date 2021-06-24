package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.entity.User;
import com.entity.UserDao;

public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		
		UserDao user = new UserDao(DBConnect.getConnection());
		User u = user.loginUser(email, pwd);
		HttpSession session = req.getSession();
		if(u!=null)
		{
			session.setAttribute("user",u);
			resp.sendRedirect("index.jsp");
//			System.out.println("User is available " + u);
		}
		else
		{
			session.setAttribute("InvalidMsg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");
//			System.out.println("User is not available " + u);
		}
		
	}

}
