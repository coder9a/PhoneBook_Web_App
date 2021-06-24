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

public class UpdateContact extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String about = req.getParameter("about");
		
		Contact c = new Contact();
		c.setId(cid);
		c.setName(name);
		c.setEmail(email);
		c.setPhno(about);
		c.setAbout(about);
		
		ContactDAO dao = new ContactDAO(DBConnect.getConnection());
		boolean f = dao.UpdateContact(c);
		HttpSession session = req.getSession();
		if(f)
		 {
			 session.setAttribute("sMsg", "Your Contact Updated Successfully");
			 resp.sendRedirect("viewContact.jsp");
		 }
		 else
		 {
			 session.setAttribute("eMsg", "Something went wrong");
			 resp.sendRedirect("editcontact.jsp?cid="+cid);
		 }
	}
	

}
