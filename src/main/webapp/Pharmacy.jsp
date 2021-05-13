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
    <title>Pharmacy</title>
    
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

   <jsp:include page="header.jsp"></jsp:include>
   
	<!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/32.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Pharmacy</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
   
   <!-- Start Product
    ============================================= -->
   
   <div class="product-area bg-gray default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="product-items text-center">
                	<%
                	String catnames[]={"","Baby care","Joint Pain" ,"Cold and Fever","Diabetes care" 
                			,"Oral care","weight care","covid-19","Personal care","Women Care"};
                		for(int i=1;i<catnames.length;i++)
                		{
                			String link="medicine.jsp?id="+i;
                			out.println("<a href=\""+ link +"\">");
                    		out.println("<div class=\"col-md-4 col-sm-6 equal-height\">");      
                    		out.println(" <div class=\"item\">");
                    		out.println(" <div class=\"thumb\" >");
                    		out.println("<img style=\"height:200px;width:300px;\" src=\"assets/img/category/cat"+i +".jpg\" alt=\"Thumb\">");
                    		out.println("</div>");
                    		 out.println("<div class=\"info\">");
                    		out.println("<h4> "+catnames[i]+"</h4>");
                    		out.println("</div>"); 
                    		out.println("</div>");
                    		out.println("</div>");
                    		out.println("</a>");
                		}
                	%>
                </div>
             </div>
         </div>
   </div>
	<!-- End Product-->
   
	
</body>

<jsp:include page="footer.jsp"></jsp:include>
    
</html>