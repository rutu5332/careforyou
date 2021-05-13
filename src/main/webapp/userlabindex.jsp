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
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Pathology Lab</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

 
 </head>

<body>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
    <jsp:include page="header.jsp"></jsp:include>

   
    <!-- Start Banner 
    ============================================= -->
    <div class="banner-area text-dark">
        <div id="bootcarousel" class="carousel slide animate_text" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner heading-uppercase text-dark">
                <div class="item active bg-cover" style="background-image: url(assets/img/banner/lab5.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInLeft">Best Test At Affordable Price </h1>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/lab7.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="content">
                                            <h1 data-animation="animated slideInDown">Specialits are well Equipped</h1>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/lab6.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInRight">Fully Automated and Some of the Specialities are Integrated</h1>
                                          
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
    <!-- <div class="about-area default-padding">
        <div class="container">
            <div class="row">
                <div class="about-items">
                    <div class="col-md-6 inc-video">
                        <div class="thumb">
                            <img src="assets/img/phlabotomist/ph1.jpg" alt="Thumb">
                        </div>
                    </div>
                    <div class="col-md-6 info">
                        <h4>Has been working since 2015</h4>
                        <h2>Now get a chance to work on web.A Great Place to Work on Web is Careforyou.</h2>
                        <p>
                            The idea of giving services on web is the very best and very helpful to patients.And in today's digital world every doctor should try to provide services with help of internet.  
                        </p>
                        <p>
                            waiting and correct believe now cottage she another. Vexed six shy yet along learn maids her tiled. Through studied shyness evening bed him winding present. Become excuse hardly on my thirty it wanted.
                        </p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!--  End About -->

    <!-- Start Services
    ============================================= -->
 
   <div class="solid-services-area default-padding bottom-less bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Tests <span>by Organ</span></h2>
                        <!--  <p>
                            While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old
                        </p>-->
                    </div>
                </div>.
                
            </div>
            <div class="row">
                <div class="services-items">
                    <!-- Single Item -->
                    <%
	                    dt.st=dt.cn.createStatement();
	         			String sql_menu = "select * from maintest_tbl";
	         		 	dt.rs=dt.st.executeQuery(sql_menu);
                        String mid="",mtnm="",mic="";
                        while(dt.rs.next())
                        {
                        	mid+=dt.rs.getString("iMainTestId") + "/";
                        	mtnm+=dt.rs.getString("vMainTestName") + "/";
                        	mic+=dt.rs.getString("vMainTestIcon") + "/";
                        }
                        String mainid[]=mid.split("/");
                        String mainnm[]=mtnm.split("/");
                        String mainic[]=mic.split("/");
                        
                        for(int i=0;i<mainid.length;i++)
                        {
                        	sql_menu="select * from test_tbl where iMainTestId ="+ mainid[i];
                        	String link="testinfo.jsp?id="+ mainid[i] ;
                        	out.println("<a href=\""+ link +"\">");
                        	out.println("<div class=\"col-md-4 col-sm-6 equal-height\">");
		                    out.println("<div class=\"item\"\">");   
		                    out.println("<i class=\""+ mainic[i] +"\"></i>");     
		                    out.println("<h4> "+ mainnm[i] + "</h4>");        
		                    out.println("<ul>");  
		                    dt.rs=dt.st.executeQuery(sql_menu);
		                    while(dt.rs.next())
		                	{
		                    	String tnm=dt.rs.getString("vTestName");
		                    	 out.println("<li>" + tnm + "</li>");
		                   	}
		                    out.println("</ul>");        
		                    out.println("</div>");   
		                    out.println("</div>");
                        }
	         		 	
                    %>
                    <!-- End Single Item -->
                    
                  
           
                </div>
            </div>
        </div>
    </div>
   
    <!-- End Services -->

    <!-- Start Doctors Tips 
    ============================================= -->
    <div class="doctor-tips-area default-padding bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Health <span>Tips</span></h2>
                        <p>
                            Learn to do stretching exersices when you wake up.It boosts circulation and digestion, and eases back pain. 
                        </p>
                    </div>
                </div>
            </div>
             <div class="health-tips-items tips-carousel owl-carousel owl-theme">
                    
                        <div class="col-md-7">
                            <div class="info">
                                
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
                            </div>
                        </div>
            </div>
        </div>
    </div>
    <!-- End Doctors Tips -->
    
    <!-- Start Phlebotomist
    ============================================= -->
    <!-- <div class="doctor-area bg-gray carousel-shadow default-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Meet Our <span>Phlebotomists</span></h2>
                        <p>
                            While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="doctor-items doctor-carousel owl-carousel owl-theme text-center">
                        Single Item
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/phlabotomist/ph4.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#"><i class="fas fa-plus"></i></a>
                                </div>
                                <div class="social">
                                    <ul>
                                        <li class="facebook">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="instagram">
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="info">
                                <h4>Jessica Jones</h4>
                                <h5>Cardiologist</h5>
                                <div class="appoinment-btn">
                                    <a href="#">Make appoinment</a>
                                </div>
                            </div>
                        </div>
                        End Single Item
                        Single Item
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/phlabotomist/ph5.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#"><i class="fas fa-plus"></i></a>
                                </div>
                                <div class="social">
                                    <ul>
                                        <li class="facebook">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="instagram">
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="info">
                                <h4>Ahel Natasha</h4>
                                <h5>Dental surgeon</h5>
                                <div class="appoinment-btn">
                                    <a href="#">Make appoinment</a>
                                </div>
                            </div>
                        </div>
                        End Single Item
                        Single Item
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/phlabotomist/ph3.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#"><i class="fas fa-plus"></i></a>
                                </div>
                                <div class="social">
                                    <ul>
                                        <li class="facebook">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="instagram">
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="info">
                                <h4>Gabriela Beckett</h4>
                                <h5>Cosmetic Surgeon</h5>
                                <div class="appoinment-btn">
                                    <a href="#">Make appoinment</a>
                                </div>
                            </div>
                        </div>
                        End Single Item
                        Single Item
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/phlabotomist/ph1.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#"><i class="fas fa-plus"></i></a>
                                </div>
                                <div class="social">
                                    <ul>
                                        <li class="facebook">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="instagram">
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="info">
                                <h4>Ahel Natasha</h4>
                                <h5>Dental surgeon</h5>
                                <div class="appoinment-btn">
                                    <a href="#">Make appoinment</a>
                                </div>
                            </div>
                        </div>
                        End Single Item
                        Single Item
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/phlabotomist/ph2.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#"><i class="fas fa-plus"></i></a>
                                </div>
                                <div class="social">
                                    <ul>
                                        <li class="facebook">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="instagram">
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="info">
                                <h4>Gabriela Beckett</h4>
                                <h5>Cosmetic Surgeon</h5>
                                <div class="appoinment-btn">
                                    <a href="#">Make appoinment</a>
                                </div>
                            </div>
                        </div>
                        End Single Item
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- End Phlebotomist -->
    
   <jsp:include page="footer.jsp"></jsp:include>


</body>

</html>