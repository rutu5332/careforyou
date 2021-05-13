<%@page import="Storage.Data"%>

<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Care for you">

    <!-- ========== Page Title ========== -->
    <title>About us</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

	<!-- Preloader Start -->
	<div class="se-pre-con"></div> 
	<!-- Preloader Ends -->

	<%
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../About.jsp");
	%>

	<jsp:include page="headerlab.jsp"></jsp:include>
	
	 <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/7.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>About Us</h1>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
    
     <!-- Start Services
    ============================================= -->
    <div class="solid-services-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Our <span>Services</span></h2>
                        <!-- <p>
                            We provides doctors , lab and pharmacy.
                        </p> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="services-items">
                   <!-- Single Item -->
                   <%out.println("<a href=\"doctors.jsp\">"); %>
	                    <div class="col-md-4 col-sm-6 equal-height">
	                        <div class="item">
	                            <i class="flaticon-doctor"></i>
	                            <h4>Qualified Doctors</h4>
	                            <ul>
	                                <li>Health care </li>
	                                <li>Dental Care</li>
	                                <li>Skin Care </li>
	                                <li>Many more....</li>
	                            </ul>
	                        </div>
	                    </div>
                    <%out.println("</a>"); %>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <%out.println("<a href=\"lab.jsp\">"); %>
	                    <div class="col-md-4 col-sm-6 equal-height">
	                        <div class="item">
	                            <i class="flaticon-blood-sample"></i>
	                            <h4>Tests</h4>
	                            <ul>
	                                <li>Blood Test</li>
	                                <li>Calcium blood Test</li>
	                                <li>HIV Test</li>
	                                <li>Many more....</li>
	                            </ul>
	                        </div>
	                    </div>
                    <%out.println("</a>"); %>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <%out.println("<a href=\"medicine.jsp\">"); %>
	                    <div class="col-md-4 col-sm-6 equal-height">
	                        <div class="item">
	                            <i class="flaticon-pharmacy"></i>
	                            <h4>Pharmacy</h4>
	                            <ul>
	                                <li>Medicines</li>
	                                <li>Health products</li>
	                                <li>Baby Products</li>
	                                <li>Many more....</li>
	                            </ul>
	                        </div>
	                    </div>
                    <%out.println("</a>"); %>
                    <!-- End Single Item -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Services -->
    
    <!-- Start Why Chose Us 
    ============================================= -->
    <div class="chose-us-area item-half">
        <div class="container-full">
            <div class="row">
                <div class="col-md-6 thumb bg-cover" style="background-image: url(assets/img/banner/4.jpg);"></div>
                <div class="col-md-6 info">
                    <div class="heading">
                        <h2>Why Chose us</h2>
                        <p>
                            Offering confined entrance no. Nay rapturous him see something residence. Highly talked do so vulgar. Her use behaved spirits and natural attempt say feeling. Exquisite mr incommode immediate he something ourselves it of. Law conduct yet chiefly beloved examine village proceed
                        </p>
                    </div>
                    <ul>
                        <li>
                            <div class="info">
                                <h4>Qualified facilities</h4>
                                <p>
                                    Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new. 
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>Top Level Doctors</h4>
                                <p>
                                    Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new. 
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>Dedicated patient care</h4>
                                <p>
                                    Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new. 
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>24/7 Emergency</h4>
                                <p>
                                    Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new. 
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Why Chose Us --> 	
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>