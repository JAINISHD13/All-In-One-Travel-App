<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AIOTP</title>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />


<link href="css/pixel_design.css" rel="stylesheet" type="text/css" />
<link href="fonts/stylesheet.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/menu_style.css" />
<link rel="stylesheet" type="text/css" href="css/cumulative.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/responsive.css" />
<!-- custom CSS -->
<link href="css/flexslider.css" media="screen" rel="stylesheet" type="text/css">
<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="css/rs-plugin/css/settings.css" media="screen" />
<!-- CSS STYLE -->
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/form.css">


</head>

<body>
<div id="wrap"> 
  
  <!-- HEADER -->
  <%
	String uname=(String)session.getAttribute("uname");

  %>
  <div id="header">
    <div class="container"> <a href="index.html" class="logo"><img src="images/logo.png" alt="" border="0" /></a>
      <div class="nav">
        <ul class="main_nav">
        	<%if(uname!=null)
		{
			%>
          <li><a class="sel" href="index_f.jsp">Home</a></li>
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
				<li><a href="train_booking_f.jsp">Train Booking</a></li>
				<li><a href="Bus_booking_f.jsp">Bus Booking</a></li>
				<%}else{
        	  %>
        	  <li><a href="taxi_booking_l.html">Taxi Booking</a></li>
				<li><a href="auto_booking_l.html">Auto Booking</a></li>
				<li><a href="train_booking_l.html">Train Booking</a></li>
				<li><a href="bus_booking_l.html">Bus Booking</a></li>
				<%} %>
			</ul>
		</li>
		
          <%if(uname!=null)
		{
			%>
          <li><a href="cumulative.html">C-Ticket</a></li>
          <%}else{
        	  %>
        	<li><a href="c_login.html">C-Ticket</a></li>
        	<%} %>
          <li><a href="contact_l.html">contact&nbsp;us</a></li>
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
			<li><a class="sub" href="taxi_booking.html">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking.html">Auto Booking</a></li>
			<li><a class="sub" href="#">Train Booking</a></li>
			<li><a class="sub" href="#">Bus Booking</a></li>
			</li>
		<div class="clr"></div>
		</ul>
	</div>
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
			<li><a class="sub" href="train_booking_f.jsp">Train Booking</a></li>
			<li><a class="sub" href="Bus_booking_f.jsp">Bus Booking</a></li>
			<%}else{ %>
			<li><a class="sub" href="taxi_booking.html">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking.html">Auto Booking</a></li>
			<li><a class="sub" href="train_booking.html">Train Booking</a></li>
			<li><a class="sub" href="bus_booking.html">Bus Booking</a></li>
			<%} %>
			</li>
		<div class="clr"></div>
		</ul>
	</div>
	<div class="form-style-5">
	<form action="Cum_auto_cont" method="post">
	<fieldset>
	<legend>Auto Booking</legend>
	<input type="date" name="adate" placeholder="Date Of Journey *" required="required">
	<input type="time" name="atime" placeholder="Time *" required="required">
	<textarea name="apol" placeholder="PickUp Location" cols="40" rows="5" required="required"></textarea>
	<textarea name="adol" placeholder="Drop-off Location" cols="40" rows="5" required="required"></textarea>
	</fieldset>

	<input type="submit" value="do more bookings"  name="more" />
	<div class="reset">
		<input type="reset" name="reset" value="Reset all">
	</div>
	<input type="submit" value="Generate Ticket" name="more"/>
	</form>
	</div>
	
  
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
			<li><a class="sub" href="auto_booking_f.jsp">Auto Booking</a></li>
			<li><a class="sub" href="train_booking_f.jsp">Train Booking</a></li>
			<li><a class="sub" href="Bus_booking_f.jsp">Bus Booking</a></li>
			<%}else{ %>
			<li><a class="sub" href="taxi_booking.html">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking.html">Auto Booking</a></li>
			<li><a class="sub" href="train_booking.html">Train Booking</a></li>
			<li><a class="sub" href="bus_booking.html">Bus Booking</a></li>
			<%} %>
			</ul>
			</li>
             <%if(uname!=null)
		{
			%>
          <li><a href="cumulative.html">C-Ticket</a></li>
          <%}else{
        	  %>
        	<li><a href="c_login.html">C-Ticket</a></li>
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

	
</body>
</html>