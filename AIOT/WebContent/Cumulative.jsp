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
</head>	
<body>
<%
  	String uname=(String)session.getAttribute("username");
System.out.println("in jsp");
System.out.println(uname);
  %>

	<div id="wrap"> 
  <!-- HEADER -->
  <div id="header">
    <div class="container"> <a href="index.html" class="logo"><img src="images/logo.png" alt="" border="0" /></a>
      <div class="nav">
        <ul class="main_nav">
          <li><a class="sel" href="index_f.jsp">Home</a></li>
          <li><a href="#">Booking</a>
			<ul>
				<% if(uname!=null){%>
				<li><a href="taxi_booking_f.jsp">Taxi Booking</a></li>
				<li><a href="auto_booking_f.jsp">Auto Booking</a></li>
				<%} %>
			</ul>
		</li>
          <li><a href="Cumulative.jsp">C-Ticket</a></li>
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
			<li><a class="sub" href="taxi_booking_f.jsp">Taxi Booking</a></li>
			<li><a class="sub" href="auto_booking_f.jsp">Auto Booking</a></li>
			
			</li>
		<div class="clr"></div>
		</ul>
	</div>
	<!-- sub menu END -->
  <!-- HEADER END -->
  
  	<%if(uname!=null){ %>
  	<div class="form-style-5">
	<form action="cumController" method="post">
	<fieldset>
  	<legend>Cumulative booking</legend>
  	<input type="text" name="email" placeholder="Your email*" required="required">
  	<input type="text" name="contact" placeholder="Contact Number *" required="required">
	
	
	<h3>Type of Service</h3>
	<p><input type="radio" name="type" value="cab">
	Cab(3-4 persons)
	</p>
	<p><input type="radio" name="type" value="suv">
	SUV(6-7 persons)
	</p>            
	<p><input type="radio" name="type" value="sedan">    
	Sedan (2-3 persons)
	</p>
	<p><input type="radio" name="type" value="auto">    
	auto-rickshaw
	</p>
	<input type="date" name="tdate" placeholder="Date Of Journey for train *" required="required">
	<p>Select train</p>
        <select name="ttype">
            <option value="amd-mum">Ahmedabad to mumbai(8:00 am)</option>
            <option value="amd-hyd">Ahmedabad to Hyderabad(11:00 am)</option>
            <option value="amd-del">Ahmedabad to Delhi(2:00 pm)</option>
            <option value="amd-ban">Ahmedabad to Banglore(9:00 pm)</option>
            
        </select>
        <input type="text" name="number" placeholder="number of tickets" required="required">
        
       
        
        <input type="submit" name="submit" value="submit">
	</fieldset>
  	</form>
  	<%}else{ response.sendRedirect("login.html");}%>
  	
  </div>
  <!--Footer-->
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
				<li><a href="taxi_booking_f.jsp">Taxi Booking</a></li>
				<li><a href="auto_booking_f.jsp">Auto Booking</a></li>
				
			</ul>
			</li>
            <li><a href="Cumulative.jsp">C-Ticket</a></li>
			<li><a href="contact.html">Contact us</a></li>
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
            <li class="address">Vishwakrma Government Engineering College - 123456</li>
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