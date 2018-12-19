package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.RegistrationBean;
import com.model.DbHelper;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		out.println("in servlet");
		String uname=request.getParameter("username");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		RegistrationBean rb=new RegistrationBean();
		rb.setUsername(uname);
		rb.setPassword(password);
		rb.setCpassword(cpassword);
		DbHelper db1=new DbHelper();
		int x=db1.insert(rb);
		System.out.println("in");
		System.out.println(x+ " rows inserted");
	}

}
