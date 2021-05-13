<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    

    <!-- ========== Page Title ========== -->
    <title>Doctor</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">


    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
    <jsp:include page="headerdc.jsp"></jsp:include>
    
    <%
    	String img="",email="";
    	if(session.getAttribute("type") == null)
    			response.sendRedirect("../index.jsp");
    	else if(! (session.getAttribute("type")).toString().equalsIgnoreCase("doctor"))
    		response.sendRedirect("../index.jsp");
    	if(session.getAttribute("img") != null)
    		img=session.getAttribute("img").toString();
    	if(session.getAttribute("email") != null)
    		email=session.getAttribute("email").toString();
    %>

   
    <!-- Start Banner 
    ============================================= -->
    <div class="banner-area text-dark">
        <div id="bootcarousel" class="carousel slide animate_text" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner heading-uppercase text-dark">
                <div class="item active bg-cover" style="background-image: url(assets/img/banner/8.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInLeft">Best Care For Your Health </h1>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/9.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="content">
                                            <h1 data-animation="animated slideInDown">Special For Expert Doctors</h1>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/10.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInRight">Filled with specialist</h1>
                                           
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Wrapper for slides -->

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#bootcarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#bootcarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!-- End Banner -->

    <!-- Start About
    ============================================= -->
    <div class="about-area default-padding">
        <div class="container">
            <div class="row">
                <div class="about-items">
                    <div class="col-md-6 inc-video">
                        <div class="thumb">
                            <img src="assets/img/doctors/<%out.println(img); %>" alt="Thumb">
                        </div>
                    </div>
					<div class="col-md-6 info">
						<!-- <h4>Has been working since 2015 at my clinic</h4>
                        <h2>Now get a chance to work on web.A Great Place to Work on Web is Care4you.</h2>
                        <p>
                            The idea of giving services on web is the very best and very helpful to patients.And in today's digital world every doctor should try to provide services with help of internet.  
                        </p>
                        <p>
                            waiting and correct believe now cottage she another. Vexed six shy yet along learn maids her tiled. Through studied shyness evening bed him winding present. Become excuse hardly on my thirty it wanted.
                        </p> -->
                        <%String name="";
            				if(session.getAttribute("doctor") != null)
            					name=session.getAttribute("doctor").toString();
            			%>
                        <h2>Welcome Dr.<%out.println(name); %></h2>
						<h4>Thank you for registering Your Self</h4>
						<p>
							We hope you will like our site.you can contact us @<a href="mailto:care4you2019@gmail.com">care4you2019@gmail.com</a>
						</p>
						<h2>You can give any suggestions</h2>
							<h4>Feedback</h4>
							<form method="post" id="fdbckform" method=get
								action="feedbacksub.jsp" name="fdbckform">

								<div class="form-group">
									<input class="form-control" id="eid" name="eid"
										value="<%out.println(email); %>" type="hidden"> 
								</div>
								<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<textarea class="form-control" placeholder="Enter Feedback *"
											id="fd" name="fd" cols="40" rows="3"></textarea>
										<span id="fderr" style="color: red;"></span>
									</div>
								</div>
								</div>
								<div class="row">
								<div class="col-md-4">
									<button type="submit" name="fdbcksub" id="fdbcksub"
										class="btn btn-theme">
										Submit <i class="fa fa-paper-plane"></i>
									</button>
								</div>
								</div>
							</form>
						
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- End About -->

   

    <!-- Start Doctors Tips 
    ============================================= -->
    <div class="doctor-tips-area default-padding bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Health <span>Tips</span></h2>
                        <p>
                            While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old
                        </p>
                    </div>
                </div>
            </div>
         
         	<div class="health-tips-items">
         	
              <div class="info col-md-7" >
                <h3>How to live a healthy lifestyle?</h3>
                                <p>
                                    Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no overcame possible it on. 
                                </p>
                                <h4>Follow the instructions</h4>
                                <ul>
                                    <li>Dont just worry about the things you cannot help.</li>
                                    <li>Eat Healthy, work better.</li>
                                    <li>Anger can kill you. Avoid them at the most.</li>
                                    <li>Focus on the good things that you like</li>
                                </ul>
                   
                    
                    <!-- End Single Item -->
               </div>
            </div>   
            
        </div>
    </div>
    <!-- End Doctors Tips -->
    
    <script src="assets/js/feedbackjs.js"></script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>