<%@page import="java.util.List"%>
<%@page import="com.Bean.TaxiBean"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table border="1px" width="100%">
<%
response.setContentType("application/xlsx");
response.setHeader("Content-Disposition","attachment;filename=\"invoicetaxi.xls\"");	
Date d1=new Date();
Calendar c1=Calendar.getInstance();
d1=c1.getTime();
TaxiBean tb=(TaxiBean)session.getAttribute("taxiobj");

String name=tb.getName();
String jdate=tb.getDate();
String time=tb.getTime();
String ploc=tb.getPol();
String dloc=tb.getDol();
String tos=tb.getType();
Double kms=(Double)session.getAttribute("kms");
Double min=(Double)session.getAttribute("time");
int cost=0;
if(tos.equalsIgnoreCase("sedan"))
	cost=30;
else if(tos.equalsIgnoreCase("cab"))
	cost=20;
else if(tos.equalsIgnoreCase("suv"))
	cost=25;
System.out.println(kms);

double fare=cost*kms;
if(fare<53){
	fare=53;
}
System.out.println(fare);
System.out.println(tos);
fare+=min*1.02;
double total=fare+(fare*0.04);
%>
<h3><form action="taxinvoicedown.jsp"><input type="submit" value="download receipt"></form></h3>
<tr><td>Invoice number:123456</td><td>Invoice date:<%=d1%></td><td>pnr:pndsadh</td></tr>
<br><br>
<tr><td>AIOT<br>ADDRESS</td><td>Invoice </td><td>&nbsp;</td></tr>
</table>
<br><br>
<h2>Passenger details</h2>
<table border="2px solid black" width="100%">
<tr><td>Name of passenger: <%=name %></td><td>date and time: <%=jdate %></td></tr>
<tr><td>pickup location: <%=ploc %></td><td>dropoff location: <%=dloc %></td></tr>
<tr><td>service type:  <%=tos %></td><td>number of kms and duration(in minutes): <%=kms %>kms   <%=min %>mins</td></tr>
</table>
<br><br>
<table border="1px" width=100%>
	
	<tr><td>FARE:</td><td><%=fare %></td></tr>
	<tr><td>TAX:4%</td><td><%=Math.round(fare *0.04)%></td></tr>
	<tr><td>Cost of Time spent in taxi</td><td><%=Math.round((min*1.02)) %></td></tr>
	<tr><td>CAB/AUTO rate are to be paid on the spot</td>
	<tr><td>GROSS</td><td><%=total %></td>
	</table>
</html>