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

/**
 * Servlet implementation class LoginController1
 */
@WebServlet("/LoginController1")
public class LoginController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		LoginBean lb=new LoginBean();
		System.out.println("in login");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		lb.setUsername(username);
		lb.setPassword(password);
		HttpSession session=request.getSession();
		session.setAttribute("uname", username);
		System.out.println(password);
		DbHelper db1=new DbHelper();
		boolean ans=db1.validate(lb);
		if(ans==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("cumulative_f.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
		}
	}

}
