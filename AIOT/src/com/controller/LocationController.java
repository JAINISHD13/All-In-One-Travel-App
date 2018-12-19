package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;

import com.Bean.GoogleMatrixRequest;



/**
 * Servlet implementation class LocationController
 */
@WebServlet("/LocationController11")
public class LocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		String origin=request.getParameter("org");
		String destination=request.getParameter("dest");
		HttpSession session=request.getSession();
		session.setAttribute("origin", origin);
		session.setAttribute("dest", destination);
		String[] org=origin.split(" ");
		String [] dest=destination.split(" ");
		String org1="",dest1="";
		for(int i=0;i<org.length;i++)
		{
			if(org[i].endsWith(","))
			{
				org1=org1+org[i];
			}
			else if(i==org.length-1)
			{
				org1=org1+org[i];
			}
			else
				org1=org1+org[i]+"+";
		}
		for(int i=0;i<dest.length;i++)
		{
			if(dest[i].endsWith(","))
			{
				dest1=dest1+dest[i];
			}
			else if(i==dest.length-1)
			{
				dest1=dest1+dest[i];
			}
			else
				dest1=dest1+dest[i]+"+";
		}
		String office="Rajmani+Society,TOI+Press+Road,Shyamal,Ahmedabad,Gujarat,India";
		System.out.println(org1);
		System.out.println(dest1);
		GoogleMatrixRequest req=new GoogleMatrixRequest();
		try {
			String dist=req.getDistance(office, org1);
			String [] d=dist.split(" ");
			System.out.println(dist);
			Double x=Double.parseDouble(d[0]);
			
			if(x>30)
			{
				out.println("<h1>Distance is greater than 30 kms service is provided only within the radius of 30 km from the office</h1>");
				
			}
			else
			{
				System.out.println("in main else");
				String dist1=req.getDistance(org1, dest1);
				String [] d1=dist1.split(" ");
				System.out.println(d1[0]);
				System.out.println(d1[2]);
				Double y=Double.parseDouble(d1[0]);
				Double z=Double.parseDouble(d1[2]);
				session.setAttribute("kms", y);
				session.setAttribute("time", z);
				if(y>30)
				{
					System.out.println("in if");
					out.println("<h1>Distance is greater than 30 kms..! service is provided only within the radius of 30 km</h1>");
				}
				else
				{
					System.out.println("in else");
					response.sendRedirect("taxi_booking_f.jsp");
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
