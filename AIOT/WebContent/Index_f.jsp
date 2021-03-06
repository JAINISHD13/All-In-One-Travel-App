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
<link rel="stylesheet" type="text/css" href="css/menu_l.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/responsive.css" />
<!-- custom CSS -->
<link href="css/flexslider.css" media="screen" rel="stylesheet" type="text/css">
<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="css/rs-plugin/css/settings.css" media="screen" />
<!-- CSS STYLE -->
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />



</head>

<body>
<div id="wrap"> 
  
  <!-- HEADER -->
  <%
			String uname=(String)session.getAttribute("username");
			HttpSession session1=request.getSession(false);
			String ans=(String)session1.getAttribute("ans1");
			System.out.println(ans);
			
		%>
  <div id="header">
    <div class="container"> <a href="index.html" class="logo"><img src="images/logo.png" alt="" border="0" /></a>
      <div class="nav">
        <ul class="main_nav">
         	<%if(ans.equals("true"))
		{
			%>
          <li><a class="sel" href="Index_f.jsp">Home</a></li>
          <%}else{
        	  %>
        	            <li><a class="sel" href="index.html">Home</a></li>
        	  <%} %>
          <li><a href="#">Booking</a>
			<ul>
				<%if(ans.equals("true"))
		{
			%>
				<li><a href="mapapi.html">Taxi Booking</a></li>
				<li><a href="mapapiauto.html">Auto Booking</a></li>
				
				<%}else{
        	  %>
        		<li><a href="taxi_booking.html">Taxi Booking</a></li>
				<li><a href="auto_booking.html">Auto Booking</a></li>
				
        	<%} %>
			</ul>
		</li>
		
		<%if(ans.equals("true"))
		{
			System.out.print("in if");
			//response.sendRedirect("Cumulative.jsp");
			%>
          <li><a href="Cumulative.jsp">C-Ticket</a></li>
          <%}%>
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
			<%if(ans.equals("true"))
		{
			%>
				<li><a href="taxi_booking_f.jsp">Taxi Booking</a></li>
				<li><a href="auto_booking_f.jsp">Auto Booking</a></li>
				
				<%}else{
        	  %>
        		<li><a href="taxi_booking.html">Taxi Booking</a></li>
				<li><a href="auto_booking.html">Auto Booking</a></li>
				
        	<%} %>
		<div class="clr"></div>
		</ul>
	</div>
	<!-- sub menu END -->
  <!-- HEADER END --> 
  
  
  <!-- SLIDER -->
  <div class="fullwidthbanner-container">
    <div class="fullwidthbanner">
      <ul>
        
        <!-- FADE -->
        <li data-transition="fade" data-slotamount="10" data-thumb="images/thumbs/thumb1.html"> <img src="images/slides/thumb1.jpg" />
          <div class="caption lft white-b1" data-x="220" data-y="300" data-speed="400" data-start="1700" data-easing="easeOutExpo">BOOK YOUR TICKETS!</div>
          <div class="caption lft black-b1" data-x="95" data-y="345" data-speed="400" data-start="2700" data-easing="easeOutExpo">WITH OUR EXTRA-ORDINARY FEATURES AND SERVICES </div>
        </li>
        
        <!-- SLIDEUP -->
        <li data-transition="slideup" data-slotamount="7" data-thumb="images/thumbs/thumb2.html"> <img src="images/slides/thumb2.jpg" />
        
		 <div class="caption lft" data-x="560" data-y="78" data-speed="4000" data-start="2500" data-easing="easeOutBack"><img src="images/slides/iphone.png" alt="" border="0" /></div>
        
	<!--	<div class="caption lfb" data-x="500" data-y="58" data-speed="900" data-start="1700" data-easing="easeOutBack"><img src="images/slides/web1.jpeg" /></div> -->
          <div class="caption lft gray-b2" data-x="-50" data-y="210" data-speed="600" data-start="1800" data-easing="easeOutExpo">Powerfull Responsive,</div>
          <div class="caption lfb gray-b2" data-x="-50" data-y="260" data-speed="600" data-start="1800" data-easing="easeOutExpo">AND WITH FULLY TIME MANAGABLE APPLICATION</div>
        </li>
        
        <!-- SLIDELEFT -->
        <li data-transition="slideleft" data-slotamount="15" data-thumb="images/thumbs/thumb5.html"> <img src="images/slides/wideimage2.jpg" />
          <div class="caption lft pink-b4" data-x="-50" data-y="180" data-speed="600" data-start="1800" data-easing="easeOutExpo">BUS,AUTO,TAXI,TRAIN</div>
          <div class="caption lfl green-b4" data-x="-50" data-y="222" data-speed="1600" data-start="2400" data-easing="easeOutExpo">BOOK ANY OR OUR EXTRA FEATURE C-BOOK</div>
          <div class="caption lfb blue-b4" data-x="-50" data-y="264" data-speed="2600" data-start="3200" data-easing="easeOutExpo">ENJOY THE JOURNEY TO YOUR DESTINATION LIKE A ROLLING BALL</div>
          <div class="caption lft lcd" data-x="560" data-y="78" data-speed="2000" data-start="1500" data-easing="easeOutBack"><img src="images/slides/lcd.png" alt="" border="0" /></div>
          <div class="caption lft" data-x="500" data-y="223" data-speed="3000" data-start="2000" data-easing="easeOutBack"><img src="images/slides/tablet.png" alt="" border="0" /></div>
          <div class="caption lft" data-x="480" data-y="293" data-speed="4000" data-start="2500" data-easing="easeOutBack"><img src="images/slides/iphone.png" alt="" border="0" /></div>
        </li>
      </ul>
      <div class="tp-bannertimer"></div>
    </div>
  </div>
  <!-- SLIDER END -->
  
  
  <!-- CONTENT -->
  <div class="clear"></div>
  <div id="content">
    <div class="services">
      <div class="container">
        <div class="white_back">
          <div class="service_sec">
            <div class="orange"> <img class="globe" src="images/service_globe.png" alt="" border="0" />
              <h3>Insatant Booking</h3>
              <p>Here you can Book <br />
                Your Ticket without<br />
                    login.</p>
            </div>
            <img class="shadow" src="images/service_shadow.png" alt="" border="0" /> </div>
          <div class="service_sec">
            <div class="pink"> <img class="globe" src="images/service_plane.png" alt="" border="0" />
              <h3>C-Tour Booking</h3>
              <p>Here you can Book your <br />
                whole journey from one<br />
                Destiny to Another with a<br />
				single Ticket.</p>
            </div>
            <img class="shadow" src="images/service_shadow.png" alt="" border="0" /> </div>
          <div class="service_sec">
            <div class="green"> <img class="globe" src="images/service_setting.png" alt="" border="0" />
              <h3>Wallet Pay</h3>
              <p>Through this feature <br />
                you can use your wallet<br />
                for Booking your Tickes.</p>
            </div>
            <img src="images/service_shadow.png" alt="" border="0" /> </div>
          <div class="service_sec last">
            <div class="blue"> <img class="globe" src="images/service_clock.png" alt="" border="0" />
              <h3>24/7 live support</h3>
              <p>Any Complains,Problems <br />
                Occuring during your journey<br />
                we will be always ready to help<br />
					   Help you.</p>
            </div>
            <img src="images/service_shadow.png" alt="" border="0" /> </div>
        </div>
      </div>
    </div>
    <div class="clear"></div>
    <div class="container">
      <div class="our_work">
        <div class="title">
          <h2 class="blue">Our <span class="blue">Agencies</span></h2>
        </div>
        <div id="middle" class="cols2 sidebar_left box_white">
          <div class="content" role="main">
            <article class="post-detail">
              <div class="entry">
                <div class="work-carousel">
                  <div class="work-carousel-head"> <a class="prev" id="work-carousel-prev" href="#"><span>prev</span></a> <a class="next" id="work-carousel-next" href="#"><span>next</span></a> </div>
                  <div class="carousel_content" >
                    <ul id="work-carousel" style="margin:0 0 0 0; margin-left:1px !important;">
                      <li>
                        <div class="work">
                          <div class="main">
                            <div class="view view-seventh"> <img src="images/work_img11.jpg" alt="" border="0" />
                              <div class="mask">
                                <h2>Taxi</h2>
                                <p>Hire your Taxi to Travel to your Destiny.</p>
                                <% if(ans.equals("true"))
							{
								%>
                                <a href="taxi_booking_f.jsp" class="info">BOOK</a> </div>
                                <% }else{ %>
                                <a href="taxi_booking.html" class="info">BOOK</a> </div>
                                <%} %>
                            </div>
                          </div>
                          <p class="port">Taxi</p>
                        </div>
                      </li>
                      <li>
                        <div class="work">
                          <div class="main">
                            <div class="view view-seventh"> <img src="images/work_img22.jpg" alt="" border="0" />
                              <div class="mask">
                                <h2>Auto-Rickshaw</h2>
                                <p>Hire your Auto-Rickshaw to Travel to your Destiny.</p>
 <% if(ans.equals("true"))
							{
								%>
                                <a href="auto_booking_f.jsp" class="info">BOOK</a> </div>
                                <% }else{ %>
                                <a href="auto_booking.html" class="info">BOOK</a> </div>
                                <%} %>                            </div>
                          </div>
                          <p class="port">Auto-Rickshow</p>
                        </div>
                      </li>
                     
         <!--      ---------------------------------------------------------------------------------------------------------  -->             
                      <li>
                        <div class="work">
                          <div class="main">
                            <div class="view view-seventh"> <img src="images/work_img11.jpg" alt="" border="0" />
                              <div class="mask">
                                <h2>Taxi</h2>
                                <p>Hire your Taxi to Travel to your Destiny.</p>
                                <a href="taxi_booking_f.jsp" class="info">BOOK</a> </div>
                            </div>
                          </div>
                          <p class="port">Taxi</p>
                        </div>
                      </li>
                      <li>
                        <div class="work">
                          <div class="main">
                            <div class="view view-seventh"> <img src="images/work_img22.jpg" alt="" border="0" />
                              <div class="mask">
                                <h2>Auto-Rickshow</h2>
                                <p>Hire your Auto-Rickshow to Travel to your Destiny.</p>
                                <a href="auto_booking_f.jsp" class="info">BOOK</a> </div>
                            </div>
                          </div>
                          <p class="port">Auto-Rickshow</p>
                        </div>
                      </li>
                    
					
                      
                      
                    </ul>
                  </div>
                </div>
              </div>
            </article>
          </div>
          <div class="clear"></div>
          <div class="divider-space"></div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
    <div class="clear"></div>
    <div class="testi">
      <div class="container"> <img src="images/happy_client.png" align="" border="0" />
        <div class="clear"></div>
        <p>“We are on the Journey of our C-Ticket of World to Interact with People to our Web application and people's Life Ease. <br />
          Our MOtto is to interact with people,Communicate with people,and Make them our Parmenant Friend as a Customer”</p>
        <!--<span class="name">Jainish Dabhi</span>-->
        <div class="clear"></div>
        <!--<span class="job">CEO/Cofounder</span> --></div>
    </div>
    </div>
  
  <!--Footer-->
  <div id="foot">
  <div id="footer">
    <div class="container">
      <div class="sections">
        <h5>Useful Links</h5>
        <div class="links">
          <ul class="main_nav">
          <%if(ans.equals("true")) {%>
            <li><a href="index_f.jsp">Home</a></li>
            <%}else{ %>
            <li><a href="index.html">Home</a></li>
            <%} %>
            <li><a href="#">Booking</a>
			<ul class="f_sub">
				<%if(ans.equals("true")) {%>
				<li><a href="taxi_booking_f.jsp">Taxi Booking</a></li>
				<li><a href="auto_booking_f.jsp">Auto Booking</a></li>
				
				<%}else{ %>
				<li><a href="taxi_booking.html">Taxi Booking</a></li>
				<li><a href="auto_booking.html">Auto Booking</a></li>
				
				<%} %>
			</ul>
			
			<%if(ans.equals("true"))
		{
			%>
          <li><a href="Cumulative.jsp">C-Ticket</a></li>
          <%}else{
        	  %>
        	<li><a href="c_login.html">C-Ticket</a></li>
        	<%} %>
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


