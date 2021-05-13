<%@page import="Storage.Data" %>
<%
		Data dt=new Data();	
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="MediHub - Medical & Health Template">


    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">
    
    <!-- ========== Start Stylesheet ========== -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/flaticon-set.css" rel="stylesheet" />
    <link href="assets/css/magnific-popup.css" rel="stylesheet" />
    <link href="assets/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="assets/css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />
    <link href="assets/css/bootsnav.css" rel="stylesheet" />
    <link href="assets/css/product.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet" />
    <!-- ========== End Stylesheet ========== -->

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

	 <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
    <%
		if(session.getAttribute("docid") == null)
			response.sendRedirect("../index.jsp");
	%> 
	
	<%
		String did="";
		if(session.getAttribute("docid") != null)
			did=session.getAttribute("docid").toString();
		dt.st=dt.cn.createStatement();
		String select="select * from notification_tbl where vNotificationTo like 'doctor' && eStatus='A' && iId="+did +" order by iNotificationId desc" ;
		dt.rs=dt.st.executeQuery(select);
		int cnt=0;
		while(dt.rs.next())
			cnt++;
	%>
	
    <!-- Start Header Top 
    ============================================= -->
    <div class="top-bar-area inline inc-border">
        <div class="container">
            <div class="row">
                <div class="col-md-8 address-info text-left">
                    <div class="info box">
                        <ul>
                            <li>
                                <a href="mailto:care4you2019@gmail.com"><i class="fas fa-envelope-open"></i> care4you2019@gmail.com</a>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>+91 8460102781
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 bar-btn text-right">
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top -->

     <!-- Header 
    ============================================= -->
    <header id="home">

        <!-- Start Navigation -->
        <nav class="navbar navbar-default attr-border navbar-sticky bootsnav">

            <!-- Start Top Search -->
            
            <!-- End Top Search -->

            <div class="container">

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    
                </div>        
                <!-- End Atribute Navigation -->

                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="index.html">
                        <img src="assets/img/logo.png" class="logo" alt="Logo">
                    </a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                   <ul class="nav navbar-nav navbar-right" data-in="#" data-out="#">
                     
                         <%
                        	 dt.st=dt.cn.createStatement();
                 			String sql_menu = "select * from menudc_tbl";
                 		 	dt.rs=dt.st.executeQuery(sql_menu);
                        	while(dt.rs.next())
                        	{
                        		String mnm=dt.rs.getString("menu_name");
                        		String site=dt.rs.getString("menu_link");
                        		//int sub = Integer.parseInt(dt.rs.getString("menu_sub"));
                        		String stat=dt.rs.getString("menu_status");
                        		
                        		if(stat.equalsIgnoreCase("Active"))	
                        		{	
	                        		if(mnm.equalsIgnoreCase("notification") && cnt >0)
	                        		{
	                        			out.println("<li> <a href=\" " + site + "\">"+ mnm+ "<label class=\"cart-count\"> "+cnt +"</label></a> </li>");
	                        		}
	                        		else
	                        			out.println("<li> <a href=\" " + site + "\">"+ mnm +"</a> </li>");
                        		}
                        	} 
                        %> 
                    </ul> 
                </div><!-- /.navbar-collapse -->
            </div>

         
        </nav>
        <!-- End Navigation -->

    </header>
           <!-- jQuery Frameworks
    ============================================= -->
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
</body>
</html>