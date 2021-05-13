<!DOCTYPE html>
<%@page import="Storage.Data"%>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Login Lab</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
	<div class="se-pre-con"></div>
	
	<%
		if(session.getAttribute("lab") != null)
			response.sendRedirect("Lab/index.jsp");
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="banner-area responsive-auto-height text-small" style="height:545px;">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/4.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-7 col-sm-6">
                                    <h1 data-animation="animated slideInRight">Best care for your 
                                    <span> Good health</span></h1>
                                   
                                </div>

                                <!-- Start Login Form -->
                                <div class="col-md-5 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Login </h2>
                                        </div>
                                        <form action="LoginLab" method="post" name="form2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input class="form-control" id="Email" name="Email" placeholder="Email" type="text">
                                                         <span id="errormail" style="color:red"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="Password" name="Password" placeholder="Password" type="password">
                                                      <span id="pswerror" style="color:red">
                                                      
                                                       <%
	                            							String msg;
	                            							msg=request.getParameter("msg");
						                            		if(msg!=null)
						                            		{
						                            			out.println("<center>"+"<font color=red size=3>"+"Invalid userName or password"+"</font>"+"</center>");
						                            		}
					                          		  %>
                                                      
                                                      </span> 
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                  <a href="ForgotLab.jsp"><font size="2px" style="color: black">Forgot Password?</font></a>
                                                </div>
                                                 <!-- <div class="col-md-12">
                                                  <a href="SignupLab.jsp"><font size="2px" style="color: black">New Lab? SignUp</font></a>
                                                </div> -->
                                                <div class="col-md-12">
                                                    <button type="submit" name="login" id="login">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <script src="assets/js/Loginjs.js"></script>
                                </div>
                                <!-- End Login Form -->
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>