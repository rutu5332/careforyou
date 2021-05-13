<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Storage.Data"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">

 <%
 String fnm="",lnm="",gen="",add="",psw="",img="",lic="",bday="",degree="",exp="",email="",mno="",type="",id="",bd="",dcid="";
  	Data dt =new Data();
  	//String mode=request.getParameter("mode");
  	String iid=request.getParameter("did");
  	String mode=request.getParameter("mode");
  	
  	  	int uid=Integer.parseInt(iid);
  	 
  	  	if(mode.equals("Update"))
  	  	{
  	  		
  	  		
  	  	try{
 			 dt.st=dt.cn.createStatement();
            String select="select * from doctorinfo_tbl where iDoctorId='"+uid+"' ";
           
            dt.rs=dt.st.executeQuery(select);
           
            while(dt.rs.next())
            {
            		dcid=dt.rs.getString("iDoctorId");
                    fnm=dt.rs.getString("vFirstName");
                   
                    lnm=dt.rs.getString("vLastName");
                    gen=dt.rs.getString("vGender");
                   
                    add=dt.rs.getString("vClinicAdd");
                    mno=dt.rs.getString("vMobile"); 
                    psw=dt.rs.getString("vPassword"); 
                    email=dt.rs.getString("vEmail");                        
                   img=dt.rs.getString("vFileName");
                   bday=dt.rs.getString("dBirthdate");
                  lic=dt.rs.getString("vLicense");
                
                    degree=dt.rs.getString("vDegree");
                    exp=dt.rs.getString("iExperience");
                    type=dt.rs.getString("iWorkType");
                    
           
                    
            }
 			
 		}
 		catch(Exception e)
 		{
 			System.out.println(e);
 		}
  	  		
  	  	}
  	  	
  	  	
  	  if(mode.equals("Add"))
	  	{
	  		
	  		fnm=lnm=gen=add=psw=img=lic=bday=degree=exp=email=mno=type=id=bd=dcid="";
	  		
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
            	  
            	 action="../../../../../updoctor?iDoctoId=<% out.println(dcid); %>"  
            	  <% 
            	  }
              
              else
              {
            	  %>
            	  
             	  action="../../../../../AddDoc" 
             	  
             	  <% 
            	  
              }
            	  %>
            	   method="post" name="insert">  
              
                <div class="card ">
                  <div class="card-header card-header-rose card-header-text">
                    <div class="card-text">
                      <h4 class="card-title">Doctor</h4>
                    </div>
                  </div>
                  </div>
                  <div class="card-body ">
                    <div class="row">
                      <label class="col-sm-2 col-form-label">FirstName</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value= "<%out.println(fnm); %>" type="text" name="fname" id="fname" >
                          <span id="errorfn"></span>
                        </div>
                      </div>
                     </div>
                     <div class="row">
                      <label class="col-sm-2 col-form-label">LastName</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" value= "<%out.println(lnm); %>" type="text" name="lname" id="lname">
                           <span id="errorln"></span>
                        </div>
                      </div>
                     </div>
                     
                     <div class="row">
                      <label class="col-sm-2 col-form-label">BirthDate</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        <% 
                        if(mode.equals("Update"))
                        {
                        	
                        	%> <input class="form-control" value= "<%  Date d=new SimpleDateFormat("yyyy-mm-dd").parse(bday); 
                                     SimpleDateFormat s1=new SimpleDateFormat("mm/dd/yyyy");
                                     
                                     String bday2=s1.format(d);
                                     
                                     out.println(bday2);
                                     
                                     %>" type="datetime" name="birthdate" id="birthdate"><% 
                        }
                        else
                        {
                        	%><input class="form-control" type="date" name="birthdate" id="birthdate"><% 
                        }
                        %>
                        
                         
                        </div>
                      </div>
                     </div>
                     
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Gender</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                        <div class="form-control">
                          <input  type="radio" name="r1" id="r1" value="male" 
                          <% if(gen.equals("male"))
                          {
                            %>checked<% 
                          }
                        	  %> >&nbsp;Male
                          &nbsp;&nbsp;&nbsp;<input  type="radio" name="r1" id="r1"  <% if(gen.equals("female"))
                          {
                            %>checked<% 
                          }
                        	  %> value="female">&nbsp;Female
                          </div>
                        </div>
                      </div>
                     </div>
                     
                     <div class="row">
                      <label class="col-sm-2 col-form-label">Clinic<br>Address</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                         
                          <textarea class="form-control"  name="Address" id="Address"><%out.println(add); %></textarea>
                        </div>
                      </div>
                     </div>
                     
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Mobile</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" type="text"  value= "<%out.println(mno); %>"  name="Mobile" id="Mobile">
                           <span id="errormno"></span>
                        </div>
                      </div>
                     </div>
                     
                     
                     
                     <%
                    if(mode.equals("Update"))
                    {
                    	%> <div class="row">
                         <label class="col-sm-2 col-form-label">Department</label>
                         <div class="col-sm-7">
                           <div class="form-group">
                           
                             <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="degree" id="degree">
                               <option value="0"></option>
                               <option value="1" <%  
                               Integer t1=new Integer(degree);
                               
                               if(t1 == 1)
                               {
                               	%>selected<% 
                               	
                               } %>>Primary Care</option>
                               
                               <option value="2" <%  Integer t2=new Integer(type);
                               
                               if(t2 == 2)
                               {
                               	%>selected<% 
                               	
                               } %>>Cardiologist</option>
                               <option value="3"   <%  Integer t3=new Integer(type);
                               
                               if(t3 == 3)
                               {
                               	%>selected<% 
                               	
                               } %>>Dermatologist</option>
                               
                               <option value="4"   <%  Integer t4=new Integer(type);
                               
                               if(t4 == 4)
                               {
                               	%>selected<% 
                               	
                               } %>>Pediatrician</option>
                                <option value="5"   <%  Integer t5=new Integer(type);
                               
                               if(t5 == 5)
                               {
                               	%>selected<% 
                               	
                               } %>>Neurologist</option>
                                <option value="6"   <%  Integer t6=new Integer(type);
                               
                               if(t6 == 6)
                               {
                               	%>selected<% 
                               	
                               } %>>Psychiatrist</option>
                                <option value="7"   <%  Integer t7=new Integer(type);
                               
                               if(t7 == 7)
                               {
                               	%>selected<% 
                               	
                               } %>>Gynecologist</option>
                                <option value="8"   <%  Integer t8=new Integer(type);
                               
                               if(t8 == 8)
                               {
                               	%>selected<% 
                               	
                               } %>>Urologist</option>
                                <option value="9"   <%  Integer t9=new Integer(type);
                               
                               if(t9 == 9)
                               {
                               	%>selected<% 
                               	
                               } %>>Radiologist</option>
                                <option value="10"   <%  Integer t10=new Integer(type);
                               
                               if(t10 == 10)
                               {
                               	%>selected<% 
                               	
                               } %>>Orthopedist</option>
                                <option value="11"   <%  Integer t11=new Integer(type);
                               
                               if(t11 == 11)
                               {
                               	%>selected<% 
                               	
                               } %>>Immunologist</option>
                               
                             </select>
                        
                              <span id="errortype"></span>
                           </div>
                         </div>
                        </div>
                       <% 
                    }
                    
                    else
                    {
                    	
                    	%> <div class="row">
                        <label class="col-sm-2 col-form-label">Department</label>
                        <div class="col-sm-7">
                          <div class="form-group">
                          
                            <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="degree" id="degree">
                              <option value="0"></option>
                              <option value="1" >Primary Care</option> 
                              <option value="2">Cardiologist</option>
                              <option value="3" >Dermatologist</option>
                              <option value="4" >Pediatrician</option>
                              <option value="5" >Neurologist</option>
                              <option value="6" >Psychiatrist</option>
                              <option value="7" >Gynecologist</option>
                              <option value="8" >Urologist</option>
                              <option value="9" >Radiologist</option>
                              <option value="10" >Orthopedist</option>
                              <option value="11" >Immunologist</option>
                              <option value="12">Dentist</option>
                            </select>
                       
                             <span id="errortype"></span>
                          </div>
                        </div>
                       </div>
                      <%
                    }
                    
                    
                    
                    %>
                     
                     
                     
                     
                     
                     
                      <div class="row">
                      <label class="col-sm-2 col-form-label">Experience</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control"  value= "<%out.println(exp); %>"  type="text" name="Exp" id="Exp">
                           <span id="errorexp"></span>
                        </div>
                      </div>
                     </div>
                     
                                  
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Email</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control"  value= "<%out.println(email); %>"  type="email" name="email" id="email" >
                          <span id="erroremail"></span>
                        </div>
                      </div>
                    </div>
                    <%
                    if(mode.equals("Update"))
                    {
                    	%> <div class="row">
                         <label class="col-sm-2 col-form-label">Service</label>
                         <div class="col-sm-7">
                           <div class="form-group">
                           
                             <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="type" id="type">
                               <option value="0"></option>
                               <option value="1" <%  
                               Integer t1=new Integer(type);
                               
                               if(t1 == 1)
                               {
                               	%>selected<% 
                               	
                               } %>>Clinic Services</option>
                               
                               <option value="2" <%  Integer t2=new Integer(type);
                               
                               if(t2 == 2)
                               {
                               	%>selected<% 
                               	
                               } %>>Home Visit</option>
                               <option value="3"   <%  Integer t3=new Integer(type);
                               
                               if(t3 == 3)
                               {
                               	%>selected<% 
                               	
                               } %>>Both</option>
                               
                             </select>
                        
                              <span id="errortype"></span>
                           </div>
                         </div>
                        </div>
                       <% 
                    }
                    
                    else
                    {
                    	
                    	%> <div class="row">
                        <label class="col-sm-2 col-form-label">Service</label>
                        <div class="col-sm-7">
                          <div class="form-group">
                          
                            <select class="selectpicker" data-size="7" data-style="btn btn-primary btn-round"  name="type" id="type">
                              <option value="0"></option>
                              <option value="1" >Clinic Services</option>
                              
                              <option value="2">Home Visit</option>
                              <option value="3" >Both</option>
                              
                            </select>
                       
                             <span id="errortype"></span>
                          </div>
                        </div>
                       </div>
                      <%
                    }
                    
                    
                    
                    %>
                    
                    
                    <div class="row">
                      <label class="col-sm-2 col-form-label">Password</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input class="form-control" type="password"  value= "<%out.println(psw); %>"  name="password" id="password" >
                          <span id="errorpsw"></span>
                        </div>
                      </div>
                     
                    </div>
                   
                   
                   <div class="row">
                      <label class="col-sm-2 col-form-label">Your<br>image</label>
                      <div class="col-sm-5">
                        <div class="form-group">
                     
                      <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                       
                        <div class="fileinput-preview fileinput-exists thumbnail img-circle"></div>
                        <div>
                          <span class="btn btn-round btn-rose btn-file">
                            <span class="fileinput-new"><%out.println(img); %></span>
                            
                            <input type="file"   name="image" id="image">
                            
                          </span>
                           
                          <br />
                         
                        </div>
                      </div>
      
                           <span id="errorimg"></span>
                        </div>
                      </div>
                     </div>
                     
                     <div class="row">
                      <label class="col-sm-2 col-form-label">Your<br>license</label>
                      <div class="col-sm-5">
                        <div class="form-group">
                     
                      <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                       
                        <div class="fileinput-preview fileinput-exists thumbnail img-circle"></div>
                        <div>
                          <span class="btn btn-round btn-rose btn-file">
                            <span class="fileinput-new"><%out.println(lic); %></span>
                            
                            <input type="file"   name="license" id="license">
                            
                          </span>
                           
                          <br />
                         
                        </div>
                      </div>
      
                           <span id="errorlic"></span>
                        </div>
                      </div>
                     </div>
                   
                  <div class="card-footer ml-auto mr-auto">
                    <input type="submit" class="btn btn-rose" name="submit" id="submit" value="Submit Details">
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
  <script src="../../assets/js/styledc.js"></script>
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