<%@page import="com.Bean.autoBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Bean.TaxiBean"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
</head>
<table border="1px" width="100%">
<%
response.setContentType("application/xlsx");
response.setHeader("Content-Disposition","attachment;filename=\"invoiceauto.xls\""); 
Date d1=new Date();
Calendar c1=Calendar.getInstance();
d1=c1.getTime();
autoBean ab=(autoBean)session.getAttribute("autoobj");
String name=ab.getName();
String jdate=ab.getDate();
String time=ab.getTime();
String ploc=ab.getPol();
String dloc=ab.getDol();
Double kms=(Double)session.getAttribute("kms1");
Double min=(Double)session.getAttribute("time1");
int cost=8;
double fare=cost*kms;
if(fare<40){
	fare=40;
}
double total=fare+(fare*0.04);
%>
<
<tr><td>Invoice number:123456</td><td>Invoice date:<%=d1%></td><td>pnr:pndsadh</td></tr>
<br><br>
<tr><td>AIOT<br>ADDRESS</td><td>Invoice </td><td>&nbsp;</td></tr>
</table>
<br><br>
<h2>Passenger details</h2>
<table border="2px solid black" width="100%">
<tr><td>Name of passenger: <%=name %></td><td>date and time: <%=jdate %></td></tr>
<tr><td>pickup location: <%=ploc %></td><td>dropoff location: <%=dloc %></td></tr>
<tr><td>time in minutes:  <%= min%></td><td>number of kms  <%=kms %>kms </td></tr>
</table>
<br><br>
<table border="1px" width=100%>
	
	<tr><td>FARE:</td><td><%=fare %></td></tr>
	<tr><td>TAX:4%</td><td><%=fare *0.04%></td></tr>
	<tr><td>CAB/AUTO rate are to be paid on the spot</td>
	<tr><td>GROSS</td><td><%=total %></td>
	</table>
</html>