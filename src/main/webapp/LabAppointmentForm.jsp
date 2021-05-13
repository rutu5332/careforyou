<%@page import="server.dt_tm"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="widath=device-widath, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Lab Appointment Form</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet"> 

</head>

<body>

	<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%>


    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->

    <jsp:include page="header.jsp"></jsp:include>
    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/lab7.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Test Appointment</h1>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
    
     <%
     
	    /* String type=request.getParameter("t1");*/
		String id=request.getParameter("tid"); 
		//System.out.println("id : "+id);
		//String i=request.getParameter("i");
		String dat=request.getParameter("date");
		String dys=request.getParameter("days").trim();
		//String fees=request.getParameter("fees");
		//System.out.println(request.getParameter("days"));
		String days[]=(request.getParameter("days").trim()).split("/");
		int d = java.time.LocalDateTime.now().getDayOfWeek().getValue();
		if(dat.equalsIgnoreCase("today"))
		{
			dat=java.time.LocalDate.now().toString();

		}
		else if(dat.equalsIgnoreCase("tomorrow"))
		{
			dat=java.time.LocalDate.now().plusDays(1).toString();
			d=java.time.LocalDate.now().plusDays(1).getDayOfWeek().getValue();
			
		}
		else if(dat.equalsIgnoreCase("next2"))
		{
			dat=java.time.LocalDate.now().plusDays(2).toString();
			d=java.time.LocalDate.now().plusDays(2).getDayOfWeek().getValue();
			
		}
		else if(dat.equalsIgnoreCase("next3"))
		{
			dat=java.time.LocalDate.now().plusDays(3).toString();
			d=java.time.LocalDate.now().plusDays(3).getDayOfWeek().getValue();
			
		}
		else 
		{
			dat=java.time.LocalDate.now().plusDays(4).toString();
			d=java.time.LocalDate.now().plusDays(4).getDayOfWeek().getValue();
		}
		//System.out.println(d + "\tdate : "+dat);
    %>
    

    <!-- Start Features
    ============================================= -->
    <div class="features-area default-padding bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-6 appoinment">
                    <div class="appoinment-box">
                        <div class="heading">
                            <h4>Make an Appointment For Test</h4>
                            
                        </div>
                        <form action="LabAppointment.jsp" method="post" >
                        	<input type="hidden" name="testid" value="<%out.println(id);%>" >
                        	<input type="hidden" name="date" value="<%out.println(dat);%>" >
                        	<input type="hidden" name="days" value="<%out.println(dys);%>" >
                        	<input type="hidden" name="day" value="<%out.println(d); %>">
                        	<b style="color:blue;">Already have Patient id ? <input type="submit" value="CLICK HERE" style="background-color:white;padding:0px;border:none;"><br></b>
                        </form>
                        <form action="LabAppointmentSubmit.jsp" method="post" name="testApp" id="testApp">
                        	<input type="hidden" name="testid" value="<%out.println(id);%>" > 
                        	<input type="hidden" name="date" value="<%out.println(dat);%>" > 
                        	
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="fname" name="fname" placeholder="First Name *" type="text">
                                        <span style="color:red" id="fnmErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="lname" name="lname" placeholder="Last Name *" type="text">
                                        <span style="color:red" id="lnmErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="phone" name="phone" placeholder="Phone *" type="text">
                                        <span style="color:red" id="phnErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="age" name="age" placeholder="Age *" type="text">
                                        <span style="color:red" id="ageErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group comments">
                                        <textarea class="form-control" id="address" name="address" placeholder="Address *"></textarea>
                                        <span style="color:red" id="addErr"></span>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select id="gender" name="gender">
                                        	<option value="gen">Gender *</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                        <span style="color:red" id="genErr"></span>
                                    </div>
              
                                </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                        <select id="time" name="time">
                                        	<option value="time">--Select Time--</option>
                                         <%
	                                        	dt_tm tmd = new dt_tm();
			                                    String print = tmd.get_timeslot(days, d);
			                                    //System.out.println(print);
			                    				String tms[] = print.split("/");
		                    					if (tms.length == 1) {
		                    						out.println("<option value=\"no\">----No slots Available---- </option>");
		                    					} else {
		                    						for (int i = 0; i < tms.length; i++) {
		                    							out.println("<option value=\""+tms[i]+"\"> "+ tms[i] + "</option>");
		                    						}
		                    					} 
                                        %> 
                                        </select>
                                        <span style="color:red" id="timeErr"></span>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                      	<input class="form-control" id="email" name="email" placeholder="Email *" type="text">
                                      	<span style="color:red" id="emailErr"></span>  
                                    </div>
                                </div>
                                <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="diseases" name="diseases" placeholder="Diseases *" type="text">
                                        <span style="color:red" id="disErr"></span>
                                    </div>
                                </div> -->
                                <!-- <div class="col-md-12">
                                    <div class="form-group comments">
                                        <textarea class="form-control" id="comments" name="comments" placeholder="Tell about your problem *"></textarea>
                                        <span style="color:red" id="comErr"></span>
                                    </div>
                                </div> -->
                                <div class="col-md-12">
                                    <button type="submit" name="test-sub" id="test-sub">
                                        Book Appointment <i class="fa fa-paper-plane"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6 features-items">
                    <ul>
                        <li>
                            <div class="icon">
                                <i class="flaticon-pharmacy"></i>
                            </div>
                            <div class="info">
                                <h4>Advanced Technology</h4>
                                <p>
                                    Principle oh explained excellent do my suspected conveying in. Excellent you did therefore perfectly supposing described. 
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="icon">
                                <i class="flaticon-medicine"></i>
                            </div>
                            <div class="info">
                                <h4>Healthcare Solutions</h4>
                                <p>
                                    Principle oh explained excellent do my suspected conveying in. Excellent you did therefore perfectly supposing described. 
                                </p>
                            </div>
                        </li>
                        
                    </ul>
                 
                </div>
            </div>
        </div>
    </div>
    <!-- End Features -->


   
<jsp:include page="footer.jsp"></jsp:include>
    


</body>

<script src="assets/js/TestAppointmentjs.js"></script>
</html>