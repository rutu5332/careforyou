<%@page import="Storage.Data"%>
<%@page import="server.Mail" %>


<%
	Data dt = new Data();
	String eid="";
	dt.st = dt.cn.createStatement();
	String sql_menu = "select * from signup_tbl";
	dt.rs = dt.st.executeQuery(sql_menu);

	String id;
	boolean flag = false;

	id = request.getParameter("Email");
	String text="";

	try {

		while (dt.rs.next()) {
			eid = dt.rs.getString("vEmail");

			if (eid.equals(id)) {
				flag = true;
				String sub = "your generated random number : ";
				double r = Math.random();
				
		
				String temp = Double.toString(r);
				
				text=(temp.substring(2,7));
				System.out.println(text);
				
				Mail m = new Mail(eid, sub, text);
				
				
			}
		}
		if (flag != true) {
			String msg = "Invalid EmailId";
			response.sendRedirect("Forgot1.jsp?msg");

		}

	}

	catch (Exception ex) {
		System.out.println(ex);
	}
%>

<html>
<head>

    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="MediHub - Medical & Health Template">

    <!-- ========== Page Title ========== -->
   <title>Forget Password</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!-- ========== Start Stylesheet ========== -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/flaticon-set.css" rel="stylesheet" />
    <link href="assets/css/magnific-popup.css" rel="stylesheet" />
    <link href="assets/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="assets/css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />
    <link href="assets/css/bootsnav.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet" />
    <!-- ========== End Stylesheet ========== -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5/html5shiv.min.js"></script>
      <script src="assets/js/html5/respond.min.js"></script>
    <![endif]-->

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>
<body>
	<div class="se-pre-con"></div>
	
	<div class="banner-area responsive-auto-height text-small">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/4.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-7 col-sm-6">
                                    <h1 data-animation="animated slideInRight">Best care for your <span> Good health</span></h1>
                                    <p data-animation="animated slideInUp">
                                        The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.
                                    </p>
                                   <!--  <a data-animation="animated slideInUp" class="btn btn-light border btn-md" href="#">View Details</a> -->
                                </div>

                                <!-- Start Appoinment Form -->
                                <div class="col-md-5 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Forgot Password </h2>
                                        </div>
                                        <form action="Forgotpswsubmit.jsp" method="post" name="form4">
                                        
                                        	<input type="hidden" name="email" value="<%out.println(id); %>">
                                        	<input type="hidden" name="genCode" id="genCode" value="<%out.println(text); %>">
                                            <div class="row">
                                               
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                    <!--  onchange="dis()"-->
                                                     <input class="form-control" id="code"  name="code" placeholder="Generated Code" type="password">
                                                      <span id="codeerror"></span> 
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
                                                     <input class="form-control" id="cpsw" name="cpsw" placeholder="Confirm Password" type="password">
                                                      <span id="errorcpsw"></span> 
                                                    </div>
                                                </div>
                                                 
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
<jsp:include page="footer.jsp"></jsp:include>
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
    <script src="assets/js/Forgotpswjs.js"></script>
 </html>
