package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.TrainBean;
import com.model.Taximodel;


@WebServlet("/TrainController")
public class TrainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username=request.getParameter("username");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");

		String date=request.getParameter("date");

		String type=request.getParameter("type");
		TrainBean tb=new TrainBean();
		tb.setContact(contact);
		tb.setUsername(username);
		tb.setDate(date);
		tb.setType(type);
		tb.setEmail(email);
		Taximodel tm=new Taximodel();
		int x=tm.insertTrain(tb);
		System.out.println(x+" rows inserted");
	}

}
