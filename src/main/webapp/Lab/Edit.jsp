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
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
	%> -

	<jsp:include page="headerlab.jsp"></jsp:include> 
	<%
		String name="",id="1",email="",phno="",gen="",add="",tym="";
		if(session.getAttribute("labid") != null)
			id=session.getAttribute("labid").toString();	 
		
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from lab_tbl where iLabId="+id;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				name=dt.rs.getString("vLabName");
				phno=dt.rs.getString("iLabPhno");
				add=dt.rs.getString("vLabAddress");	
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
	
	
	<div class="banner-area responsive-auto-height text-small" style="height:545px;">
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
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Name :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="name" name="name" value="<% out.println(name); %>" type="text">
                                                         <span style="color: red" id="errorname"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             
                                            <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Phone No :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="phone" name="phone" value="<% out.println(phno); %>" type="text">
                                                         <span  style="color: red" id="errormobile"></span>
                                                    </div>
                                                </div>
                                             </div>
                                            
                                             <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:18px;">Lab Address :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
														<textarea class="form-control" id="address" name="address" cols="40" rows="3" placeholder="<%out.println(add);%>"></textarea>
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
                                    <script src="assets/js/EditLabjs.js"></script>
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