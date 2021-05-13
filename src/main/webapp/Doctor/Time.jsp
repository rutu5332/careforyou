
<%@page import="Storage.Data" %>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Time</title>
<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

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
    <link href="assets/css/project.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<%
		if(session.getAttribute("doctor") == null)
			response.sendRedirect("../LoginDoctor.jsp");
	%> 
 
	<%
		String id="0";
		if(session.getAttribute("docid") != null)
			id=session.getAttribute("docid").toString();	 

	%>
	
	<%-- <jsp:include page="headerdc.jsp"></jsp:include> --%>
	<div class="banner-area responsive-auto-height text-small">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/2.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <!-- Start Login Form -->
                                <div class="col-md-6 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Timings</h2>
                                        </div>
                                        <h5 style="color:red;">*keep 0 in both where you want off</h5>
                                        <form action="TimeSub.jsp" method="post" name="time">
                                        	 <div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Days</div></div>
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">From</div></div>
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">To</div></div>
                                        	 </div>
                                        	 <div class="row"><div class="col-md-4"><input type="hidden" name="docid" value="<%out.println(id);%>"></div></div>
                                        	 <div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Monday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="mon-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="mon-end" />
                               					 </div>
                                        	</div> 
                                        	<div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Tuesday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="tue-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="tue-end"/>
                               					 </div>
                                        	</div>
                                        	<div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Wednesday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="wed-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="wed-end"/>
                               					 </div>
                                        	</div>
                                        	<div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Thursday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="thu-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="thu-end"/>
                               					 </div>
                                        	</div>
                                        	<div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Friday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="fri-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="fri-end"/>
                               					 </div>
                                        	</div>
                                        	<div class="row">
                                        		<div class="col-md-4"><div style="padding-top:10px;font-size:20px;">Saturday :</div></div>
                                        		 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="0" name="sat-st"/>
                               					 </div>
                               					 <div class="col-md-4">
                               					 	<input class="form-group" type="number" min="0" max="24" value="12" name="sat-end"/>
                               					 </div>
                                        	</div>
                                               
                                              <div class="row">
                                                <div class="col-md-12">
                                                    <button type="submit" name="timesub" id="timesub">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <script src="assets/js/Timejs.js"></script>
                                </div>
                                <!-- End Login Form -->
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="assets/js/Editjs.js"></script>
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
    <script src="assets/js/feedbackjs.js"></script>
</body>
</html>