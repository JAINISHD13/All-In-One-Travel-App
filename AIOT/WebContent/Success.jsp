<%@page import="com.Bean.CumulativeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Taxi Booking</title>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
       <link rel="icon" type="image/x-icon" href="favicon.ico" />

	<link rel="stylesheet" type="text/css" href="css/menu_style.css" />
	<link rel="stylesheet" type="text/css" href="css/menu_l.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	<link rel="stylesheet" type="text/css" href="css/responsive.css" />
	<link rel="stylesheet" type="text/css" href="css/form.css">
	<h1 style="color: blue;"> your request has been processed.. please confirm details</h1>
	<table border="2px solid black" width="100%">
	<tr><td>name of passenger</td><td>pickup location</td><td>Dropoff location</td><td>type of service</td><td>train name</td><td>Journey date</td><td>Number of tickets</td></tr>
	<%CumulativeBean cb=new CumulativeBean();
	cb=(CumulativeBean)session.getAttribute("obj");
	String name=cb.getName();
	String pick=cb.getPick();
	String drop=cb.getDrop();
	String type=cb.getType();
	String tname=cb.getTname();
	String jdate=cb.getTdate();
	String number=cb.getNumber();
	%>
		
		<tr><td><%=name %></td><td><%=pick %></td><td><%=drop %></td><td><%=type %></td><td><%=tname %></td><td><%=jdate %></td><td><%=number %></td><td><a href="Invoice.jsp">Confirm</a></tr>
	
	
	</table>
	

</body>
</html>
</head>	
<body>