<%@page import="server.dt_tm" %>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from validthemes.com/themeforest/medihub/about-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 06 Oct 2019 09:02:37 GMT -->
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="MediHub - Medical & Health Template">

    <!-- ========== Page Title ========== -->
    <title>Clinic Appointment</title>
    
    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet"> 

</head>

<body>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
    <%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%>

    <jsp:include page="header.jsp"></jsp:include>
    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/5.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Clinic Appointment</h1>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
    
      <%
	    String type=request.getParameter("t1").trim();
		String id=request.getParameter("id").trim();
		String dt=request.getParameter("date").trim();
		String fees=request.getParameter("fees").trim();
		String dys=request.getParameter("days").trim();
		String days[]=(request.getParameter("days").trim()).split("/");
		int d = java.time.LocalDateTime.now().getDayOfWeek().getValue();
		String day;
		
		if(dt.equalsIgnoreCase("today"))
		{
			dt=java.time.LocalDate.now().toString();
		}
		else if(dt.equalsIgnoreCase("tomorrow"))
		{
			dt=java.time.LocalDate.now().plusDays(1).toString();
			d=java.time.LocalDate.now().plusDays(1).getDayOfWeek().getValue();
			
		}
		else
		{
			dt=java.time.LocalDate.now().plusDays(2).toString();
			d=java.time.LocalDate.now().plusDays(2).getDayOfWeek().getValue();
		}
    %>
    

    <!-- Start Features
    ============================================= -->
    <div class="features-area default-padding bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-6 appoinment">
                    <div class="appoinment-box">
                        <div class="heading">
                            <h4>Make an Appointment</h4>
                            <h2>CLINIC VISIT</h2>
                        </div>
                        <form action="ClinicAppointment.jsp" method="post" >
                        	<input type="hidden" name="docid" value="<%out.println(id);%>" >
                        	<input type="hidden" name="date" value="<%out.println(dt);%>" >
                        	<input type="hidden" name="fees" value="<%out.println(fees);%>" >
                        	<input type="hidden" name="days" value="<%out.println(dys);%>" >
                        	<input type="hidden" name="day" value="<%out.println(d); %>">
                        	<b style="color:blue;">Already have Patient id ? <input type="submit" value="CLICK HERE" style="background-color:white;padding:0px;border:none;"><br></b>
                        </form>
                        <form action="ClinicAppointmentSubmit.jsp" method="post" name="clinicApp">
                        	<input type="hidden" name="docid" value="<%out.println(id);%>" >
                        	<input type="hidden" name="date" value="<%out.println(dt);%>" >
                        	<input type="hidden" name="fees" value="<%out.println(fees);%>" >
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
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select name="gender" id="gender">
                                        	<option value="gen">Gender *</option>
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                            <option value="3">Other</option>
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
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="diseases" name="diseases" placeholder="Diseases *" type="text">
                                        <span style="color:red" id="disErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group comments">
                                        <textarea class="form-control" id="comments" name="comments" placeholder="Tell about your problem *"></textarea>
                                        <span style="color:red" id="comErr"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" name="clinicsub" id="clinicsub">
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

<script src="assets/js/ClinicAppointmentjs.js"></script>

</html>