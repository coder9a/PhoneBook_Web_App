package com.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.entity.User;
import com.entity.UserDao;

public class RegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User u = new User(name, email, password);
		UserDao dao = new UserDao(DBConnect.getConnection());
		boolean f = dao.userRegister(u);
		HttpSession session = request.getSession();
		if(f)
		{
			session.setAttribute("successMsg", "User Registered Successfully..");
			response.sendRedirect("register.jsp");
//			System.out.println("User registered successfully");
		}
		else
		{
			session.setAttribute("errorMsg", "Something Went Wrong..");
			response.sendRedirect("register.jsp");
//			System.out.println("Something went wrong");
		}
		
	}

}
