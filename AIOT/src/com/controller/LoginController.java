package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.LoginBean;
import com.model.DbHelper;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		LoginBean lb=new LoginBean();
		System.out.println("in login");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		lb.setUsername(username);
		lb.setPassword(password);
		System.out.println(password);
		DbHelper db1=new DbHelper();
		boolean ans=db1.validate(lb);
		System.out.println(ans);
		HttpSession session=request.getSession();
		HttpSession session1=request.getSession();
		
		if(ans==true)
		{
			System.out.println("i if");
			String ans1="true";
			session1.setAttribute("ans1", ans1);
			session.setAttribute("username", username);
			RequestDispatcher rd=request.getRequestDispatcher("Index_f.jsp");
			rd.forward(request, response);
			
			//response.sendRedirect("Index_f.jsp");
			
			
			
		}
		else
		{
			session1.setAttribute("login", "false");
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}
		
	}

}
