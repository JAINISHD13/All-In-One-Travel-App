package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.TaxiBean;
import com.model.Taximodel;


@WebServlet("/taxicontroller")
public class taxicontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String name=request.getParameter("username");
		String con=request.getParameter("contact");
		String email=request.getParameter("email");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String pol=(String)session.getAttribute("origin");
		
		String dol=(String)session.getAttribute("dest");
		String type=request.getParameter("type");
		System.out.println(pol);
		System.out.println(dol);
		TaxiBean tb=new TaxiBean();
		tb.setName(name);
		tb.setCon(con);
		tb.setEmail(email);
		tb.setDate(date);
		tb.setPol(pol);
		tb.setDol(dol);
		tb.setTime(time);
		tb.setType(type);
		session.setAttribute("taxiobj", tb);
		System.out.println(date);
		Taximodel tm=new Taximodel();
		int x=tm.insert(tb);
		if(x>0)
		{
			response.sendRedirect("taxiautoinvoice.jsp");
		}
	}

}
