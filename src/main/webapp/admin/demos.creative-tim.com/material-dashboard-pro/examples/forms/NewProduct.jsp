<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Storage.Data"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">

 <%
 String name="",lnm="",details="",stock="",brand="",img="",ing="",code="",category="",status="",mfg="",sp="",units="",id="",measur="",highlight="";
  	Data dt =new Data();
  	//String mode=request.getParameter("mode");
  	String iid=request.getParameter("did");
  	String mode=request.getParameter("mode");
  	
  	  	int uid=Integer.parseInt(iid);
  	 
  	  	if(mode.equals("Update"))
  	  	{
  	  		
  	  		
  	  	try{
 			 dt.st=dt.cn.createStatement();
            String select="select * from product_tbl where iProductId='"+uid+"' ";
           
            dt.rs=dt.st.executeQuery(select);
           
            while(dt.rs.next())
            {
            		id=dt.rs.getString("iProductId");
            		name=dt.rs.getString("vProductName");
            		details=dt.rs.getString("vProductDetails");
            		stock=dt.rs.getString("iProductStock");
            		brand=dt.rs.getString("vProductBrand");
            		img=dt.rs.getString("vProductImage");
            		ing=dt.rs.getString("vProductIngredients");
            		code=dt.rs.getString("vProductCode");
            		category=dt.rs.getString("iProductCategory");
            		mfg=dt.rs.getString("dMfgPrice");
            		sp=dt.rs.getString("dSellPrice");
            		units=dt.rs.getString("iUnits");
            		measur=dt.rs.getString("iMeasurement");
            		highlight=dt.rs.getString("vHighlight");
            		status=dt.rs.getString("eStatus");
            }
 			
 		}
 		catch(Exception e)
 		{
 			System.out.println(e);
 		}
  	  		
  	  	}
  	  	
  	  	
  	  if(mode.equals("Add"))
	  	{
	  		
  		name=lnm=details=stock=brand=img=ing=code=category=status=mfg=sp=units=id=measur=highlight="";
	  		
	  	}
  		
 %>
  	

