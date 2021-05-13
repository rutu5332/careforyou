<%@page import="Storage.Data"%>

<!DOCTYPE html>
<html lang="en">


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
  <script>
    (function(w, d, s, l, i) {
      w[l] = w[l] || [];
      w[l].push({
        'gtm.start': new Date().getTime(),
        event: 'gtm.js'
      });
      var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l != 'dataLayer' ? '&l=' + l : '';
      j.async = true;
      j.src =
        '../../../www.googletagmanager.com/gtm5445.html?id=' + i + dl;
      f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-NKDMSK6');
  </script>
  <!-- End Google Tag Manager -->
</head>

<body class="">
  <div class="wrapper ">
   
    <div class="sidebar" data-color="rose" data-background-color="black" data-image="../assets/img/sidebar-1.jpg">
   
     
     
    </div>
   </div>
   <jsp:include page="left2.jsp"></jsp:include>
     
    <div class="main-panel">
      <!-- Navbar -->
          <!-- End Navbar -->
      <div class="content">
        <div class="content">
          <div class="container-fluid">
               <!-- <button type="button" class="btn btn-round btn-default dropdown-toggle btn-link" data-toggle="dropdown">
7 days
</button> -->

					                     <%
					                     	Data dt=new Data();
					                            int c,c2,c3,c4,c5,c6,c7,c8=0;
					                            c= c2 =c3=c4=c5=c6=c7=0;

					                                     
					                     	 try{
					                             
					                                 dt.st=dt.cn.createStatement();
					                                 String select="select * from signup_tbl where eStatus='A'";
					                                 dt.rs=dt.st.executeQuery(select);

					                                     while (dt.rs.next()) {
					                     			c++;
					                     		}

					                     		select = "select * from doctorinfo_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c2++;
					                     		}

					                     		select = "select * from lab_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c3++;
					                     		}
					                     		
					                     		
					                     		select = "select * from docappointment_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c4++;
					                     		}
					                     		
					                     		select = "select * from patient_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c5++;
					                     		}
					                     		
					                     		select = "select * from product_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c6++;
					                     			
					                     		}
					                     		
					                     		select = "select * from feedback_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c7++;
					                     		}
					                     		
					                     		select = "select * from order_tbl where eStatus='A'";
					                     		dt.rs = dt.st.executeQuery(select);

					                     		while (dt.rs.next()) {
					                     			c8++;
					                     			
					                     		}
					                     		
					                     		

					                     	} catch (Exception ex) {

					                     		out.println(ex);

					                     	}
					                     %>
					




                        <div class="row">
                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-warning card-header-icon" style="backgroundcolor:peru">
                                <div class="card-icon" style="background-color:peru">
                                  <p class="material-icons"><h3 style="font-size:20px">Registered<br>Users</h3></p>
                                </div>
                                <p class="card-category" style="font:calibri;font-size:32px;color:peru"><%out.println(c); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:darkorange;font-family:candar;font-size:20px" href="tables/RegData.jsp">SEE ALL..</a></b>
                                 </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-rose card-header-icon">
                                <div class="card-icon" style="background-color:salmon">
                                 <p class="material-icons"><h3 style="font-size:20px">Connected<br>Doctors</h3></p>
                                </div>
                                 <p class="card-category" style="font:calibri;font-size:32px;color:palevioletred"><%out.println(c2); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:palevioletred;font-family:candar;font-size:20px" href="tables/DoctorData.jsp">SEE ALL..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon" style="background-color:seagreen">
                                 <p class="material-icons"><h3 style="font-size:20px">Registered<br>Lab</h3></p>
                                </div>
                                 <p class="card-category" style="font:calibri;font-size:32px;color:darkgreen"><%out.println(c3); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:darkgreen;font-family:candar;font-size:20px" href="tables/LabData.jsp">Full Details..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>   
                                               
                            <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-info card-header-icon">
                                <div class="card-icon" style="background-color:cadetblue">
                                  <p class="material-icons"><h3 style="font-size:20px">Registered<br>Pharmasist</h3></p>
                                </div>
                                <p class="card-category" style="font:calibri;font-size:32px;color:deepskyblue">1</p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:cadetblue;font-family:candar;font-size:20px; " href="#">Full Details..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon" style="background-color:peru">
                                  <p class="material-icons"><h3  style="font-size:20px">Doctor<br>Appointments</h3></p>
                                </div>
                                <p class="card-category" style="font:calibri;font-size:32px;color:peru"><%out.println(c4); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:darkorange;font-family:candar;font-size:20px" href="tables/DocAppointments.jsp">Full Detail..</a></b>
                                 </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-rose card-header-icon">
                                <div class="card-icon" style="background-color:salmon">
                                 <p class="material-icons"><h3  style="font-size:22px">Total<br>Patients<br></h3></p>
                                </div>
                                 <p class="card-category" style="font:calibri;font-size:32px;color:palevioletred"><%out.println(c5); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:palevioletred;font-family:candar;font-size:20px" href="tables/PatientData.jsp">SEE ALL..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon" style="background-color:seagreen">
                                 <p class="material-icons"><h3  style="font-size:22px">Total<br>Products<br></h3></p>
                                </div>
                                 <p class="card-category" style="font:calibri;font-size:32px;color:darkgreen"><%out.println(c6); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:darkgreen;font-family:candar;font-size:20px" href="tables/ProductData.jsp">Full Details..</a></b>
                                </div>
                              </div>
                            </div>
                          </div> 
                          
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-info card-header-icon">
                                <div class="card-icon" style="background-color:cadetblue">
                                  <p class="material-icons"><h3 style="font-size:22px">Confirmed<br>Orders</h3></p>
                                </div>
                                <p class="card-category" style="font:calibri;font-size:32px;color:deepskyblue"><%out.println(c8);%></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:cadetblue;font-family:candar;font-size:20px; " href="#">SEE ALL..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>
                            
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats" >
                              <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon" style="background-color:peru">
                                  <p class="material-icons"><h3  style="font-size:20px">Lab<br>Appointments</h3></p>
                                </div>
                                <p class="card-category" style="font:calibri;font-size:32px;color:peru">0</p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:darkorange;font-family:candar;font-size:20px" href="#">SEE ALL..</a></b>
                                 </div>
                              </div>
                            </div>
                          </div>
                          
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                              <div class="card-header card-header-rose card-header-icon">
                                <div class="card-icon" style="background-color:salmon">
                                 <p class="material-icons"><h3 style="font-size:20px">Total<br>Feedbacks<br></h3></p>
                                </div>
                                 <p class="card-category" style="font:calibri;font-size:32px;color:palevioletred"><%out.println(c7); %></p>
                              </div>
                              <div class="card-footer">
                                <div class="stats">
                                  <b><a style="color:palevioletred;font-family:candar;font-size:20px" href="tables/FeedbackData.jsp">SEE ALL..</a></b>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          
                        </div>
                     
                       
                    </div>
                  </div>
                 
                </div>
              </div>
              <div class="fixed-plugin">
                <div class="dropdown show-dropdown">
                  <a href="#" data-toggle="dropdown">
                    <i class="fa fa-cog fa-2x"> </i>
                  </a>
                  <ul class="dropdown-menu">
                    <li class="header-title"> Sidebar Filters</li>
                    <li class="adjustments-line">
                      <a href="javascript:void(0)" class="switch-trigger active-color">
                        <div class="badge-colors ml-auto mr-auto">
                          <span class="badge filter badge-purple" data-color="purple"></span>
                          <span class="badge filter badge-azure" data-color="azure"></span>
                          <span class="badge filter badge-green" data-color="green"></span>
                          <span class="badge filter badge-warning" data-color="orange"></span>
                          <span class="badge filter badge-danger" data-color="danger"></span>
                          <span class="badge filter badge-rose active" data-color="rose"></span>
                        </div>
                        <div class="clearfix"></div>
                      </a>
                    </li>
                    <li class="header-title">Sidebar Background</li>
                    <li class="adjustments-line">
                      <a href="javascript:void(0)" class="switch-trigger background-color">
                        <div class="ml-auto mr-auto">
                          <span class="badge filter badge-black active" data-background-color="black"></span>
                          <span class="badge filter badge-white" data-background-color="white"></span>
                          <span class="badge filter badge-red" data-background-color="red"></span>
                        </div>
                        <div class="clearfix"></div>
                      </a>
                    </li>
                    <li class="adjustments-line">
                      <a href="javascript:void(0)" class="switch-trigger">
                        <p>Sidebar Mini</p>
                        <label class="ml-auto">
                          <div class="togglebutton switch-sidebar-mini">
                            <label>
                              <input type="checkbox">
                              <span class="toggle"></span>
                            </label>
                          </div>
                        </label>
                        <div class="clearfix"></div>
                      </a>
                    </li>
                    <li class="adjustments-line">
                      <a href="javascript:void(0)" class="switch-trigger">
                        <p>Sidebar Images</p>
                        <label class="switch-mini ml-auto">
                          <div class="togglebutton switch-sidebar-image">
                            <label>
                              <input type="checkbox" checked="">
                              <span class="toggle"></span>
                            </label>
                          </div>
                        </label>
                        <div class="clearfix"></div>
                      </a>
                    </li>
                    <li class="header-title">Images</li>
                    <li class="active">
                      <a class="img-holder switch-trigger" href="javascript:void(0)">
                        <img src="../assets/img/sidebar-1.jpg" alt="">
                      </a>
                    </li>
                    <li>
                      <a class="img-holder switch-trigger" href="javascript:void(0)">
                        <img src="../assets/img/sidebar-2.jpg" alt="">
                      </a>
                    </li>
                    <li>
                      <a class="img-holder switch-trigger" href="javascript:void(0)">
                        <img src="../assets/img/sidebar-3.jpg" alt="">
                      </a>
                    </li>
                    <li>
                      <a class="img-holder switch-trigger" href="javascript:void(0)">
                        <img src="../assets/img/sidebar-4.jpg" alt="">
                      </a>
                    </li>
                   
                   
                    
                  </ul>
                </div>
              </div>
              <!--   Core JS Files   -->
              <script src="../assets/js/core/jquery.min.js"></script>
              <script src="../assets/js/core/popper.min.js"></script>
              <script src="../assets/js/core/bootstrap-material-design.min.js"></script>
              <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
              <!-- Plugin for the momentJs  -->
              <script src="../assets/js/plugins/moment.min.js"></script>
              <!--  Plugin for Sweet Alert -->
              <script src="../assets/js/plugins/sweetalert2.js"></script>
              <!-- Forms Validations Plugin -->
              <script src="../assets/js/plugins/jquery.validate.min.js"></script>
              <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
              <script src="../assets/js/plugins/jquery.bootstrap-wizard.js"></script>
              <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
              <script src="../assets/js/plugins/bootstrap-selectpicker.js"></script>
              <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
              <script src="../assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
              <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
              <script src="../assets/js/plugins/jquery.dataTables.min.js"></script>
              <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
              <script src="../assets/js/plugins/bootstrap-tagsinput.js"></script>
              <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
              <script src="../assets/js/plugins/jasny-bootstrap.min.js"></script>
              <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
              <script src="../assets/js/plugins/fullcalendar.min.js"></script>
              <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
              <script src="../assets/js/plugins/jquery-jvectormap.js"></script>
              <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
              <script src="../assets/js/plugins/nouislider.min.js"></script>
              <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
              <script src="../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
              <!-- Library for adding dinamically elements -->
              <script src="../assets/js/plugins/arrive.min.js"></script>
              <!--  Google Maps Plugin    -->
              <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
              <!-- Place this tag in your head or just before your close body tag. -->
              <script async defer src="../../../buttons.github.io/buttons.js"></script>
              <!-- Chartist JS -->
              <script src="../assets/js/plugins/chartist.min.js"></script>
              <!--  Notifications Plugin    -->
              <script src="../assets/js/plugins/bootstrap-notify.js"></script>
              <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
              <script src="../assets/js/material-dashboard.minf066.js?v=2.1.0" type="text/javascript"></script>
              <!-- Material Dashboard DEMO methods, don't include it in your project! -->
              <script src="../assets/demo/demo.js"></script>
              <script>
                $(document).ready(function() {
                  $().ready(function() {
                    $sidebar = $('.sidebar');

                    $sidebar_img_container = $sidebar.find('.sidebar-background');

                    $full_page = $('.full-page');

                    $sidebar_responsive = $('body > .navbar-collapse');

                    window_width = $(window).width();

                    fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

                    if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                      if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                        $('.fixed-plugin .dropdown').addClass('open');
                      }

                    }

                    $('.fixed-plugin a').click(function(event) {
                      // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                      if ($(this).hasClass('switch-trigger')) {
                        if (event.stopPropagation) {
                          event.stopPropagation();
                        } else if (window.event) {
                          window.event.cancelBubble = true;
                        }
                      }
                    });

                    $('.fixed-plugin .active-color span').click(function() {
                      $full_page_background = $('.full-page-background');

                      $(this).siblings().removeClass('active');
                      $(this).addClass('active');

                      var new_color = $(this).data('color');

                      if ($sidebar.length != 0) {
                        $sidebar.attr('data-color', new_color);
                      }

                      if ($full_page.length != 0) {
                        $full_page.attr('filter-color', new_color);
                      }

                      if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.attr('data-color', new_color);
                      }
                    });

                    $('.fixed-plugin .background-color .badge').click(function() {
                      $(this).siblings().removeClass('active');
                      $(this).addClass('active');

                      var new_color = $(this).data('background-color');

                      if ($sidebar.length != 0) {
                        $sidebar.attr('data-background-color', new_color);
                      }
                    });

                    $('.fixed-plugin .img-holder').click(function() {
                      $full_page_background = $('.full-page-background');

                      $(this).parent('li').siblings().removeClass('active');
                      $(this).parent('li').addClass('active');


                      var new_image = $(this).find("img").attr('src');

                      if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        $sidebar_img_container.fadeOut('fast', function() {
                          $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                          $sidebar_img_container.fadeIn('fast');
                        });
                      }

                      if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $full_page_background.fadeOut('fast', function() {
                          $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                          $full_page_background.fadeIn('fast');
                        });
                      }

                      if ($('.switch-sidebar-image input:checked').length == 0) {
                        var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                      }

                      if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                      }
                    });

                    $('.switch-sidebar-image input').change(function() {
                      $full_page_background = $('.full-page-background');

                      $input = $(this);

                      if ($input.is(':checked')) {
                        if ($sidebar_img_container.length != 0) {
                          $sidebar_img_container.fadeIn('fast');
                          $sidebar.attr('data-image', '#');
                        }

                        if ($full_page_background.length != 0) {
                          $full_page_background.fadeIn('fast');
                          $full_page.attr('data-image', '#');
                        }

                        background_image = true;
                      } else {
                        if ($sidebar_img_container.length != 0) {
                          $sidebar.removeAttr('data-image');
                          $sidebar_img_container.fadeOut('fast');
                        }

                        if ($full_page_background.length != 0) {
                          $full_page.removeAttr('data-image', '#');
                          $full_page_background.fadeOut('fast');
                        }

                        background_image = false;
                      }
                    });

                    $('.switch-sidebar-mini input').change(function() {
                      $body = $('body');

                      $input = $(this);

                      if (md.misc.sidebar_mini_active == true) {
                        $('body').removeClass('sidebar-mini');
                        md.misc.sidebar_mini_active = false;

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                      } else {

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                        setTimeout(function() {
                          $('body').addClass('sidebar-mini');

                          md.misc.sidebar_mini_active = true;
                        }, 300);
                      }

                      // we simulate the window Resize so the charts will get updated in realtime.
                      var simulateWindowResize = setInterval(function() {
                        window.dispatchEvent(new Event('resize'));
                      }, 180);

                      // we stop the simulation of Window Resize after the animations are completed
                      setTimeout(function() {
                        clearInterval(simulateWindowResize);
                      }, 1000);

                    });
                  });
                });
              </script>
              <!-- Sharrre libray -->
            
</body>


<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 09:05:11 GMT -->
</html>