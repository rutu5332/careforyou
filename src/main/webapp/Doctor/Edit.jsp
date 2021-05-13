<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Storage.Data" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
</head>
<body>
	<%
		if(session.getAttribute("doctor") == null)
			response.sendRedirect("../LoginDoctor.jsp");
	%>

	<jsp:include page="headerdc.jsp"></jsp:include> 
	<%
		String fname="",lname="",id="0",email="",phno="",gen="",fees="",add="",typ="",tnm="";
		if(session.getAttribute("docid") != null)
			id=session.getAttribute("docid").toString();	 
		
		int uid=Integer.parseInt(id);
		/* System.out.println("id : "+uid); */
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from doctorinfo_tbl where iDoctorId="+uid;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				fname=dt.rs.getString("vFirstName");
				lname=dt.rs.getString("vLastName");
				gen=dt.rs.getString("vGender");
				phno=dt.rs.getString("vMobile");
				fees=dt.rs.getString("iFees");
				add=dt.rs.getString("vClinicAdd");
				typ=dt.rs.getString("iWorkType");
	
				if(typ.equals("3"))
					tnm="Both";
				else if(typ.equals("2"))
					tnm="Clinic Service";
				else
					tnm="Home Visit";
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
	
	
	<div class="banner-area responsive-auto-height text-small">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/15.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-6 col-sm-6">
                                    <!-- <h1 data-animation="animated slideInRight">Best care for your <span> Good health</span></h1> -->
                                </div>

                                <!-- Start Login Form -->
                                <div class="col-md-6 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Edit</h2>
                                        </div>
                                        <form action="EditSub.jsp" method="post" name="editDoc">
                                        	<div class="row">
                                            	<div class="col-md-3"><div style="font-size:18px;">First &nbsp; Name :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="fname" name="fname" value="<% out.println(fname); %>" type="text">
                                                         <span style="color: red" id="errorfname"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row">
                                            	<div class="col-md-3"><div style="font-size:18px;">Last &nbsp; Name :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="lname" name="lname" value="<% out.println(lname); %>" type="text">
                                                         <span style="color: red" id="errorlname"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             
                                             <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Gender :</div></div>
												<div class="col-md-8">
													<div class="form-group">
														<select id="gender" name="gender">
															<option value="<%out.println(gen);%>"><%out.println(gen);%></option>
															<option value="Male">Male</option>
															<option value="Female">Female</option>
															<option value="Other">Other</option>
														</select> <span style="color: red" id="errorgen"></span>
													</div>

												</div>
											</div>
                                             
                                            <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Mobile :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="phone" name="phone" value="<% out.println(phno); %>" type="text">
                                                         <span  style="color: red" id="errormobile"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             
                                             <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Fees :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="fees" name="fees" value="<% out.println(fees); %>" type="text">
                                                         <span  style="color: red" id="errorfees"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row">
                                            	<div class="col-md-3"><div style="font-size:18px;">Service Type :</div></div>
                                                <div class="col-md-8">
                                            		 <div class="form-group">
														<select name="type" id="type">
															<option value="<%out.println(typ);%>"><%out.println(tnm); %></option>
															<option  value="1">Home Visit</option>
															<option  value="2">Clinic Service</option>
															<option  value="3">Both</option>
														</select>
														<span id="errortype" style="color: red"></span>
													</div>
												</div>
											</div>
                                             <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Clinic Address :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
														<textarea class="form-control" id="address" name="address" cols="40" rows="2" placeholder="<%out.println(add);%>"></textarea>
														<span id="erroradd" style="color: red;"></span>
													</div>
                                                </div>
                                             </div>
                                             
                                              
											
                                              <div class="row">
                                                <div class="col-md-12">
                                                    <button type="submit" name="submit" id="editsub">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <script src="assets/js/EditDocjs.js"></script>
                                </div>
                                <!-- End Login Form -->
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="assets/js/Editjs.js"></script>
</body>
</html>