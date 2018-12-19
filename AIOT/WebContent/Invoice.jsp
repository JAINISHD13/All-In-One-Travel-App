<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.Bean.CumulativeBean"%>
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
  
<table width="90%" >
<%
	Date d1=new Date();
Calendar c1=Calendar.getInstance();
d1=c1.getTime();

%>
<h3><center>Cumulative Invoice</center></h3>
<h4><form action="Invoicedown.jsp"><input type="submit" value="download"></form></h4>
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
<tr><td><b>Name of passenger:</b> <pre>    <%=name %></pre></td><td><b>date and time:</b><pre>    <%=jdate %></pre></td></tr>
<tr><td><b>pickup location:</b><pre> <%=pick %></td></pre><td><b>dropoff location:</b><pre>   Kalupur Railway Station, Laxmi Bazar, Ahmedabad, Gujarat, India</pre></td></tr>
<tr><td><b>pickup location:</b><pre><%=stn %></pre> </td><td><b>dropoff location:</b><pre>   <%=drop %></pre></td></tr>
<tr><td><b>service type:</b><pre>  <%=type %></pre></td><td><b>number of kms and duration(in minutes):</b><pre>   <%=dist %>kms   <%=time %>mins</pre></td></tr>
</table>
<br><br>
	<table  width=90% align="center">
	<tr><td><b>FARE OF TRAIN:</b></td><td><%=fare %></td></tr>
	<tr><td><b>TAX:4%</b></td><td><%=f *0.04%></td></tr>
	<tr><td><b>FARE OF SERVICE</b></td><td><%=temp%></td></tr>
	<tr><td><b>COST OF TIME SPENT IN TAXI</b></td><td><%=tim %></td></tr>
	<tr><td><b>CAB/AUTO rate are to be paid on the spot</b></td>
	<tr><td><b>GROSS</b></td><td><%=Math.round(total)%></td>
	</table>
	
	<!--Footer-->
  <div id="foot">
  <div id="footer">
    <div class="container">
      <div class="sections">
        <h5>Useful Links</h5>
        <div class="links">
          <ul class="main_nav">
            <li><a href="index_f.jsp">Home</a></li>
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

