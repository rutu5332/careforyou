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
    <title>About Us</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
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
                            Offering three facilities on one platform : Doctor , Pathology Lab , Pharmacy
                            <br>Top level of doctors  , Equipped lab and medicines are available. 
                        </p>
                    </div>
                    <ul>
                        <li>
                            <div class="info">
                                <h4>Equipped Pathology Lab</h4>
                                <p>
                                   Lab is Equipped with all new technologies. 
                                   Our mission is to provide affordable diagnostic to more and more pepole. 
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>Top Level Doctors</h4>
                                <p>
                                     When you need doctor,Best doctors can help. <br>Get Medical opinion of
                                     our specialized doctors.
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>Dedicated patient care</h4>
                                <p>
                                     All doctor shows their dedication to all patients.
                                     Patient will feel safe in their hands. Doctors treat 
                                     patient with dignity and respect.
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="info">
                                <h4>Generic Medicines</h4>
                                <p>
                                    We provide generic medicines that contain same
                                    chemical substane as drug that was originally protected by chemical patents.
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Why Chose Us --> 	
    
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>