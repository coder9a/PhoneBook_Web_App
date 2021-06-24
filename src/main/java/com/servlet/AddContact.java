package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

public class AddContact extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userId = Integer.parseInt(req.getParameter("userid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String about = req.getParameter("about");
	
		Contact c = new Contact(name, email, phone, about, userId);
		ContactDAO dao = new ContactDAO(DBConnect.getConnection());
		
		 boolean f = dao.saveContact(c);
		 HttpSession session = req.getSession();
		 if(f)
		 {
			 session.setAttribute("sMsg", "Your Contact Saved Successfully");
			 resp.sendRedirect("addContact.jsp");
		 }
		 else
		 {
			 session.setAttribute("eMsg", "Something went wrong");
			 resp.sendRedirect("addContact.jsp");
		 }
	}
}
