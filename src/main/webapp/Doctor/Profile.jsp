<%@page import="Storage.Data" %>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- ========== Page Title ========== -->
    <title>Profile</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

</head>
<body>

	<!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
	<jsp:include page="headerdc.jsp"></jsp:include>
	
	
	
	<%
		if(! (session.getAttribute("type")).toString().equalsIgnoreCase("doctor"))
			response.sendRedirect("../index.jsp");
		String img,name="",id="",email="",phno="",gen="",add="",deg="",exp="",fees="";
		if(session.getAttribute("img") == null)
		{
			img="user.png";
		}
		else
		{
			img=session.getAttribute("img").toString();
		}
		//System.out.println(img);
		id="0";
		if(session.getAttribute("doctor") != null)
			name=session.getAttribute("doctor").toString();
		if(session.getAttribute("docid") != null)
			id=session.getAttribute("docid").toString();	 
		
		//int did=Integer.parseInt(id);
		/* System.out.println("id : "+uid); */
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from doctorinfo_tbl where iDoctorId="+id;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				email=dt.rs.getString("vEmail");
				gen=dt.rs.getString("vGender");
				add=dt.rs.getString("vClinicAdd");
				phno=dt.rs.getString("vMobile");
				deg=dt.rs.getString("vDegree");
				exp=dt.rs.getString("iExperience");
				fees=dt.rs.getString("iFees");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		//System.out.println(img);
	%>
	
	<div class="doctor-details-area default-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="thumb">
                        <img src="../assets/img/doctors/<%out.println(img); %>" alt="Thumb">
                        <div class="social">
                            <form action="../UploadDoc" method="post" enctype="multipart/form-data">
                            	<input type=file name="fnm" style="float:left;border:none;margin-top:20px;">
                            	<span style="color:red;">
                            		<%-- <%
	                            		String msg;
	        							msg=request.getParameter("msg");
	                            		if(msg!=null)
	                            		{
	                            			out.println("please select photo.");
	                            		}
                            		%> --%>
                            	</span>
                            	<b> <input type="submit" value="OK" style="float:left;width:50px;height:20px;"></b>
                            </form>
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="info">
                        <h2>DR. <%out.println(name);%></h2>
                        <h4><%out.println("Email : "+email); %></h4>
                        <h4><%out.println("Mobile : "+phno); %></h4>
                        <h4><%out.println("Gender : "+gen); %></h4>
                        <h4><%out.println("Cinic Address : "+add); %></h4>
                        <h4><%out.println("Degree : "+deg); %></h4>
                        <h4><%out.println("Expeirence : "+exp); %></h4>
                        <h4><%out.println("Fees : "+fees); %></h4>
                        <a class="btn btn-theme border btn-md" href="Changepsw.jsp">Change Password</a>
                        <a class="btn btn-theme border btn-md" href="Edit.jsp">Edit Profile</a><br>
                        <a class="btn btn-theme border btn-md" href="Time.jsp">Change Timings</a>
                        
                        <br>
                        <!-- <h3>History</h3> -->
                        
                         <!-- Tab Nav -->
                        <ul class="nav nav-pills">
                            <li class="active">
                                <a data-toggle="tab" href="#tab1" aria-expanded="true">
                                    Appointments
                                </a>
                            </li>
                           <li>
                                <a data-toggle="tab" href="#tab2" aria-expanded="false">
                                   Timings
                                </a>
                            </li>
                           <!--  <li>
                                <a data-toggle="tab" href="#tab3" aria-expanded="false">
                                    Orders
                                </a>
                            </li>  -->
                        </ul>
                        <!-- End Tab Nav -->
                        <!-- Start Tab Content -->
                        <div class="tab-content tab-content-info">
                            <!-- Single Item -->
                            <div id="tab1" class="tab-pane fade active in">
                                <div class="info title">
                                    <h3>Your Patients</h3>
                                    <ul>
                                    <%
	                                    try{
	                                    	String date="",pat_nm="",link;
	                            			Data dt=new Data();
	                            			String ids[]=new String[100];
	                            			int cnt=0;
	                            			dt.st=dt.cn.createStatement();
	                            			String select;//="select distinct * from docappointment_tbl a inner join patient_tbl p on a.iPatientId=p.iPatientId";
	                            			select="select distinct iPatientId from docappointment_tbl where iDoctorId="+id +"order by dAppointdate desc";
	                            			dt.rs=dt.st.executeQuery(select);
	                            			while(dt.rs.next())
	                            			{
	                            				ids[cnt++]=(dt.rs.getString("iPatientId"));
	                            			}
	                            			for(int i=0;i<cnt;i++)
	                            			{
	                            				select="select * from patient_tbl where iPatientId="+ids[i];
		                            			dt.rs=dt.st.executeQuery(select);
		                            			while(dt.rs.next())
		                            			{
		                            				pat_nm=dt.rs.getString("vFName")+" "+dt.rs.getString("vLName");
			                            			//date=dt.rs.getString("dAppointDate");
			                            			out.println("<li>"+pat_nm +"<div class=\"pull-right\"><a href=\"Details.jsp?id="+ids[i]+"\">Details</a></div></li>");
			                            		
		                            			}
	                            			}
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Appointments Yet-----</li>");
	                            			}
	                            		}
	                            		catch(Exception e)
	                            		{
	                            			out.println(e);
	                            		}
                                    %>
                                        
                                    </ul>
                                </div>
                            </div>
                            <!-- End Single Item -->
							
                            <!-- Single Item -->
                            <div id="tab2" class="tab-pane fade">
                                <div class="info title">
                                    <h3>Your Timings</h3>
                                   
                                    <%
                                    	//System.out.println(id);	
                                    	Data dt=new Data();
                                    	dt.st=dt.cn.createStatement();
                                    	String mon="",tue="",wed="",thur="",fri="",sat="";
	                                    String select_time = "select * from dctimehour_tbl where iDoctorId=" + id;
	                                    try{
		                            		dt.rs = dt.st.executeQuery(select_time);
		
		                            		while (dt.rs.next()) {
		                            			mon = dt.rs.getString("Mon");
		                            			tue = dt.rs.getString("Tue");
		                            			wed = dt.rs.getString("Wed");
		                            			thur = dt.rs.getString("Thur");
		                            			fri = dt.rs.getString("Fri");
		                            			sat = dt.rs.getString("Sat");
	                            			}
	                                    }
	                                    catch(Exception e)
	                                    {	System.out.println(e);}
                                    %>
                                    
                                    <ul>
	                    				<li><span> Monday : </span>
											<div class="pull-right"><%out.println(mon); %></div></li>
										<li><span> Tuesday : </span>
											<div class="pull-right"><%out.println(tue); %></div></li>
										<li><span> Wednesday : </span>
											<div class="pull-right"><%out.println(wed); %></div></li>
										<li><span> Thursday : </span>
											<div class="pull-right"><%out.println(thur); %></div></li>
										<li><span> Friday : </span>
											<div class="pull-right"><%out.println(fri); %></div></li>
										<li><span> Saturday : </span>
											<div class="pull-right"><% out.println(sat); %></div></li>                 
                                    </ul>
                                </div>
                            </div>  
                           

                           
                            <!-- <div id="tab3" class="tab-pane fade">
                                <div class="info title">
                                    <h3>Your Orders</h3>
                                    
                                    <ul>
                                        <li> <span> Mon - Tues :  </span>
                                          <div class="pull-right"> 6.00 am - 10.00 pm </div>
                                        </li>
                                        <li> <span> Wednes - Thurs :</span>
                                          <div class="pull-right"> 8.00 am - 6.00 pm </div>
                                        </li>
                                        <li> <span> Sun : </span>
                                          <div class="pull-right closed"> Closed </div>
                                        </li>
                                    </ul>
                                </div>
                            </div> -->
                           

                        </div>
                        <!-- End Tab Content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
	
</body>
</html>