package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CumulativeBean;
import com.model.CumulativeModel;

/**
 * Servlet implementation class cumController
 */
@WebServlet("/cumController")
public class cumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//String name=request.getParameter("name");
		PrintWriter out=response.getWriter();
		int x=0;
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		
		String type=request.getParameter("type");
		String tdate=request.getParameter("tdate");
		String tname=request.getParameter("ttype");
		String number=request.getParameter("number");
		CumulativeBean cb=new CumulativeBean();
		HttpSession session=request.getSession(false);
	  	String uname=(String)session.getAttribute("username");
		cb.setName(uname);
		cb.setEmail(email);
		cb.setContact(contact);
		System.out.println(uname);
		cb.setType(type);
		cb.setTdate(tdate);
		cb.setTname(tname);
		cb.setNumber(number);
//	CumulativeModel cm=new CumulativeModel();
//		try {
//			 x=cm.insert(cb);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		session.setAttribute("object", cb);
		response.sendRedirect("pickapi.html");
//		RequestDispatcher rd=request.getRequestDispatcher("pickapi.html");
//		rd.forward(request, response);
	}

}
