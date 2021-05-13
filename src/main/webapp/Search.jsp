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
    <title>Doctors</title>
    
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
   
	<%
		Data dt=new Data();
		String s=request.getParameter("search");
		System.out.println(s);
		String names[] = new String[150];
		String ids[]=new String[150];
		int i=0;
	    String sel="select * from product_tbl"; 
	    dt.st=dt.cn.createStatement();
		dt.rs=dt.st.executeQuery(sel);
		while(dt.rs.next())
		{
			ids[i]=dt.rs.getString("iProductId") ;
			names[i]=dt.rs.getString("vProductName") ;i++;
		}
		
		String catnames[]={"","Baby care","Joint Pain" ,"Cold and Fever","Diabetes care" 
    			,"Oral care","weight care","covid-19","Personal care","Women Care"};
		String depnames[]={"","Primary Care","cardiologist","dermatologist","pediatrician","neurologist",
				"psychiatrist","gynecologist","urologist","radiologist","orthopedist","immunologist","dentist"};
	%>
   
   
	<!-- Start Breadcrumb 
    ============================================= -->
    <!-- <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/33.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Departments</h1>
                </div>
            </div>
        </div>
    </div> -->
    <!-- End Breadcrumb -->
   
   <!-- Start Product
    ============================================= -->
   
   <div class="product-area bg-gray default-padding bottom-less">
        <div class="container">
        <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Related <span>Searches</span></h2>
                        
                    </div>
             	 </div>
          </div>
            <div class="row">
                <div class="product-items text-center">
                	
                </div>
            </div>
        </div>
   </div>
	
</body>

<jsp:include page="footer.jsp"></jsp:include>
    
</html>