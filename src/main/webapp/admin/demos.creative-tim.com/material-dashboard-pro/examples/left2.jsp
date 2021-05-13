<%@page import="Storage.Data"%>

<!DOCTYPE html>
<html lang="en">

<%
String ur=request.getRequestURI();
String name=ur.substring(ur.lastIndexOf("/")+1);


%>

<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 09:04:43 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   Care4you
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!-- Extra details for Live View on GitHub Pages -->
  <!-- Canonical SEO -->
  <link rel="canonical" href="https://www.creative-tim.com/product/material-dashboard-pro" />
  <!--  Social tags      -->
  <meta name="keywords" content="creative tim, html dashboard, html css dashboard, web dashboard, bootstrap 4 dashboard, bootstrap 4, css3 dashboard, bootstrap 4 admin, material dashboard bootstrap 4 dashboard, frontend, responsive bootstrap 4 dashboard, material design, material dashboard bootstrap 4 dashboard">
  <meta name="description" content="Material Dashboard PRO is a Premium Material Bootstrap 4 Admin with a fresh, new design inspired by Google's Material Design.">
  <!-- Schema.org markup for Google+ -->
  <meta itemprop="name" content="Material Dashboard PRO by Creative Tim">
  <meta itemprop="description" content="Material Dashboard PRO is a Premium Material Bootstrap 4 Admin with a fresh, new design inspired by Google's Material Design.">
  <meta itemprop="image" content="../../../s3.amazonaws.com/creativetim_bucket/products/51/original/opt_mdp_thumbnail.jpg">
  <!-- Twitter Card data -->
  <meta name="twitter:card" content="product">
  <meta name="twitter:site" content="@creativetim">
  <meta name="twitter:title" content="Material Dashboard PRO by Creative Tim">
  <meta name="twitter:description" content="Material Dashboard PRO is a Premium Material Bootstrap 4 Admin with a fresh, new design inspired by Google's Material Design.">
  <meta name="twitter:creator" content="@creativetim">
  <meta name="twitter:image" content="../../../s3.amazonaws.com/creativetim_bucket/products/51/original/opt_mdp_thumbnail.jpg">
  <!-- Open Graph data -->
  <meta property="fb:app_id" content="655968634437471">
  <meta property="og:title" content="Material Dashboard PRO by Creative Tim" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="dashboard.html" />
  <meta property="og:image" content="../../../s3.amazonaws.com/creativetim_bucket/products/51/original/opt_mdp_thumbnail.jpg" />
  <meta property="og:description" content="Material Dashboard PRO is a Premium Material Bootstrap 4 Admin with a fresh, new design inspired by Google's Material Design." />
  <meta property="og:site_name" content="Creative Tim" />
  
  <!--     Fonts and icons     -->
  
  
  <link rel="stylesheet" href="../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  
  <!-- CSS Files -->
  
  <link href="../assets/css/material-dashboard.minf066.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <!-- Google Tag Manager -->
  
  <!-- End Google Tag Manager -->
</head>

<body class="">
  <!-- Extra details for Live View on GitHub Pages -->
  <!-- Google Tag Manager (noscript) -->
  <noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6" height="0" width="0" style="display:none;visibility:hidden"></iframe>
  </noscript>
  <!-- End Google Tag Manager (noscript) -->
  <div class="wrapper ">
    <div class="sidebar" data-color="rose" data-background-color="black" data-image="../assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
    <% 
  	String p=(String)session.getAttribute("pageval"); 
  	 %>
      <div class="logo">
       
        <a  class="simple-text logo-normal">
          &nbsp;&nbsp;Care4you Team
        </a>
      </div>
      <div class="sidebar-wrapper">
       
        <ul class="nav">
          
                  
          <!-- my work................. -->
            <% if(name.equals("dashboard.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>   
            <a class="nav-link" href="dashboard.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p>Dashboard </p>
            </a>
          </li>
          
            <% if(name.equals("AdminData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/AdminData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Admin data </p>
            </a>
          </li>
          
           <% if(name.equals("RegData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/RegData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Registered Users </p>
            </a>
          </li>
          
          <% if(name.equals("ProductData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/ProductData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Product data </p>
            </a>
          </li>
          
          <% if(name.equals("DoctorData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/DoctorData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Doctor data </p>
            </a>
          </li>
          
           <% if(name.equals("DocAppointments.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/DocAppointments.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Doctor Appointments </p>
            </a>
          </li>
          
            <% if(name.equals("LabData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/LabData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Laboratory data </p>
            </a>
          </li>
          
           <% if(name.equals("PhleboData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/PhleboData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Phlebotomist data </p>
            </a>
          </li>
          
          
          
            <% if(name.equals("PatientData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/PatientData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Patient data </p>
            </a>
          </li>
          
          <% if(name.equals("Contactdata.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
          
            <a class="nav-link" href="tables/Contactdata.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> ContactUs data </p>
            </a>
          </li>
          
           <% if(name.equals("FeedbackData.jsp"))
          {
        	%>  <li class="nav-item active"><% 
          }
          else
          {
        	 %> <li class="nav-item "><%
          }
        	  %>
            <a class="nav-link" href="tables/FeedbackData.jsp">
             <!--  <i class="material-icons">date_range</i> -->
              <p> Feedback data </p>
            </a>
          </li>
          
          
        </ul>
      </div>
    </div>
   </div>
    

</body>


<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 09:05:11 GMT -->
</html>