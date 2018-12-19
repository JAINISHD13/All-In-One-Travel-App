package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CummulativeBean;
import com.model.CumulativeModel;

/**
 * Servlet implementation class CummulativeController
 */
@WebServlet("/CummulativeController")
public class CummulativeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int x = 0;
		HttpSession session=request.getSession(false);
		String uname=(String) session.getAttribute("uname");
		CummulativeBean cb=new CummulativeBean();
		cb.setName(uname);
		String tadate=request.getParameter("tadate");
		String tatime=request.getParameter("tatime");
		String tapol=request.getParameter("tapol");
		String tadol=request.getParameter("tadol");
		String tatype=request.getParameter("tatype");
		String btime=request.getParameter("btime");
		String bdate=request.getParameter("bdate");
		String bpol=request.getParameter("bpol");
		String bdol=request.getParameter("bdol");
		String btype=request.getParameter("btype");
		String atime=request.getParameter("atime");
		String adate=request.getParameter("adate");
		String apol=request.getParameter("apol");
		String adol=request.getParameter("adol");
		//CummulativeBean cb=new  CummulativeBean();
		cb.setTadate(tadate);
		cb.setTatime(tatime);
		cb.setTapol(tapol);
		cb.setTadol(tadol);
		cb.setTatype(tatype);
		cb.setBtime(btime);
		cb.setBdate(bdate);
		cb.setBpol(bpol);
		cb.setBdol(bdol);
		cb.setBtype(btype);
		cb.setAtime(atime);
		cb.setAdate(adate);
		cb.setApol(apol);
		cb.setAdol(adol);
		CumulativeModel cm=new CumulativeModel();
		System.out.println(request.getParameter("more"));
		if((request.getParameter("more")).equals("do more bookings"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("cumulative_f.jsp");
			rd.forward(request, response);
		}
		else
		{
			x=cm.insert(cb);
		}
		System.out.println(x+" rows inserted");
		
	}

}
