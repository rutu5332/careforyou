
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
   <title>Change Password</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

  

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>
<body>
	<div class="se-pre-con"></div>
	
	<%
	if(session.getAttribute("doctor") == null)
		response.sendRedirect("../LoginDoctor.jsp");
	%>
	<jsp:include page="headerdc.jsp"></jsp:include>
	
	<div class="banner-area responsive-auto-height text-small" style="height:545px;">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/15.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-7 col-sm-6">
                                    <h1 data-animation="animated slideInRight">Best care for your <span> Good health</span></h1>
                                    <p data-animation="animated slideInUp">
                                        
                                    </p>
                                   <!--  <a data-animation="animated slideInUp" class="btn btn-light border btn-md" href="#">View Details</a> -->
                                </div>

                                <!-- Start Appoinment Form -->
                                <div class="col-md-5 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Change Password </h2>
                                        </div>
                                        <form action="Changepswsubmit.jsp" method="post" name="form3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="PasswordOld" name="PasswordOld" placeholder="Old Password" type="password">
                                                      <span id="opswerror"></span> 
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="PasswordNew" name="PasswordNew" placeholder="New Password" type="password">
                                                      <span id="npswerror"></span> 
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="Password" name="Password" placeholder="Confirm Password" type="password">
                                                      <span id="pswerror"></span> 
                                                    </div>
                                                </div>
                                                  <span id="pswerror" style="color:red;">
                                                   <%
	                            							String msg;
	                            							msg=request.getParameter("msg");
						                            		if(msg!=null)
						                            		{
						                            			out.println(msg);
						                            		}
					                          		 %>
                                                 </span> 
                                                
                                                <div class="col-md-12">
                                                    <button type="submit" name="submit" id="submit">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- End Appoinment Form -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/equal-height.min.js"></script>
    <script src="assets/js/jquery.appear.js"></script>
    <script src="assets/js/jquery.easing.min.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/modernizr.custom.13711.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/isotope.pkgd.min.js"></script>
    <script src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="assets/js/count-to.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/bootsnav.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/Loginjs.js"></script>