<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/libs/jquery.min.js"></script>

<!-- jQuery KenBurn Slider  -->
<script type="text/javascript" src="css/rs-plugin/js/jquery.plugins.min.js"></script>
<script type="text/javascript" src="css/rs-plugin/js/jquery.revolution.min.js"></script>
<!-- carousel -->
<script src="js/jquery.carouFredSel.packed.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>
<!-- lightbox prettyPhoto -->
<script type="text/javascript" charset="utf-8">
  
    $(window).load(function() {
      $('.tf-header-slider').flexslider({
        animation: "fade",
        maxItems: 11,
        controlNav: true
      });
    });
    
    $(window).load(function() {
      $('.tf-work-carousel').flexslider({
        animation: "slade",
        animationLoop: false,
        itemWidth: 280,
        itemMargin: 30,
        move: 1,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
    
    $(window).load(function() {
      $('.tf-footer-carousel').flexslider({
        animation: "slide",
        animationLoop: true,
        itemWidth: 140,
        itemMargin: 15,
        minItems: 1,
        maxItems: 6,
        move:1
      });
    });
    
    jQuery(document).ready(function($) {
				$('#work-carousel').carouFredSel({
					next : "#work-carousel-next",
					prev : "#work-carousel-prev",
					auto: false,
					circular: false,
					infinite: true,	
					width: '100%',		
					scroll: {
						items : 1					
					}		
				});
			});
  </script>

<!--drop menu-->
<script language="javascript">
		$(document).ready(function() {
			$("#menu_btn").click(function(){
			$("#sub_menu").slideToggle("slow");
		  });
		});
</script>

<script language="javascript">
			
			$(document).ready(function() {
			$("#menu_btn").click(function(){
			$("#sub_menu").slideToggle("slow");
		  });
		});
			
		  //Contact us form validation
		  $('#return_message').hide();
		  $('#submit').click(function(event){
			  
			  var name = $('#name').val();
			  var phone = $('#phone').val();
			  var email = $('#email').val();
			  var message = $('#message').val();
			  
			  if( (name=='') || (phone=='') || (email=='') || (message=='') )
			  {
				  $('#name').addClass('error_active');
				  $('#phone').addClass('error_active');
				  $('#email').addClass('error_active');
				  $('#message').addClass('error_active');
			  }
			  else
			  {
				  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				  
				  if(!regex.test(email)) 
				  {
					 alert("Please Enter valid email address"); 
					 $('#email').addClass('error_active');
				  }
				  else
				  {
					 
					 
					$.ajax(
					{
						type: 'POST',
						data: ({name : name, phone : phone, email : email, message : message}),
						url: 'send_mail.php',
						success: function(data)
						{
							
							if(data)
							{
								$('#return_message').show('slow').html("<p>Email has been sent...</p>");
								
								$('#name').val('');
							    $('#phone').val('');
							    $('#email').val('');
							    $('#message').val('');
								
								 $('#name').removeClass('error_active');
							     $('#phone').removeClass('error_active');
							     $('#email').removeClass('error_active');
							     $('#message').removeClass('error_active');
							}
							else
							{
								$('#return_message').show('slow').html("<p>Email has not been sent...</p>");
							}
						}
      				});				 
				  }
			  }
			  });
			  
			  
			  
			  
		  //footer form validation
		  $('#footer_return_message').hide();
		  $('#footer_submit').click(function(event){
			  
			  var name = $('#f_name').val();
			  var email = $('#f_email').val();
			  var message = $('#f_message').val();
			  
			  if( (name=='') || (email=='') || (message=='') || (message=='Message*'))
			  {
				  $('#f_name').addClass('error_active');
				  $('#f_email').addClass('error_active');
				  $('#f_message').addClass('error_active');
			  }
			  else
			  {
				  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				  
				  if(!regex.test(email)) 
				  {
					 alert("Please Enter valid email address"); 
					 $('#f_email').addClass('error_active');
				  }
				  else
				  {
					 
					 
					$.ajax(
					{
						type: 'POST',
						data: ({name : name, email : email, message : message}),
						url: 'send_mail.php',
						success: function(data)
						{
							
							if(data)
							{
								$('#footer_return_message').show('slow').html("<p>Email has been sent...</p>");
								
								$('#f_name').val('');
							    $('#f_email').val('');
							    $('#f_message').val('');
								
								 $('#f_name').removeClass('error_active');
							     $('#f_email').removeClass('error_active');
							     $('#f_message').removeClass('error_active');
							}
							else
							{
								$('#footer_return_message').show('slow').html("<p>Email has not been sent...</p>");
							}
						}
      				});				 
				  }
			  }
			  });
		});
</script>

<script type="text/javascript">
								
				var tpj=jQuery;
				tpj.noConflict();
				
				tpj(document).ready(function() {
				
				if (tpj.fn.cssOriginal!=undefined)
					tpj.fn.css = tpj.fn.cssOriginal;

					tpj('.fullwidthbanner').revolution(
						{	
							delay:9000,												
							startwidth:890,
							startheight:450,
							
							onHoverStop:"on",						// Stop Banner Timet at Hover on Slide on/off
							
							thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
							thumbHeight:50,
							thumbAmount:4,
							
							hideThumbs:200,
							navigationType:"both",					//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
							navigationArrows:"verticalcentered",		//nexttobullets, verticalcentered, none
							navigationStyle:"round",				//round,square,navbar
							
							touchenabled:"on",						// Enable Swipe Function : on/off
							
							navOffsetHorizontal:0,
							navOffsetVertical:20,
							
							fullWidth:"on",
							
							shadow:0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)
														
						});	
					
					
					
						
			});
</script>
</body>

</html>
