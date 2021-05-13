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

    <%
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
	%>

	<!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    
    
	<jsp:include page="headerlab.jsp"></jsp:include>
	
	
	
	<%

		String img="",name="",id="",email="",phno="",add="",time="";
		if(session.getAttribute("img") != null)
		{
			img=session.getAttribute("img").toString();
		}
		
		 if(session.getAttribute("lab") != null)
			name=session.getAttribute("lab").toString();
		if(session.getAttribute("labid") != null)
			id=session.getAttribute("labid").toString();	 
		
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from lab_tbl where iLabId="+id;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				email=dt.rs.getString("vLabEmail");
				add=dt.rs.getString("vLabAddress");
				phno=dt.rs.getString("iLabPhno");
				//img=dt.rs.getString("vImage");
				time=dt.rs.getString("vLabTime");
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
                    <div >
                        <img src="../assets/img/lab/<%out.println(img); %>" alt="Thumb">
                        <div class="social">
                           
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="info">
                        <h2><%out.println(name);%></h2>
                        <h4><%out.println("Email : "+email); %></h4>
                        <h4><%out.println("Mobile : "+phno); %></h4>
                        <h4><%out.println("Cinic Address : "+add); %></h4>
                        <h4><%out.println("Time : "+time); %></h4>
                        <a class="btn btn-theme border btn-md" href="Changepsw.jsp">Change Password</a>
                        <a class="btn btn-theme border btn-md" href="Edit.jsp">Edit Profile</a><br>                  
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
                                    Phlebotomist
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab3" aria-expanded="false">
                                    Tests
                                </a>
                            </li>
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
                                    Data dt=new Data();
                                    dt.st=dt.cn.createStatement();
                                    String select;
                                    int cnt=0;
	                                    try{
	                                    	String date="",pat_nm="",link;
	                            			
	                            			String ids[]=new String[100];
	                            			cnt=0;
	                            			
	                            			select="select distinct iPatientId from testappointment_tbl order by dAppointdate desc";
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
			                            			out.println("<li>"+pat_nm +"<div class=\"pull-right\">");
			                            			out.println("<a href=\"Details.jsp?id="+ids[i]+"\">Details</a></div></li>");
			                            		
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
                             <div id="tab2" class="tab-pane fade">
                                <div class="info title">
                                    <h3>Your Phlebotomist</h3>
                                    <ul>
                                    <%
                                    	try{
                                    		select="select * from phlebotomist_tbl where eStatus like 'A'";
                                    		dt.rs=dt.st.executeQuery(select);
                                    		cnt=0;
	                            			while(dt.rs.next())
	                            			{	cnt++;
	                            				out.println("<li>"+dt.rs.getString("vPhleboName") +"<div class=\"pull-right\">");
		                            			out.println("<a href=\"PhlebotomistDetails.jsp?id="+dt.rs.getString("iPhleboId")+"\"> ");
		                            			out.println("Details</a></div></li>");
	                            			}
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Phlebotomist Yet-----</li>");
	                            			}
                                    	}
	                            		catch(Exception e)
	                            		{ out.println(e);}
                                    %>
                                    </ul>
                                 </div>
                              </div>
                             <div id="tab3" class="tab-pane fade">
                                <div class="info title">
                                    <h3>Your Tests
                                    <span class="pull-right btn btn-theme border btn-md">
                                    <a href="AddTest.jsp">Add Test</a></span></h3>
                                    <br>
                                    <ul>
                                    <%
                                    	try{
                                    		select="select * from test_tbl where eStatus like 'A'";
                                    		dt.rs=dt.st.executeQuery(select);
                                    		cnt=0;
	                            			while(dt.rs.next())
	                            			{	cnt++;
	                            				out.println("<li>"+dt.rs.getString("vTestName") +"<div class=\"pull-right\">");
		                            			out.println("<a href=\"TestDetails.jsp?id="+dt.rs.getString("iTestId")+"\">");
		                            			out.println("Details</a></div></li>");
	                            			}
	                            			if(cnt==0)
	                            			{
	                            				out.println("<li>&nbsp;&nbsp;&nbsp;&nbsp;-----No Test Yet-----</li>");
	                            			}
                                    	}
         								catch(Exception e)
                                    	{out.println(e);}
                                    %>
                                    </ul>
                                 </div>
                              </div>
						
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