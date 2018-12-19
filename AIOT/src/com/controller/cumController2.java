package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CumulativeBean;
import com.model.CumulativeModel;

@WebServlet("/cumController2")
public class cumController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//String origin=request.getParameter("org");
		String dest=request.getParameter("dest");
		HttpSession session =request.getSession(false);
		CumulativeBean cb=(CumulativeBean)session.getAttribute("object");
		CumulativeModel cm=new CumulativeModel();
		int x=0;
		String org=(String)session.getAttribute("origcum");
		cb.setPick(org);
		cb.setDrop(dest);
		
		try {
			 x=cm.insert(cb);
			 System.out.println(x);
			 if(x==0)
			 {
				 PrintWriter out=response.getWriter();
				 out.println("<h3> the requested number of seats are not available in train in that day</h3>");
			 }
			 if(x>=1)
			 {
				 response.sendRedirect("Invoice.jsp");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
