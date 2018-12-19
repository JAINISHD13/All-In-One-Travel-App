package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.BusBean;
import com.Bean.TaxiBean;
import com.model.Taximodel;

/**
 * Servlet implementation class BusController
 */
@WebServlet("/BusController")
public class BusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
				String name=request.getParameter("username");
				String con=request.getParameter("contact");
				String email=request.getParameter("email");
				String date=request.getParameter("date");
				String time=request.getParameter("time");
				String pol=request.getParameter("pol");
				String dol=request.getParameter("dol");
				String type=request.getParameter("type");
				System.out.println(pol);
				System.out.println(dol);
				BusBean tb=new BusBean();
				tb.setName(name);
				tb.setCon(con);
				tb.setEmail(email);
				tb.setDate(date);
				tb.setPol(pol);
				tb.setDol(dol);
				tb.setTime(time);
				tb.setType(type);
				Taximodel tm=new Taximodel();
				int x=tm.insertbus(tb);
				System.out.println(x+ " rows inserted");
	}

}
