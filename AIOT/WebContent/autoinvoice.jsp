<%@page import="com.Bean.autoBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Bean.TaxiBean"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<title>Taxi Booking</title>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
       <link rel="icon" type="image/x-icon" href="favicon.ico" />

	<link rel="stylesheet" type="text/css" href="css/menu_style.css" />
	<link rel="stylesheet" type="text/css" href="css/menu_l.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	<link rel="stylesheet" type="text/css" href="css/responsive.css" />
	<link rel="stylesheet" type="text/css" href="css/form.css">
	<style>
	table,th,tr,td{
		border-collapse:collapse;
		border: 1px solid black;
		
	}
	table{
		margin-left:5%;
		margin-right:5%;
	}
	</style>
</head>	
<body>


	<div id="wrap"> 
	<%
		
		String uname=(String)session.getAttribute("username");
			
			
		%>
  <!-- HEADER -->
  <div id="header">
    <div class="container"> <a href="index.html" class="logo"><img src="images/logo.png" alt="" border="0" /></a>
      <div class="nav">
        <ul class="main_nav">
        	<%if(uname!=null)
		{
			%>
          <li><a class="sel" href="Index_f.jsp">Home</a></li>
          <%}else{
        	  %>
        	<li><a class="sel" href="index.html">Home</a></li>
        	<%} %>
        	  
          <li><a href="#">Booking</a>
			<ul>
				<%if(uname!=null)
		{
					//session2.setAttribute("ans2", "true");
			%>
				<li><a href="taxi_booking_f.jsp">Taxi Booking</a></li>
				<li><a href="auto_booking_f.jsp">Auto Booking</a></li>
				
				<%}else{
        	  %>
        	  <li><a href="taxi_booking_l.html">Taxi Booking</a></li>
				<li><a href="auto_booking_l.html">Auto Booking</a></li>
				
				<%} %>
			</ul>
		</li>
		
          <%if(uname!=null)
		{
			%>
          <li><a href="Cumulative.jsp">C-Ticket</a></li>
          <%}else{
        	  %>
        	<li><a href="login.html">C-Ticket</a></li>
        	<%} %>
          <li><a href="contact.html">contact&nbsp;us</a></li>
		  <li class="lgout">
					<label class="lb"><%=uname %></label>
				<div class="logout">
					<a href="login.html">Log Out</a>
					
				</div>
		  </li>
        </ul>
      
	</div>
  </div>
  
  <!--sub menu--> 
      <a class="menu" href="#." id="menu_btn"  ><img src="images/menu.jpg" alt="" border="0" /></a>
      <div class="clear"></div>
      <div class="sub_nav">
        <ul id="sub_menu" style="display:none;">
			<li><a href="booking.html">Booking</a>
			  <%if(uname!=null)
		{
			%>
			<li><a class="sub" href="taxi_booking_f.jsp">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking_f.jsp">Auto Booking</a></li>
			
			<%}%>
			</li>
		<div class="clr"></div>
		</ul>
	</div>
	<!-- sub menu END -->
  <!-- HEADER END -->
<table border="1px" >
<%

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
double total=Math.round(fare+(fare*0.04));
%>
<h3><form action="autoinvoicedown.jsp"><input type="submit" value="download receipt"></form></h3>
<tr><td>Invoice number:123456</td><td>Invoice date:<%=d1%></td><td>pnr:pndsadh</td></tr>
<br><br>
<tr><td>AIOT<br>ADDRESS</td><td>Invoice </td><td>&nbsp;</td></tr>
</table>
<br><br>
<h2 style="margin-left:5%;">Passenger details</h2>
<table >
<tr><td><b>Name of passenger:</b><pre>   <%=name %></pre></td><td><b>date and time:</b><pre>   <%=jdate %></pre></td></tr>
<tr><td><b>pickup location:</b><pre>   <%=ploc %></pre></td><td>dropoff location: <%=dloc %></td></tr>
<tr><td><b>time in minutes:</b><pre>  <%= min%></pre></td><td><b>number of kms:</b><pre>   <%=kms %>kms</pre> </td></tr>
</table>
<br><br>
<table>
	
	<tr><td><b>FARE:</td></b><pre><td><%=fare %></</td></pre></tr>
	<tr><td><b>TAX:4%</td></b><pre><td><%=fare *0.04%></td></pre></tr>
	<tr><td><b>CAB/AUTO rate are to be paid on the spot</b></td>
	<tr><td><b>GROSS</td></b><pre><td><%=total %></pre></td>
	</table>
		<!--Footer-->
  <div id="foot">
  <div id="footer">
    <div class="container">
      <div class="sections">
        <h5>Useful Links</h5>
        <div class="links">
          <ul class="main_nav">
            <li><a href="index_l.html">Home</a></li>
            <li><a href="#">Booking</a>
			<ul class="f_sub">
				 <%if(uname!=null)
		{
			%>
			<li><a class="sub" href="taxi_booking_f.jsp">Taxi Booking</a></li>
			<li><a class="sub" href="mapapiauto.html">Auto Booking</a></li>
			
			<%}else{ %>
			<li><a class="sub" href="taxi_booking.html">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking.html">Auto Booking</a></li>
			
			<%} %>
			</ul>
			</li>
             <%if(uname!=null)
		{
			%>
          <li><a href="Cumulative.html">C-Ticket</a></li>
          <%}else{
        	  %>
        	<li><a href="login.html">C-Ticket</a></li>
        	<%} %>
          </ul>
        </div>	
      </div>
	  
      <div class="sections">
        <h5>About Us</h5>
        <div class="about">
          <p>We are here for making people's life easy and for Better Time Management</p>
          <img src="images/fotter_about.jpg" alt="" /> </div>
      </div>
      <div class="sections form">
        <h5>Contact Form</h5>
        <div id="footer_return_message"></div>
        <div class="form">
          <input name="f_name" id="f_name" type="text" placeholder="Name*"/>
          <input name="f_email" id="f_email" type="text" placeholder="Email*"/>
          <textarea name="f_message" id="f_message" cols="" rows="">Message*</textarea>
          <div class="clear"></div>
          <a class="org_btn more" id="footer_submit" href="#>">submit</a> </div>
      </div>
      <div class="sections last">
        <h5>Get in  Touch</h5>
        <div class="get_touch">
          <ul>
            <li class="phone">(+91)9662706776</li>
            <li class="time">Mon - Sat  9:00am - 6:00 pm</li>
            <li class="email"><a href="#.">support@AIOT.com</a></li>
            <li class="globe"><a href="#.">www.AllinOneTravelapp.com</a></li>
            <li class="address">Vishwakarma Government Engineering College - 123456</li>
          </ul>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div class="footer_bot">
      <div class="container">
        <p>Copyright &copy; 2016 AIOT Design. All right reserved. Powered by <a href="#.">Langoorian Coders Team</a></p>
        <div class="social_icons"> <a href="https://en-gb.facebook.com/login/" class="fb"></a> <a href="https://twitter.com/login?lang=en" class="tw"></a> <a href="https://accounts.google.com/ServiceLogin?hl=en_US&ltmpl=sso&passive=true&service=youtube&uilel=3#identifier" class="yt"></a> <a href="https://plus.google.com/collections/featured" class="gp"></a></div>
      </div>
    </div>
  </div>
  </div>
  <!--ENd Footer--> 
</html>