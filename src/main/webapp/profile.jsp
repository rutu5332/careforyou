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
    <title>Profile</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
    <%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%>
	
	<%
		String img,name="",id="",email="",phno="",gen="",dob="";
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
		if(session.getAttribute("user") != null)
			name=session.getAttribute("user").toString();
		if(session.getAttribute("uid") != null)
			id=session.getAttribute("uid").toString();	 
		
		int uid=Integer.parseInt(id);
		/* System.out.println("id : "+uid); */
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from signup_tbl where iSignupId="+uid;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				email=dt.rs.getString("vEmail");
				gen=dt.rs.getString("vGender");
				//dob=dt.rs.getString("vUserAge");
				phno=dt.rs.getString("vMobile");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
	
	<div class="doctor-details-area default-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div>
                        <img src="assets/img/user/<%out.println(img); %>" alt="Thumb">
                        <div class="social">
                         <span style="color:red;">
                           <%
	                            String msg;
	        					msg=request.getParameter("msg");
	                      		if(msg!=null)
	                            {
	                            	out.println("<br>*please select photo.");
	                            }
                            %> 
                        </span>
                            <form action="UploadUser" method="post" enctype="multipart/form-data">
                            	<input type=file name="fnm" style="float:left;border:none;padding-top:15px;">
                            	
                            	<b> <input type="submit" value="OK" style="float:left;width:50px;height:20px;"></b>
                            </form>
                        </div>
                       
                    </div>
                    <span style="color:red;"><br><br>*please upload pic with your name and 10 digit phno.<br>ex. admin9632587452</span>
                </div>
                <div class="col-md-8">
                    <div class="info">
                        <h2><%out.println(name);%></h2>
                        <h4><%out.println("Email : "+email); %></h4>
                        <h4><%out.println("Mobile : "+phno); %></h4>
                        <h4><%out.println("Gender : "+gen); %></h4>
                       <%--  <h4><%out.println("DOB : "+dob); %></h4> --%>
                        <%-- <h4><%out.println(); %></h4> --%>
                        <a class="btn btn-theme border btn-md" href="Changepsw.jsp">Change Password</a>
                        <a class="btn btn-theme border btn-md" href="Edit.jsp">Edit Profile</a>
                        
                        <br>
                        <!-- <h3>History</h3> -->
                        
                         <!-- Tab Nav -->
                        <ul class="nav nav-pills">
                            <li class="active">
                                <a data-toggle="tab" href="#tab1" aria-expanded="true">
                                    Doctors' Appointment
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab2" aria-expanded="false">
                                    Pathology Lab's Appointment
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab3" aria-expanded="false">
                                    Orders
                                </a>
                            </li>
                        </ul>
                        <!-- End Tab Nav -->
                        <!-- Start Tab Content -->
                        <div class="tab-content tab-content-info">
                            <!-- Single Item -->
                            <div id="tab1" class="tab-pane fade active in">
                                <div class="info title">
                                    <h3>Your Doctors' Appointments</h3>
                                    <ul>
                                    <%
	                                    try{
	                                    	String date="",doc_nm="",link;
	                            			Data dt=new Data();
	                            			dt.st=dt.cn.createStatement();
	                            			String select="select a.dAppointDate,a.iSignupId,d.vFirstname,d.vLastName,a.iAppointId,a.eStatus from docappointment_tbl a ";
	                            			select+="inner join doctorinfo_tbl d on a.iDoctorId=d.iDoctorId order by a.dAppointDate desc";
	                            			dt.rs=dt.st.executeQuery(select);
	                            			int cnt=0;
	                            			while(dt.rs.next())
	                            			{
	                            				if(dt.rs.getString("iSignupId").equals(id) && dt.rs.getString("eStatus").equals("A")) 
	                            				{
		                            				doc_nm=dt.rs.getString("vFirstName")+" "+dt.rs.getString("vLastName");
		                            				date=dt.rs.getString("dAppointDate");
		                            				link=dt.rs.getString("iAppointId");
		                            				out.println("<li>"+date + "&nbsp;&nbsp;&nbsp; Dr."+ doc_nm +"<div class=\"pull-right\"><a href=\"Details.jsp?aid="+ link +"\">Details</a></div></li>");
		                            				cnt++;
	                            				} 
	                            			}
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Appointments Yet-----<div class=\"pull-right\"><a href=\"doctors.jsp\">Make Appointment</a></div></li>");
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
                                    <h3>Your lab's Appointments</h3>
                                    
                                    <ul>
                                        <%
	                                    try{
	                                    	String date="",test_nm="",link;
	                            			Data dt=new Data();
	                            			dt.st=dt.cn.createStatement();
	                            			//String select="select a.dAppointDate,a.iSignupId,d.vFirstname,d.vLastName,a.iAppointId from docappointment_tbl a inner join doctorinfo_tbl d on a.iDoctorId=d.iDoctorId";
	                            			String select="select a.dAppointDate,a.iSignupId,a.iTappointId,t.vTestName,a.eStatus from testappointment_tbl a ";
	                            					select+="inner join test_tbl t on a.iTestId=t.iTestId where iSignupId="+id + " order by a.dAppointDate desc";
	                            			dt.rs=dt.st.executeQuery(select);
	                            			int cnt=0;
	                            			while(dt.rs.next())
	                            			{
	                            				if(dt.rs.getString("iSignupId").equals(id) && dt.rs.getString("eStatus").equals("A")) 
	                            				{
		                            				test_nm=dt.rs.getString("vTestName");
		                            				date=dt.rs.getString("dAppointDate");
		                            				link=dt.rs.getString("iTappointId");
		                            				out.println("<li>"+date + "&nbsp;&nbsp;&nbsp;\t"+ test_nm +"<div class=\"pull-right\"><a href=\"Details.jsp?tid="+ link +"\">Details</a></div></li>");
		                            				cnt++;
	                            				} 
	                            			}
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Appointments Yet-----<div class=\"pull-right\"><a href=\"Lab.jsp\">Make Appointment</a></div></li>");
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
                            <div id="tab3" class="tab-pane fade">
                                <div class="info title">
                                    <h3>Your Orders</h3>
                                    
                                    <ul>
                                        <%
	                                    try{
	                                    	String date="",link="",pay="";
	                            			Data dt=new Data();
	                            			dt.st=dt.cn.createStatement();
	                            			//String select="select a.dAppointDate,a.iSignupId,d.vFirstname,d.vLastName,a.iAppointId from docappointment_tbl a inner join doctorinfo_tbl d on a.iDoctorId=d.iDoctorId";
	                            			String select="select * from order_tbl where iSignupId = "+uid +" && eStatus like 'A' order by dOrderDate desc ";
	                            			dt.rs=dt.st.executeQuery(select);
	                            			int cnt=0;
	                            			while(dt.rs.next())
	                            			{
	                            				date = dt.rs.getString("dOrderDate") ;
	                            				pay = dt.rs.getString("dPayment") ;
	                            				link = dt.rs.getString("iOrderId");
	                            				out.println("<li>"+date + "&nbsp;&nbsp;&nbsp;\t oid#"+ date.substring(0,4) + link +"&nbsp;&nbsp;&nbsp;"+pay);
		                            			out.println("<div class=\"pull-right\"><a href=\"Details.jsp?oid="+ link +"\">Details</a></div></li>");
		                            			cnt++;
	                            			}
	                            			
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Orders Yet-----<div class=\"pull-right\"><a href=\"Pharmacy.jsp\">Make order</a></div></li>");
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

                        </div>
                        <!-- End Tab Content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>