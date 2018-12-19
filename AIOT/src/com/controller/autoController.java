package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;

import com.Bean.autoBean;
import com.model.Taximodel;

/**
 * Servlet implementation class autoController
 */
@WebServlet("/autoController")
public class autoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession(false);
		String name=request.getParameter("username");
		String con=request.getParameter("contact");
		String email=request.getParameter("email");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String pol=(String) session.getAttribute("origin");
		String dol=(String) session.getAttribute("dest");
		
		System.out.println(pol);
		System.out.println(dol);
		autoBean ab=new autoBean();
		ab.setName(name);
		ab.setCon(con);
		ab.setEmail(email);
		ab.setDate(date);
		ab.setPol(pol);
		ab.setDol(dol);
		ab.setTime(time);
		session.setAttribute("autoobj",ab);
		Taximodel tm=new Taximodel();
		int x=tm.insertauto(ab);
		//System.out.println(x+" rows inserted");
		if(x>=1){
			System.out.println("in");
			response.sendRedirect("autoinvoice.jsp");
		}
	}

}
