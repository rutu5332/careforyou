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

   
    <!-- Start Breadcrumb 
    ============================================= -->
      <div class="breadcrumb-area shadow dark bg-fixed text-light" 
      			style="background-image: url(assets/img/banner/lab6.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Tests</h1>
                </div>
     
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->


    <!-- Start Lab
    ============================================= -->
 
   <div class="solid-services-area default-padding bottom-less bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Tests <span>by Organ</span></h2>
                        
                    </div>
                </div>
                
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
                   
                </div>
            </div>
        </div>
    </div>
   
    <!-- End Lab -->

   <!--  <!-- Start Doctors Tips 
    ============================================= 
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
    End Doctors Tips -->
    
   <jsp:include page="footer.jsp"></jsp:include>
  

</body>

</html>