<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/forms/validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 09:05:20 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../../assets/css/material-dashboard.minf066.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../../assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
 
  <div class="wrapper ">
    <div class="sidebar" data-color="rose" data-background-color="black" data-image="../../assets/img/sidebar-1.jpg">
     
     
      
    </div>
    <jsp:include page="../left3.jsp"></jsp:include>
    <div class="main-panel">
      <!-- Navbar -->
          <!-- End Navbar -->
     <div class="content">
        <div class="container-fluid">
          <div class="row">
                 <div class="col-md-12">
               <form id="TypeValidation" class="form-horizontal" enctype="multipart/form-data" 
              <%if(mode.equals("Update"))
            	  {
            	  %>
            	  
            	 action="../../../../../UpProduct?iProductId=<% out.println(id); %>"  
            	  <% 
            	  }
              
              else
              {
            	  %>
            	  
             	  action="../../../../../AddProduct" 
             	  
             	  <% 
            	  
              }
            	  %>
            	   method="post" name="insert">  
            	   
                <div class="card ">
                  <div class="card-header card-header-rose card-header-text">
                    <div class="card-text">
                      <h4 class="card-title">Product</h4>
                    </div>
                  </div>
                  </div>
                  <div class="card-body ">
                    <div class="row">
                      <label class="col-sm-2 col-form-label">ProductName</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value= "<%out.println(name); %>" type="text" name="name" id="name" >
                          <span id="errorname"></span>
                        </div>
                      </div>
                     </div>
                    
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Product<br>Details</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                         
                          <textarea class="form-control"  name="details" id="details">
                          <%out.println(details); %>
                          </textarea>
                        </div>
                      </div>
                     </div>
                     
                     
                   
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Stock</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" type="text" value="<%out.println(stock); %>"  name="stock" id="stock">
                           <span id="errorstock"></span>
                        </div>
                      </div>
                     </div>
                     
                      <div class="row">
                      <label class="col-sm-2 col-form-label">BrandName</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value="<%out.println(brand); %>"   type="text" name="brand" id="brand">
                           <span id="errorbrand"></span>
                        </div>
                      </div>
                     </div>
                     
                       <div class="row">
                      <label class="col-sm-2 col-form-label">Ingredients</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                         
                          <textarea class="form-control"  name="ing" id="ing">
                          <%out.println(ing); %>
                          </textarea>
                           <span id="erroring"></span>
                        </div>
                      </div>
                     </div>                     
                                  
                   
                    
                     <div class="row">
                      <label class="col-sm-2 col-form-label">ProductCode</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value="<%out.println(code); %>"  type="text" name="code" id="code" >
                          <span id="errorcode"></span>
                        </div>
                      </div>
                    </div>
                    
                    
                      <%
                    if(mode.equals("Update"))
                    {
                    	%>
                    
                   
                   
                     <div class="row">
                      <label class="col-sm-2 col-form-label">Category</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="type" id="type">
                            <option value="0">..Choose Option..</option>
                            <option value="1" <%  
                               Integer t1=new Integer(category);
                               
                               if(t1 == 1)
                               {
                               	%>selected<% 
                               	
                               } %>>Baby Products</option>
                               
                               
                            <option value="2" <%  Integer t2=new Integer(category);
                               
                               if(t2 == 2)
                               {
                               	%>selected<% 
                               	
                               } %>>Bone and Joint pain</option>
                               
                               
                            <option value="3"  <%  Integer t3=new Integer(category);
                               
                               if(t3 == 3)
                               {
                               	%>selected<% 
                               	
                               } %>>Cold and Fever</option>
                             <option value="4"  <%  Integer t4=new Integer(category);
                               
                               if(t4 == 4)
                               {
                               	%>selected<% 
                               	
                               } %>>Diabetic Care</option>
                             <option value="5" <%  Integer t5=new Integer(category);
                               
                               if(t5 == 5)
                               {
                               	%>selected<% 
                               	
                               } %>>Oral Care</option>
                              <option value="6" <%  Integer t6=new Integer(category);
                               
                               if(t6 == 6)
                               {
                               	%>selected<% 
                               	
                               } %>>Weight Care</option>
                            <option value="7" <%  Integer t7=new Integer(category);
                               
                               if(t7 == 7)
                               {
                               	%>selected<% 
                               	
                               } %>>Covid-19 Special</option>
                            <option value="8" <%  Integer t8=new Integer(category);
                               
                               if(t8 == 8)
                               {
                               	%>selected<% 
                               	
                               } %>>Personal Care</option>
                            <option value="9" <%  Integer t9=new Integer(category);
                               
                               if(t9 == 9)
                               {
                               	%>selected<% 
                               	
                               } %>>Mother Care</option>
                          </select>
                     
                           <span id="errortype"></span>
                        </div>
                      </div>
                     </div>
                     
                  <% 
                    }
                    
                    else
                    {
					%>
					
					 <div class="row">
                      <label class="col-sm-2 col-form-label">Category</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="type" id="type">
                            <option value="0">..Choose Option..</option>
                            <option value="1" >Baby Products</option>
                            <option value="2">Bone and Joint pain</option>
                            <option value="3">Cold and Fever</option>
                             <option value="4">Diabetic Care</option>
                             <option value="5">Oral Care</option>
                              <option value="6">Weight Care</option>
                            <option value="7">Covid-19 Special</option>
                            <option value="8">Personal Care</option>
                            <option value="9">Mother Care</option>
                          </select>
                     
                           <span id="errortype"></span>
                        </div>
                      </div>
                     </div>
					                    	
                    <%
                    }
                      
                    	%> 
                   
                   
                     <div class="row">
                      <label class="col-sm-2 col-form-label">Manufactured Price</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value="<%out.println(mfg); %>" type="text" name="mfg" id="mfg" >
                          <span id="errormfg"></span>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Selling Price</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value="<%out.println(sp); %>"  type="text" name="sp" id="sp" >
                          <span id="errorsp"></span>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Units</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value="<%out.println(units); %>" type="text" name="units" id="units" >
                          <span id="errorunits"></span>
                        </div>
                      </div>
                    </div>
                    
                    
                    <%
                    if(mode.equals("Update"))
                    {
                    %>
                    
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Measurement</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="measur" id="measur">
                            <option value="0">..Choose Option..</option>
                            <option value="1"  <%  
                               Integer t1=new Integer(measur);
                               
                               if(t1 == 1)
                               {
                               	%>selected<% 
                               	
                               } %>>units</option>
                            <option value="2"  <%  
                               Integer t2=new Integer(measur);
                               
                               if(t2 == 2)
                               {
                               	%>selected<% 
                               	
                               } %>>ml</option>
                            <option value="3"  <%  
                               Integer t3=new Integer(measur);
                               
                               if(t3 == 3)
                               {
                               	%>selected<% 
                               	
                               } %>>gram</option>
                            
                          </select>
                          <span id="errormeasur"></span>
                        </div>
                      </div>
                    </div>
                    <%
                    }
                    else
                    {%>
                    
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Measurement</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="measur" id="measur">
                            <option value="0">..Choose Option..</option>
                            <option value="1" >units</option>
                            
                            <option value="2">ml</option>
                            <option value="3">gram</option>
                            
                          </select>
                          <span id="errormeasur"></span>
                        </div>
                      </div>
                    </div>
                    	
                  <% }
                    %>
                    
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Highlights</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                         
                          <textarea class="form-control"  name="highlight" id="highlight">
                           <%out.println(ing); %>
                          </textarea>
                           <span id="errorhigh"></span>
                        </div>
                      </div>
                     </div>   
                  
                  
                    <%
                    if(mode.equals("Update"))
                    {
                    %>
                    
                   <div class="row">
                      <label class="col-sm-2 col-form-label">Status</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="status" id="status">
                            <option value="0">..Choose Option..</option>
                            <option value="A"  <%  
                            
                               
                               if(status.equals("A"))
                               {
                               	%>selected<% 
                               	
                               } %>>Active</option>
                            
                            <option value="I"   <%  
                            
                               
                               if(status.equals("I"))
                               {
                               	%>selected<% 
                               	
                               } %>>Inactive</option>
                           
                            
                          </select>
                     
                           <span id="errorstatus"></span>
                        </div>
                      </div>
                     </div>
                     
                        <%
                    }
                    else
                    {%>
                     <div class="row">
                      <label class="col-sm-2 col-form-label">Status</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        
                          <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="status" id="status">
                            <option value="0">..Choose Option..</option>
                            <option value="A" >Active</option>
                            
                            <option value="I">Inactive</option>
                           
                            
                          </select>
                     
                           <span id="errorstatus"></span>
                        </div>
                      </div>
                     </div>

					<%
                    }
					%>
									<div class="row">
										<label class="col-sm-2 col-form-label">Product<br>image
										</label>
										<div class="col-sm-5">
											<div class="form-group">

												<div class="fileinput fileinput-new text-center"
													data-provides="fileinput">

													<div
														class="fileinput-preview fileinput-exists thumbnail img-circle"></div>
													<div>
														<span class="btn btn-round btn-rose btn-file"> <span
															class="fileinput-new"><%out.println(img); %></span> 
															
															<input type="file"
															name="image" id="image">

														</span> <br />

													</div>
												</div>

												<span id="errorimg"></span>
											</div>
										</div>
									</div>

									

									<div class="card-footer ml-auto mr-auto">
                    <input type="submit" class="btn btn-rose" name="submit" id="submit" value="Submit">
                  </div>
                </div>
              </form>
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
            <img src="../../assets/img/sidebar-1.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../../assets/img/sidebar-2.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../../assets/img/sidebar-3.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../../assets/img/sidebar-4.jpg" alt="">
          </a>
        </li>
       
       
       
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
 
  <script src="../../assets/js/core/jquery.min.js"></script>
  <script src="../../assets/js/core/popper.min.js"></script>
  <script src="../../assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="../../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="../../assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="../../assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="../../assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="../../assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="../../assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="../../assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="../../assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="../../assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="../../assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="../../assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="../../assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="../../assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="../../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="../../assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="../../../../buttons.github.io/buttons.js"></script>
  <!-- Chartist JS -->
  <script src="../../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../../assets/js/material-dashboard.minf066.js?v=2.1.0" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="../../assets/demo/demo.js"></script>
  <script src="../../assets/js/styleproduct.js"></script>
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
  <script src="../../assets/demo/jquery.sharrre.js"></script>
  <script>
    $(document).ready(function() {

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-46172202-1']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
      })();

      // Facebook Pixel Code Don't Delete
      ! function(f, b, e, v, n, t, s) {
        if (f.fbq) return;
        n = f.fbq = function() {
          n.callMethod ?
            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        };
        if (!f._fbq) f._fbq = n;
        n.push = n;
        n.loaded = !0;
        n.version = '2.0';
        n.queue = [];
        t = b.createElement(e);
        t.async = !0;
        t.src = v;
        s = b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t, s)
      }(window,
        document, 'script', '../../../../connect.facebook.net/en_US/fbevents.js');

      try {
        fbq('init', '111649226022273');
        fbq('track', "PageView");

      } catch (err) {
        console.log('Facebook Track Error:', err);
      }

    });
  </script>
  <noscript>
    <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1" />
  </noscript>
  <script>
    function setFormValidation(id) {
      $(id).validate({
        highlight: function(element) {
          $(element).closest('.form-group').removeClass('has-success').addClass('has-danger');
          $(element).closest('.form-check').removeClass('has-success').addClass('has-danger');
        },
        success: function(element) {
          $(element).closest('.form-group').removeClass('has-danger').addClass('has-success');
          $(element).closest('.form-check').removeClass('has-danger').addClass('has-success');
        },
        errorPlacement: function(error, element) {
          $(element).closest('.form-group').append(error);
        },
      });
    }

    $(document).ready(function() {
      setFormValidation('#RegisterValidation');
      setFormValidation('#TypeValidation');
      setFormValidation('#LoginValidation');
      setFormValidation('#RangeValidation');
    });
  </script>
</body>


<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/forms/validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 09:05:20 GMT -->
</html>