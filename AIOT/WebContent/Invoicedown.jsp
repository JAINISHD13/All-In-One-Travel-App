<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.Bean.CumulativeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>


	
  
<table width="90%" >
<%
response.setContentType("application/xlsx");
response.setHeader("Content-Disposition","attachment;filename=\"invoicetaxi.xls\"");		
Date d1=new Date();
Calendar c1=Calendar.getInstance();
d1=c1.getTime();

%>
<h3><center>Cumulative Invoice</center></h3>
<tr><td>Invoice number:123456</td><td>Invoice date:<%=d1%></td><td>pnr:pndsadh</td></tr>
<br><br>
<tr><td>AIOT<br>ADDRESS</td><td>Invoice </td><td>&nbsp;</td></tr>
</table>
<br><br>


	
	<% CumulativeBean cb=new CumulativeBean();
	cb=(CumulativeBean)session.getAttribute("object");
	String name=cb.getName();
	String pick=cb.getPick();
	String drop=cb.getDrop();
	String type=cb.getType();
	String tname=cb.getTname();
	String jdate=cb.getTdate();
	String number=cb.getNumber();
	Double dist=(Double)session.getAttribute("distorg");
	Double time=(Double)session.getAttribute("timeorg");
	String stn=(String)session.getAttribute("originnext");
	double fare=0,tax;
	if(tname.equals("amd-mum")){
		fare=2000*Integer.parseInt(number);
		
	}
	else if(tname.equals("amd-del"))
		fare=2500*Integer.parseInt(number);
	else if(tname.equals("amd-ban"))
		fare=2200*Integer.parseInt(number);
	else if(tname.equals("amd-hyd"))
		fare=2800*Integer.parseInt(number);
	double temp=0,tim=0;
	
	if(type.equals("sedan")){
		temp+=Math.round(dist*30);
		tim+=Math.round(time*1.02);
		}
	else if(type.equals("suv")){
		temp+=Math.round(dist*25);
		tim+=Math.round(time*1.02);
	}
	else if(type.equals("cab")){
		temp+=Math.round(dist*20);
		tim+=Math.round(time*1.02);
	}
	else if(type.equals("auto"))
		temp+=Math.round(dist*8);
	
	double f=fare+temp+tim;
	System.out.println(fare);
	Double total=f+(f*0.04);
	
	%>
	<h2 style="margin-left:5%;">Passenger details</h2>
<table width="90%" align="center">
<tr><td>Name of passenger: <%=name %></td><td>date and time: <%=jdate %></td></tr>
<tr><td>pickup location: <%=pick %></td><td>dropoff location:   Kalupur Railway Station, Laxmi Bazar, Ahmedabad, Gujarat, India</td></tr>
<tr><td>pickup location:<%=stn %> </td><td>dropoff location:   <%=drop %></td></tr>
<tr><td>service type:  <%=type %></td><td>number of kms and duration(in minutes):   <%=dist %>kms   <%=time %>mins</td></tr>
</table>
<br><br>
	<table  width=90% align="center">
	<tr><td>FARE OF TRAIN:</td><td><%=fare %></</td></tr>
	<tr><td>TAX:4%</td><td><%=f *0.04%></td></tr>
	<tr><td>FARE OF SERVICE</td><td><%=temp%></td></tr>
	<tr><td>COST OF TIME SPENT IN TAXI</td><td><%=tim %></td></tr>
	<tr><td>CAB/AUTO rate are to be paid on the spot</td>
	<tr><td>GROSS</td><td><%=Math.round(total)%></td>
	</table>
	
	